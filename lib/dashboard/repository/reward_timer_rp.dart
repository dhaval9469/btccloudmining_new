import 'dart:async';
import 'package:get/get.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/utils.dart';

class RewardTimeService {
  static final RewardTimeService _instance = RewardTimeService._internal();

  factory RewardTimeService() => _instance;

  RewardTimeService._internal();

  final HomeCtrl homeCtrl = Get.find();
  Timer? _timer;

  final Rx<Duration> rewardTimeLeft = Duration.zero.obs;

  bool get isRunning => rewardTimeLeft.value.inSeconds > 0;

  /// START BOOST
  void start({required int seconds, required double bonusPower, required String bonusType}) {
    stop();

    final expireTime = DateTime.now().millisecondsSinceEpoch + (seconds * 1000);

    HiveService().saveData('boost_expire', expireTime.toString());
    HiveService().saveData('boost_power', bonusPower.toString());
    HiveService().saveData('boost_unit', bonusType);

    homeCtrl.activeHashRate.value += parseMiningPowerToGh('$bonusPower $bonusType');

    _runTimer(expireTime, bonusPower, bonusType);
  }

  /// RESTORE BOOST AFTER APP REOPEN
  void restore() {
    final expireStr = HiveService().getData<String>('boost_expire');
    if (expireStr == null) return;

    final expireTime = int.parse(expireStr);
    final now = DateTime.now().millisecondsSinceEpoch;

    if (expireTime <= now) {
      clearStoredBoost();
      return;
    }

    final bonusPower = double.parse(HiveService().getData<String>('boost_power') ?? '0');
    final bonusType = HiveService().getData<String>('boost_unit') ?? '';

    homeCtrl.activeHashRate.value += parseMiningPowerToGh('$bonusPower $bonusType');

    _runTimer(expireTime, bonusPower, bonusType);
  }

  void _runTimer(int expireTime, double bonusPower, String bonusType) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final diff = expireTime - now;

      if (diff <= 0) {
        homeCtrl.activeHashRate.value -= parseMiningPowerToGh('$bonusPower $bonusType');
        stop();
      } else {
        rewardTimeLeft.value = Duration(milliseconds: diff);
      }
    });
  }

  void stop() {
    _timer?.cancel();
    rewardTimeLeft.value = Duration.zero;
    clearStoredBoost();
  }

  void clearStoredBoost() {
    HiveService().saveData('boost_expire', null);
    HiveService().saveData('boost_power', null);
    HiveService().saveData('boost_unit', null);
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}";
  }
}
