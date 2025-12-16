import 'dart:async';
import 'dart:math';

import 'package:btccloudmining/ad_modual/reward_interstitial/int_rwd_admanger.dart';
import 'package:btccloudmining/dashboard/model/active_bot_model.dart';
import 'package:btccloudmining/dashboard/model/appdataset_model.dart';
import 'package:btccloudmining/dashboard/model/sub_details_model.dart';
import 'package:btccloudmining/dashboard/model/user_model.dart';
import 'package:btccloudmining/dashboard/model/withdraw_details_model.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeCtrl extends GetxController {
  RxBool isPurchase = false.obs;

  Timer? activeMinerCount;
  RxDouble activeHashRate = 5.3.obs;
  RxDouble totalMineBtc = 0.000000000000.obs;
  RxDouble totalReferralBtc = 0.000000000000.obs;
  RxDouble miningBtc = 0.000000000000.obs;
  RxBool isMining = false.obs;
  RxInt activeMiners = 13000.obs;
  RxInt selectedPlanIndex = 0.obs;
  RxInt planAdIndex = 10.obs;
  RxInt selectedLanguage = 0.obs;
  RxString languageCode = ''.obs;
  RxBool isChangingLanguage = false.obs;

  RxDouble setRating = 2.0.obs;
  RxList<UserSubIdData> userActiveBotList = <UserSubIdData>[].obs;

  // store
  Rx<SubDetailsModel> subDetailsModel = SubDetailsModel().obs;

  RxList<ActiveBotModel> activeBotList = <ActiveBotModel>[].obs;
  RxList<Leaderboard> leaderBoardList = <Leaderboard>[].obs;
  Rx<WithdrawDetailsModel> withdrawDetailsModel = WithdrawDetailsModel().obs;
  RxList<WDData> withdrawDetailsList = <WDData>[].obs;

  RxList<ListPlan> subscriptionPlanList = <ListPlan>[].obs;
  // Rx<ListPlan> storeItemData = ListPlan().obs;
  Rx<ListPlan> randomPlan = ListPlan().obs;
  Rx<Plans?> selectPlanDetails = Plans().obs;


  Rx<planD> sItemData = planD().obs;

  void getActiveSubscription() async {
    try {
      EasyLoading.show();

      userActiveBotList.clear();

      final email = HiveService().getData<String>(AppConfig.userEmail);
      final UserProfileModel userProfileModel = await ApiRepo.userLogin(
        email: email,
        reference: '',
        firstTime: '',
      );
      final now = DateTime.now();

      final activeSubs = (userProfileModel.subscription ?? []).where((sub) {
        if (sub.addTime == null || sub.durationSeconds == null) {
          return false;
        }

        try {
          final endTime = DateTime.parse(sub.expireTime ?? '');
          final isActive = endTime.isAfter(now);
          return isActive;
        } catch (e) {
          return false;
        }
      }).toList();

      userActiveBotList.addAll(activeSubs);

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
    }
  }

  Future<void> getSubDetails() async {
    try {
      EasyLoading.show();

      leaderBoardList.clear();
      subscriptionPlanList.clear();
      String? email = HiveService().getData<String>(AppConfig.userEmail);
      subDetailsModel.value = await ApiRepo.subscriptionDetails(email: email ?? "");
      isPurchase.value = subDetailsModel.value.purchase ?? false;

      subscriptionPlanList.addAll(subDetailsModel.value.listPlan ?? []);
      leaderBoardList.addAll(subDetailsModel.value.leaderboard ?? []);
      shoeRandomPlan();
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      debugPrint("$e");
      return;
    }
  }

  Future<void> getWithdrawDetails() async {
    withdrawDetailsList.clear();
    withdrawDetailsModel.value = await ApiRepo.viewWithdrawDetails(
      email: HiveService().getData<String>(AppConfig.userEmail),
    );
    withdrawDetailsList.addAll(withdrawDetailsModel.value.data ?? []);
  }

  void shoeRandomPlan() {
    final random = Random();
    randomPlan.value = subscriptionPlanList[random.nextInt(subscriptionPlanList.length)];
  }

  @override
  void onInit() {
    super.onInit();
    appDataSet();
  }

  appDataSet() async {
    AppDataSetModel appDataSetModel = await ApiRepo.appDataSet();
    AppConfig.appDataSet = appDataSetModel.appDataSet;
    AppConfig.referEarn = appDataSetModel.appDataSet?.referEarn ?? 0.000000005000;
    startRandomActiveMinerCount(
      minMiners: appDataSetModel.appDataSet?.minMiners ?? 25000,
      maxMiners: appDataSetModel.appDataSet?.maxMiners ?? 45000,
    );
    IntOrRwdAdManger().initAds();
  }

  void startRandomActiveMinerCount({int minMiners = 13000, int maxMiners = 45000}) {
    activeMinerCount = Timer.periodic(const Duration(seconds: 5), (_) {
      activeMiners.value = minMiners + Random().nextInt(maxMiners);
    });
  }

  Future<void> getActiveBooster() async {
    try {
      final allMiners = HiveService().getAll('brm_activeBot_box').cast<ActiveBotModel>();

      final now = DateTime.now();

      final validMiners = <ActiveBotModel>[];
      final expiredMiners = <ActiveBotModel>[];

      for (final miner in allMiners) {
        final start = DateTime.fromMillisecondsSinceEpoch(miner.addTime);
        final endTime = start.add(Duration(seconds: miner.duration));

        if (endTime.isAfter(now)) {
          validMiners.add(miner);
        } else {
          expiredMiners.add(miner);
        }
      }

      for (final miner in expiredMiners) {
        await miner.delete();
      }

      activeBotList.assignAll(validMiners);
    } catch (e) {
      debugPrint("Error loading boosters: $e");
    }
  }

  void updateRemaining() async {
    final now = DateTime.now();
    final stillValid = <ActiveBotModel>[];

    for (final miner in activeBotList) {
      final start = DateTime.fromMillisecondsSinceEpoch(miner.addTime);
      final endTime = start.add(Duration(seconds: miner.duration));
      if (endTime.isAfter(now)) {
        stillValid.add(miner);
      } else {
        await miner.delete();
      }
    }

    activeBotList.assignAll(stillValid);
  }

  Duration remainingTime(ActiveBotModel miner) {
    final endTime = DateTime.fromMillisecondsSinceEpoch(
      miner.addTime,
    ).add(Duration(seconds: miner.duration));
    final remaining = endTime.difference(DateTime.now());

    if (remaining.isNegative || remaining.inSeconds == 0) {
      Future.microtask(() {
        updateRemaining();
      });
    }
    return remaining.isNegative ? Duration.zero : remaining;
  }
}

/*

  void getActiveMiner() async {
    EasyLoading.show();

    try {
      activeBotList.clear();

      final allMiners = HiveService().getAll('brm_activeBot_box').cast<ActiveBotModel>();
      final now = DateTime.now();
      final validMiners = <ActiveBotModel>[];

      for (final miner in allMiners) {
        final start = DateTime.fromMillisecondsSinceEpoch(miner.addTime);
        final endTime = start.add(Duration(seconds: miner.duration));

        if (endTime.isAfter(now)) {
          validMiners.add(miner);
        } else {
          await miner.delete();
        }
      }

      activeBotList.addAll(validMiners);

      final email = HiveService().getData<String>(AppConfig.userEmail);
      final UserProfileModel userProfileModel = await ApiRepo.userLogin(
        email: email,
        reference: '',
        firstTime: '',
      );

      final activeSubs = (userProfileModel.subscription ?? []).where((sub) {
        if (sub.addTime == null || sub.durationSeconds == null || sub.type != 'Paid') {
          return false;
        }

        try {
          final endTime = DateTime.parse(sub.expireTime ?? '');
          final isActive = endTime.isAfter(now);
          return isActive;
        } catch (e) {
          return false;
        }
      }).toList();

      for (UserSubIdData sub in activeSubs) {
        activeBotList.add(ActiveBotModel(
          productID: sub.productID.toString(),
          botType: sub.botType.toString(),
          type: sub.type.toString(),
          power: '${sub.power.toString()} ${sub.powerType.toString()}',
          machineType: sub.durationType.toString(),
          duration: sub.durationSeconds ?? 0,
          addTime: DateTime.parse(sub.addTime ?? '').millisecondsSinceEpoch,
          expireTime: DateTime.parse(sub.expireTime ?? '').millisecondsSinceEpoch,
          days: sub.days,
        ));
      }
    } catch (e) {
      EasyLoading.showError("Failed to load miners");
    } finally {
      EasyLoading.dismiss();
    }
  }

 */
