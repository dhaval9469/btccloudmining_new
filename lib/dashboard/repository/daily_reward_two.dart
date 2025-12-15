import 'dart:async';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:get/get.dart';

class DailyRewardServiceTwo {
  static final DailyRewardServiceTwo _instance = DailyRewardServiceTwo._internal();

  factory DailyRewardServiceTwo() => _instance;

  DailyRewardServiceTwo._internal();

  final HomeCtrl homeCtrl = Get.find();
  final hive = HiveService();

  final RxBool isEligibleTwo = false.obs;
  final Rx<Duration> rewardTimeLeftTwo = Duration.zero.obs;
  Timer? _rewardCD;

  void init() {
    _checkUnlockStatus();
  }

  void _checkUnlockStatus() {
    final String? savedTime = hive.getData<String>(AppConfig.dailyRewardTwo);
    if (savedTime == null) {
      isEligibleTwo.value = true;
      return;
    }

    final lastCollected = DateTime.parse(savedTime);
    final now = DateTime.now();
    final diff = now.difference(lastCollected);

    isEligibleTwo.value = diff >= const Duration(hours: 4);
  }

  void collectReward() {
    if (!isEligibleTwo.value) return;

    final now = DateTime.now();
    hive.saveData(AppConfig.dailyRewardTwo, now.toIso8601String());

    isEligibleTwo.value = false;

    // Apply bonus
    rewardTimeLeftTwo.value = Duration(seconds: AppConfig.appDataSet?.dailyRewardTimeTwo ?? 180);

    _startRewardCountdown();
  }

  void _startRewardCountdown() {
    _rewardCD?.cancel();
    homeCtrl.activeHashRate.value += parseMiningPowerToGh('${AppConfig.appDataSet?.dailyRewardHashRateTwo} gh');

    _rewardCD = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (rewardTimeLeftTwo.value.inSeconds > 1) {
        rewardTimeLeftTwo.value -= const Duration(seconds: 1);
      } else {
        // Last tick
        isEligibleTwo.value = false;
        rewardTimeLeftTwo.value = Duration.zero;
        homeCtrl.activeHashRate.value -= parseMiningPowerToGh('${AppConfig.appDataSet?.dailyRewardHashRateTwo} gh');
        timer.cancel();
      }
    });
  }


  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  void dispose() {
    _rewardCD?.cancel();
    _rewardCD = null;
    homeCtrl.activeHashRate.value -= parseMiningPowerToGh('${AppConfig.appDataSet?.dailyRewardHashRateTwo} gh');
    rewardTimeLeftTwo.value = Duration.zero;
    isEligibleTwo.value = false;
  }
}
