import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageService {
  static const Map<String, Locale> supportedLocales = {
    'en': Locale('en', 'US'),
    'ms': Locale('ms', 'MY'),
    'fil': Locale('fil', 'PH'),
    'fr': Locale('fr', 'FR'),
    'es': Locale('es', 'ES'),
    'sw': Locale('sw', 'TZ'),
    'ha': Locale('ha', 'NG'),
    'pt': Locale('pt', 'PT'),
  };

  static Future<void> changeLanguage(String langCode) async {
    final hive = HiveService();
    final newLocale = supportedLocales[langCode] ?? const Locale('en', 'US');
    Get.updateLocale(newLocale);
    await hive.saveData(AppConfig.locale, langCode);
  }
}
