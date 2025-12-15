import 'dart:async';
import 'package:btccloudmining/ad_modual/app_open.dart';
import 'package:btccloudmining/ad_modual/interstitial.dart';
import 'package:btccloudmining/ad_modual/rewarded.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/sub_details_model.dart';
import 'package:btccloudmining/dashboard/page/home.dart';
import 'package:btccloudmining/dashboard/page/setting.dart';
import 'package:btccloudmining/dashboard/page/store.dart';
import 'package:btccloudmining/dashboard/page/wallet.dart';
import 'package:btccloudmining/dashboard/repository/daily_reward.dart';
import 'package:btccloudmining/dashboard/repository/daily_reward_two.dart';
import 'package:btccloudmining/dashboard/repository/start_time_rp.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/dashboard/service/connection_service.dart';
import 'package:btccloudmining/dashboard/service/subscription_service.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> with WidgetsBindingObserver {
  final pages = [const HomePage(), const StorePage(), const WalletPage(), const SettingPage()];
  final HomeCtrl homeCtrl = Get.find();
  final subscriptionService = SubscriptionService();
  late StreamSubscription<FGBGType> subscription;

  @override
  void initState() {
    loadVersion();
    ConnectionService.instance.listenForStatusChange(context);
    WidgetsBinding.instance.addObserver(this);
    loadActiveMiners();
    appInForGroundOrBackGround();
    super.initState();
  }

  bool _wasInBackground = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final bool isAnyAdShowing = RewardedAdManager().isShowingAd || InterstitialAdManager().isShowingAd;
    if (isAnyAdShowing) {
      return;
    }
    if (state == AppLifecycleState.paused) {
      _wasInBackground = true;
      StartTimeService().saveMiningState();
    } else if (state == AppLifecycleState.resumed) {
      if (_wasInBackground) {
        _wasInBackground = false;
        StartTimeService().resumeMiningFromStorage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if ([1, 2, 3].contains(AppConfig.bottomBarValue.value)) {
          AppConfig.bottomBarValue.value = 0;
        } else {
          Navigation.pushNamed(Routes.exitPage);
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.newBg,
        body: ValueListenableBuilder(
          valueListenable: AppConfig.bottomBarValue,
          builder: (BuildContext context, int value, Widget? child) {
            return pages[value];
          },
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: AppConfig.bottomBarValue,

          builder: (BuildContext context, int bValue, _) {
            return Theme(
              data: Theme.of(
                context,
              ).copyWith(splashColor: Colors.transparent, highlightColor: Colors.transparent),
              child: BottomNavigationBar(
                backgroundColor: AppColor.newCard,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColor.primary,
                unselectedItemColor: AppColor.subText.withAlpha(150),
                selectedLabelStyle: textMontserrat(context, fontSize: 0),
                unselectedLabelStyle: subTextMontserrat(context, fontSize: 0),
                currentIndex: bValue,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                onTap: (value) async {
                  AppConfig.bottomBarValue.value = value;
                  InterstitialAdManager().showInterstitialByCount();
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      height: 35,
                      width: 38,
                      decoration: BoxDecoration(
                        color: AppConfig.bottomBarValue.value == 0
                            ? AppColor.accent.withAlpha(30)
                            : AppColor.newBg,
                        border: Border.all(
                          color: AppConfig.bottomBarValue.value == 0 ? AppColor.accent : AppColor.newBg,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(AppAsset.home, scale: 3),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      height: 35,
                      width: 38,
                      decoration: BoxDecoration(
                        color: AppConfig.bottomBarValue.value == 1
                            ? AppColor.accent.withAlpha(30)
                            : AppColor.newBg,
                        border: Border.all(
                          color: AppConfig.bottomBarValue.value == 1 ? AppColor.accent : AppColor.newBg,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(AppAsset.lighting, scale: 3),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      height: 35,
                      width: 38,
                      decoration: BoxDecoration(
                        color: AppConfig.bottomBarValue.value == 2
                            ? AppColor.accent.withAlpha(30)
                            : AppColor.newBg,
                        border: Border.all(
                          color: AppConfig.bottomBarValue.value == 2 ? AppColor.accent : AppColor.newBg,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(AppAsset.wallet, scale: 3).pOnly(left: 1.5),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      height: 35,
                      width: 38,
                      decoration: BoxDecoration(
                        color: AppConfig.bottomBarValue.value == 3
                            ? AppColor.accent.withAlpha(30)
                            : AppColor.newBg,
                        border: Border.all(
                          color: AppConfig.bottomBarValue.value == 3 ? AppColor.accent : AppColor.newBg,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        AppAsset.setting,
                        key: ValueKey<bool>(AppConfig.bottomBarValue.value == 3),
                        scale: 3,
                      ),
                    ),
                    label: '',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    ConnectionService.instance.cancelConnectionListener();
    WidgetsBinding.instance.removeObserver(this);
    await WakelockPlus.disable();
  }

  void loadVersion() async {
    await WakelockPlus.enable();
    homeCtrl.getSubDetails();
    DailyRewardService().init();
    DailyRewardServiceTwo().init();
    final bool? isInstall = HiveService().getData<bool>(AppConfig.isInstall);

    if (isInstall == null) {
      final restoredPurchases = await subscriptionService.restorePurchases();

      final email = HiveService().getData<String>(AppConfig.userEmail);
      await ApiRepo.userLogin(email: email, reference: '', firstTime: 'yes');

      for (var purchase in restoredPurchases) {
        for (var plan in homeCtrl.subscriptionPlanList) {
          final plans = plan.plans ?? <Plans>[];
          for (var planDetail in plans) {
            if (planDetail.planId == purchase.productID) {
              await ApiRepo.getSubDetails(
                email: email,
                botType: plan.planName,
                plan: planDetail.planId,
                power: plan.hashrate,
                durationSeconds: planDetail.durationSeconds.toString(),
                durationType: planDetail.renetalDays.toString(),
                powerType: '',
                type: '',
                addTime: formatUtcMillisToLocal(purchase.transactionDate),
                token: purchase.verificationData.serverVerificationData,
                productID: purchase.productID,
                purchaseStatus: purchase.status.name,
                originalJson: '',
                purchaseId: '',
              );

              homeCtrl.activeHashRate.value += parseMiningPowerToGh(plan.hashrate.toString());
            }
          }
        }
      }
    }
    HiveService().saveData(AppConfig.isInstall, true);
  }

  Future<void> loadActiveMiners() async {
    try {
      final userSubs = homeCtrl.userActiveBotList;
      double totalPower = 0.0;
      if (userSubs.isNotEmpty) {
        for (var miner in userSubs) {
          totalPower += parseMiningPowerToGh("${miner.power}");
        }
        homeCtrl.activeHashRate.value += totalPower;
      }

    } catch (e) {
      debugPrint('🔴 Error loading miners: $e');
    }
  }

  void appInForGroundOrBackGround() {
    subscription = FGBGEvents.instance.stream.listen((event) async {
      if (event == FGBGType.background) {
        if (AppConfig.appDataSet?.googleAppOpenAdStatus == true) {
          AppOpenAdManager().loadAd();
        }
      } else if (event == FGBGType.foreground) {
        if (AppConfig.appDataSet?.googleAppOpenAdStatus == true) {
          if (!AppOpenAdManager.isShowingAd) {
            Future.delayed(const Duration(milliseconds: 600), () {
              if (!AppOpenAdManager.isShowingAd) {
                if (AppConfig.appDataSet?.googleAppOpenAdStatus == true) {
                  AppOpenAdManager().showAdIfAvailable();
                }
              }
            });
          }
        }
      }
    });
  }
}
