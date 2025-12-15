import 'package:btccloudmining/dashboard/btcrm.dart';
import 'package:btccloudmining/ad_modual/consent_service.dart';
import 'package:btccloudmining/dashboard/service/notification_services.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/remotconfig.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationService.instance.init();
  await NotificationService.instance.showNotification(message);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
    ),
  );
  await Firebase.initializeApp();
  await FirebaseRemoteConfigService().init();
  await HiveService().init();
  await InitializationHelper().initialize();
  configLoading();
  runApp(const BtcCloudMiningApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorWidget = SizedBox(
      height: 40,
      width: 40,
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey.withAlpha(50),
        strokeWidth: 1,
        color: Colors.white,
      ),
    )
    ..radius = 10.0
    ..userInteractions = false
    ..textStyle = const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500);
}
