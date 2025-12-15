import 'dart:convert';
import 'dart:developer';

import 'package:btccloudmining/dashboard/model/addbtc_model.dart';
import 'package:btccloudmining/dashboard/model/addwd_model.dart';
import 'package:btccloudmining/dashboard/model/appdataset_model.dart';
import 'package:btccloudmining/dashboard/model/mining_record.dart';
import 'package:btccloudmining/dashboard/model/sub_details_model.dart';
import 'package:btccloudmining/dashboard/model/update_profile_model.dart';
import 'package:btccloudmining/dashboard/model/user_model.dart';
import 'package:btccloudmining/dashboard/model/withdraw_details_model.dart';
import 'package:btccloudmining/helper/exception_handler.dart';
import 'package:btccloudmining/helper/network_helper.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ApiRepo {
  static Future<UserProfileModel> userLogin({String? email, String? reference, String? firstTime}) async {
    try {
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {'email': email, 'refrence': reference ?? '', 'first_time': firstTime ?? '', 'token': AppConfig.token};

      final response = await NetworkAPICall().post(AppConfig.endpoint?.login ?? '', body, header: headers);

      if (response['status_code'] == '200') {
        return UserProfileModel.fromJson(response);
      } else {
        final message = response['messsage'] ?? 'Unknown error';
        AppException.showException('Error', message);
        throw Exception(message);
      }
    } catch (e, st) {
      AppException.showException(e, st);
      rethrow;
    }
  }

  static Future<AddBtcModel> addBtc({String? email, String? btc, String? type}) async {
    try {
      EasyLoading.show();
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {'email': email, "btc": btc, "type": type, "token": AppConfig.token};

      final response = await NetworkAPICall().post(AppConfig.endpoint?.addBtcNew ?? '', body, header: headers);

      EasyLoading.dismiss();
      if (response['status_code'] == '200') {
        return AddBtcModel.fromJson(response);
      } else {
        final message = response['messsage'] ?? 'Unknown error';
        AppException.showException('Error', message);
        throw Exception(message);
      }
    } catch (e, st) {
      EasyLoading.dismiss();
      AppException.showException(e, st);
      rethrow;
    }
  }

  static Future<void> getSubDetails({
    String? email,
    String? botType,
    String? type,
    String? plan,
    String? power,
    String? powerType,
    String? durationType,
    String? durationSeconds,
    String? addTime,
    String? productID,
    String? purchaseId,
    String? token,
    String? originalJson,
    String? purchaseStatus,
  }) async {
    try {
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {
        'email': email,
        'botType': botType,
        'type': type,
        'plan': plan,
        'power': power,
        'powerType': powerType,
        'durationType': durationType,
        'durationSeconds': durationSeconds,
        'addTime': addTime,
        'purchaseToken': token,
        'productID': productID,
        'purchaseId': purchaseId,
        'originalJson': originalJson,
        'purchaseStatus': purchaseStatus,
        "token": AppConfig.token,
      };

      final response = await NetworkAPICall().post(AppConfig.endpoint?.subscriptionAdd ?? '', body, header: headers);

      if (response['status_code'] != '200') {
        final message = response['messsage'] ?? 'Unknown error';
        AppException.showException('Error', message);
        throw Exception(message);
      }
    } catch (e, st) {
      AppException.showException(e, st);
      rethrow;
    }
  }

  static Future<MiningRecordModel> viewBtc({String? email}) async {
    try {
      EasyLoading.show();

      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final body = {'email': email, "token": AppConfig.token};

      final response = await NetworkAPICall().post(AppConfig.endpoint?.viewBtc ?? '', body, header: headers);

      EasyLoading.dismiss();

      if (response['status_code'] == '200') {
        return MiningRecordModel.fromJson(response);
      } else {
        final message = response['messsage'] ?? 'Unknown error';
        AppException.showException('Error', message);
        throw Exception(message);
      }
    } catch (e, st) {
      EasyLoading.dismiss();
      AppException.showException(e, st);
      rethrow;
    }
  }

  static Future<AppDataSetModel> appDataSet() async {
    try {
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {'token': AppConfig.token};

      final response = await NetworkAPICall().post(AppConfig.endpoint?.ads ?? '', body, header: headers);
      return AppDataSetModel.fromJson(response);
    } catch (e, st) {
      AppException.showException(e, st);
      rethrow;
    }
  }

  static Future<SubDetailsModel> subscriptionDetails({String? email}) async {
    try {
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {'email': email, "token": AppConfig.token};

      final response = await NetworkAPICall().post(AppConfig.endpoint?.subscriptionBtc ?? '', body, header: headers);
      return SubDetailsModel.fromJson(response);
    } catch (e, st) {
      AppException.showException(e, st);
      rethrow;
    }
  }

  static Future<UpdateProfileModel> updateProfile({
    String? email,
    String? mobile,
    String? gender,
    String? btcAddress,
    String? name,
  }) async {
    try {
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {
        'email': email,
        'mobile': mobile,
        'gender': gender,
        'btc_address': btcAddress,
        'name': name,
        "token": AppConfig.token,
      };
      EasyLoading.show();

      final response = await NetworkAPICall().post(AppConfig.endpoint?.profile ?? '', body, header: headers);

      EasyLoading.dismiss();
      if (response['status_code'] == '200') {
        return UpdateProfileModel.fromJson(response);
      } else {
        final message = response['messsage'] ?? 'Unknown error';
        AppException.showException('Error', message);
        throw Exception(message);
      }
    } catch (e, st) {
      EasyLoading.dismiss();
      AppException.showException(e, st);
      rethrow;
    }
  }

  static Future<AddWDModel> addWithdrawDetails({String? email, String? btc}) async {
    try {
      EasyLoading.show();

      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {'email': email, "btc": btc, "token": AppConfig.token};
      final response = await NetworkAPICall().post(AppConfig.endpoint?.addWithdraw ?? '', body, header: headers);

      EasyLoading.dismiss();
      return AddWDModel.fromJson(response);
    } catch (e, st) {
      EasyLoading.dismiss();
      AppException.showException(e, st);
      rethrow;
    }
  }

  static Future<WithdrawDetailsModel> viewWithdrawDetails({String? email}) async {
    try {
      EasyLoading.show();

      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {'email': email, "token": AppConfig.token};

      final response = await NetworkAPICall().post(AppConfig.endpoint?.viewWithdraw ?? '', body, header: headers);
      EasyLoading.dismiss();

      if (response['status_code'] == '200') {
        return WithdrawDetailsModel.fromJson(response);
      } else {
        final message = response['messsage'] ?? 'Unknown error';
        AppException.showException('Error', message);
        throw Exception(message);
      }
    } catch (e, st) {
      EasyLoading.dismiss();
      AppException.showException(e, st);
      rethrow;
    }
  }

  static Future<void> accountDelete({String? email}) async {
    try {
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final body = {'email': email, "token": AppConfig.token};

      final response = await NetworkAPICall().post(AppConfig.endpoint?.deleteBtc ?? '', body, header: headers);

      if (response['status_code'] != '200') {
        final message = response['messsage'] ?? 'Unknown error';
        AppException.showException('Error', message);
        throw Exception(message);
      }
    } catch (e, st) {
      AppException.showException(e, st);
      rethrow;
    }
  }
}
