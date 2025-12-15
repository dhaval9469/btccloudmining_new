import 'dart:async';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:get/get.dart';

class DailyRewardService {
  static final DailyRewardService _instance = DailyRewardService._internal();

  factory DailyRewardService() => _instance;

  DailyRewardService._internal();

  final HomeCtrl homeCtrl = Get.find();
  final hive = HiveService();

  final RxBool isEligible = false.obs;
  final Rx<Duration> rewardTimeLeft = Duration.zero.obs;
  Timer? _rewardCD;

  void init() {
    _checkUnlockStatus();
  }

  void _checkUnlockStatus() {
    final String? savedTime = hive.getData<String>(AppConfig.dailyReward);
    if (savedTime == null) {
      isEligible.value = true;
      return;
    }

    final lastCollected = DateTime.parse(savedTime);
    final now = DateTime.now();
    final diff = now.difference(lastCollected);

    isEligible.value = diff >= const Duration(hours: 24);
  }

  void collectReward() {
    if (!isEligible.value) return;

    // Save time
    final now = DateTime.now();
    hive.saveData(AppConfig.dailyReward, now.toIso8601String());

    isEligible.value = false;

    // Apply bonus
    rewardTimeLeft.value = Duration(seconds: AppConfig.appDataSet?.dailyRewardTime ?? 120);

    _startRewardCountdown();
  }

  void _startRewardCountdown() {
    _rewardCD?.cancel();
    homeCtrl.activeHashRate.value += parseMiningPowerToGh('${AppConfig.appDataSet?.dailyRewardHashRate} gh');

    _rewardCD = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (rewardTimeLeft.value.inSeconds > 1) {
        rewardTimeLeft.value -= const Duration(seconds: 1);
      } else {
        // Last tick
        isEligible.value = false;
        rewardTimeLeft.value = Duration.zero;
        homeCtrl.activeHashRate.value -= parseMiningPowerToGh('${AppConfig.appDataSet?.dailyRewardHashRate} gh');
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
    homeCtrl.activeHashRate.value -= parseMiningPowerToGh('${AppConfig.appDataSet?.dailyRewardHashRate} gh');
    rewardTimeLeft.value = Duration.zero;
    isEligible.value = false;
  }
}
