import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/service/notification_services.dart';
import 'package:btccloudmining/main.dart';
import 'package:btccloudmining/theme/translations.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BtcCloudMiningApp extends StatefulWidget {
  const BtcCloudMiningApp({super.key});

  @override
  State<BtcCloudMiningApp> createState() => _BtcCloudMiningAppState();
}

class _BtcCloudMiningAppState extends State<BtcCloudMiningApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      builder: EasyLoading.init(),
      translations: AppTranslations(),
      locale: HiveService().getSavedLocale(),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
    );
  }
}

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<HomeCtrl>(HomeCtrl());
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await NotificationService.instance.init();
  }
}
