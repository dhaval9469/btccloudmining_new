import 'dart:async';

import 'package:btccloudmining/utils/hive_service.dart';
import 'package:get/get.dart';

class RewardCooldownCtrl extends GetxController {
  final RxMap<String, int> _cooldowns = <String, int>{}.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    _restore();
    timer = Timer.periodic(const Duration(seconds: 1), (_) => update());
  }

  void startCooldown(String key, int seconds) {
    final end = DateTime.now().millisecondsSinceEpoch + (seconds * 1000);
    HiveService().saveData('reward_cd_$key', end.toString());
    _cooldowns[key] = end;
  }

  Duration remainingTime(String key) {
    final end = _cooldowns[key];
    if (end == null) return Duration.zero;

    final diff = end - DateTime.now().millisecondsSinceEpoch;
    if (diff <= 0) return Duration.zero;

    return Duration(milliseconds: diff);
  }

  bool isRewardAvailable(String key) {
    return remainingTime(key).inSeconds == 0;
  }

  void _restore() {
    final end = HiveService().getData<String>('reward_cd_random');
    if (end != null) {
      _cooldowns['random'] = int.parse(end);
    }
  }
}
