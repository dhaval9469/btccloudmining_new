import 'package:btccloudmining/dashboard/model/appdataset_model.dart';
import 'package:btccloudmining/dashboard/model/end_point_model.dart';
import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();

  static ValueNotifier<int> bottomBarValue = ValueNotifier<int>(0);

  static String baseUrl = "";
  static String token = "";
  static String iv = "";
  static String keyIv = "";
  static String imageBaseurl = "";

  static String appLink = "";
  static String ppLink = "";
  static String appVersion = "1.0.0";
  static String appName = "Bitcoin Mining (ASIC Miner)";

  static SpIdModel? spIdData;
  static EndPointModel? endpoint;
  static AppDataSet? appDataSet;
  static double referEarn = 0.000000005000;

  static int mingTimer = 1800;
  static String referralCode = '';
  static String userProfileId = '';

  static double factorFast = 0.000000000001;
  static double factorRegular = 0.0000000000005;
  static double factorMedium = 0.0000000000002;
  static double factorSlow = 0.00000000000005;
  static double factorUltraSlow = 0.000000000000005;
  static int miningIntervals = 60;

  static const locale = 'locale';
  static const dailyReward = 'dailyReward';
  static const dailyRewardTwo = 'dailyRewardTwo';
  static const btcBalance = 'btcBalance';
  static const miningTime = 'miningTime';
  static const lastMiningTime = 'lastMiningTime';
  static const lastMiningTimeSecond = 'lastMiningTimeSecond';
  static const checkMining = 'checkMining';

  static final String isLogin = 'IS_LOGIN';
  static final String isInstall = 'IS_INSTALL';
  static final String userEmail = 'USER_EMAIL';
  static final String userImage = 'USER_IMAGE';
  static final String userName = 'USER_NAME';
  static final String userMobile = 'USER_MOBILE';
  static final String userBtcAddress = 'USER_BtcAddress';
  static final String userGender = 'USER_Gender';
}
