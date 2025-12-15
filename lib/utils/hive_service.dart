import 'package:btccloudmining/dashboard/model/active_bot_model.dart';
import 'package:btccloudmining/dashboard/service/language_service.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();

  factory HiveService() => _instance;

  HiveService._internal();

  final Map<String, Box> _boxes = {};

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ActiveBotModelAdapter());

    _boxes['brm_box'] = await Hive.openBox('brm_box');
    _boxes['brm_activeBot_box'] = await Hive.openBox('brm_activeBot_box');
  }

  Future<void> saveData(String key, dynamic value, {String boxName = 'brm_box'}) async {
    await _boxes[boxName]?.put(key, value);
  }

  T? getData<T>(String key, {String boxName = 'brm_box'}) {
    return _boxes[boxName]?.get(key) as T?;
  }

  Future<void> deleteData(String key, {String boxName = 'brm_box'}) async {
    await _boxes[boxName]?.delete(key);
  }

  Future<void> clearBox(String boxName) async {
    await _boxes[boxName]?.clear();
  }

  Future<void> addToBox(dynamic value, {required String boxName}) async {
    await _boxes[boxName]?.add(value);
  }

  List<dynamic> getAll(String boxName) {
    return _boxes[boxName]?.values.toList() ?? [];
  }


  Future<void> clearAllBoxes() async {
    for (var box in _boxes.values) {
      await box.clear();
    }
  }
  Locale getSavedLocale() {
    String? langCode = getData<String>(AppConfig.locale);
    return LanguageService.supportedLocales[langCode] ?? const Locale('en', 'US');
  }
}
