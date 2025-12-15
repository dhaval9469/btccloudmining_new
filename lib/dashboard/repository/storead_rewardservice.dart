import 'dart:async';

import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:get/get.dart';

class StoreAdRewardService {
  static final StoreAdRewardService _instance = StoreAdRewardService._internal();

  factory StoreAdRewardService() => _instance;

  StoreAdRewardService._internal();

  bool get isRunning => adRewardTimeLeft.value.inSeconds > 0;

  final HomeCtrl homeCtrl = Get.find();
  final Rx<Duration> adRewardTimeLeft = Duration.zero.obs;
  final RxString bonusHashRate = ''.obs;
  Timer? _adRewardCD;

  void start({required int seconds, required String bonusPower}) {
    stop();
    homeCtrl.activeHashRate.value += parseMiningPowerToGh(bonusPower);
    bonusHashRate.value = bonusPower;
    adRewardTimeLeft.value = Duration(seconds: seconds);
    _adRewardCD = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (adRewardTimeLeft.value.inSeconds > 1) {
        adRewardTimeLeft.value -= const Duration(seconds: 1);
      } else {
        homeCtrl.activeHashRate.value -= parseMiningPowerToGh(bonusHashRate.value);
        stop();
      }
    });
  }

  void stop() {
    _adRewardCD?.cancel();
    _adRewardCD = null;
    adRewardTimeLeft.value = Duration.zero;

  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  void dispose() {
    _adRewardCD?.cancel();
    _adRewardCD = null;
    homeCtrl.activeHashRate.value -= parseMiningPowerToGh(bonusHashRate.value);
    adRewardTimeLeft.value = Duration.zero;
  }
}
