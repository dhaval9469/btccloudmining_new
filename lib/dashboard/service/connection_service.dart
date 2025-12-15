import 'dart:async';
import 'dart:io';
import 'package:btccloudmining/dashboard/repository/daily_reward.dart';
import 'package:btccloudmining/dashboard/repository/daily_reward_two.dart';
import 'package:btccloudmining/dashboard/repository/start_time_rp.dart';
import 'package:btccloudmining/dashboard/repository/storead_rewardservice.dart';
import 'package:btccloudmining/dashboard/repository/storeinfo_rewardservice.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/widget/no_internet_popup.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectionService {
  ConnectionService._privateConstructor() {
    _init();
  }

  static bool _hasConnection = true;
  static final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionStreamController = StreamController.broadcast();

  final List<ConnectivityResult> _activeResults = <ConnectivityResult>[
    ConnectivityResult.wifi,
    ConnectivityResult.mobile,
    ConnectivityResult.vpn,
    ConnectivityResult.ethernet,
  ];

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      final bool isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      return isConnected;
    } on Exception {
      return false;
    }
  }

  Stream<bool> get connectionStream => _connectionStreamController.stream;

  StreamSubscription<bool>? _connectionSubscription;

  static ConnectionService? _instance;

  static ConnectionService get instance => _instance ??= ConnectionService._privateConstructor();

  List<ConnectivityResult> _connectionStates = [ConnectivityResult.none];

  void _init() async {
    // Initial status check
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);

    // Listen to changes
    _connectivity.onConnectivityChanged.listen(
      (result) {
        _updateConnectionStatus(result);
      },
    );
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStates = result;
    bool hasNetwork = false;

    for (var status in _activeResults) {
      if (_connectionStates.contains(status)) {
        hasNetwork = await checkConnection();
        break;
      }
    }
    _connectionStreamController.add(hasNetwork);
  }

  void listenForStatusChange(BuildContext context, {VoidCallback? onTryAgain}) {
    _connectionSubscription?.cancel();
    _connectionSubscription = connectionStream.listen((isConnected) {
      if (!isConnected) {
        final bool? isMining = HiveService().getData<bool>(AppConfig.checkMining);
        if (isMining == true) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              _hasConnection = false;
              StartTimeService().saveMiningState();
              StartTimeService().dispose();
              StoreAdRewardService().dispose();
              StoreInfoAdRewardService().dispose();
              DailyRewardService().dispose();
              DailyRewardServiceTwo().dispose();

              NoInternetPopup.show(context, onTryAgain: onTryAgain);
            },
          );
        }
        NoInternetPopup.show(context, onTryAgain: onTryAgain);
      } else if (!_hasConnection && isConnected) {
        Navigation.pop();
        if (onTryAgain != null) {
          onTryAgain.call();
        } else {
          Navigation.popAndPushNamed(Routes.splash);
        }
      }
    });
  }

  void cancelConnectionListener() {
    _connectionSubscription?.cancel();
    _connectionSubscription = null;
  }
}
