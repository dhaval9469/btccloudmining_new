import 'dart:convert';

import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import 'app_navigation/navigation.dart';

double getMiningPowerValue(double miningPowerGHs) {
  if (miningPowerGHs < 1000) {
    return miningPowerGHs;
  } else {
    double thValue = miningPowerGHs / 1000;
    return thValue;
  }
}

String getMiningPowerUnit(double miningPowerGHs) {
  return miningPowerGHs < 1000 ? ' GH/s' : ' TH/s';
}

showInfoDialog(BuildContext context, {String? title, String? massage, double? size}) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: AppColor.secondCard,
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.secondCard,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title ?? '',
                          textAlign: TextAlign.center,
                          style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigation.pop();
                          },
                          child: Icon(FontAwesomeIcons.xmark, color: AppColor.subText, size: 20),
                        ),
                      ],
                    ),
                    5.heightBox,
                    Divider(color: AppColor.card, height: 0),
                    10.heightBox,
                    Text(massage ?? '', style: subTextMontserrat(context, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
    child: FaIcon(FontAwesomeIcons.circleQuestion, color: AppColor.subText, size: size ?? 15),
  );
}

String hashRateFormating(double miningPowerGHs) {
  if (miningPowerGHs < 1000) {
    return '${miningPowerGHs.toStringAsFixed(2)} GH/s';
  } else if (miningPowerGHs < 1_000_000) {
    final ths = miningPowerGHs / 1000;
    return '${ths.toStringAsFixed(2)} TH/s';
  } else {
    final phs = miningPowerGHs / 1_000_000;
    return '${phs.toStringAsFixed(2)} PH/s';
  }
}

double miningFactor(double btcBalance) {
  if (btcBalance > 0.010000000000) {
    return AppConfig.factorUltraSlow;
  } else if (btcBalance > 0.001000000000) {
    return AppConfig.factorSlow;
  } else if (btcBalance > 0.000100000000) {
    return AppConfig.factorMedium;
  } else if (btcBalance > 0.000010000000) {
    return AppConfig.factorRegular;
  } else {
    return AppConfig.factorFast;
  }
}

String formatDuration(Duration d) {
  final totalDays = d.inDays;
  final hours = d.inHours % 24;
  final minutes = d.inMinutes % 60;
  final seconds = d.inSeconds % 60;

  final hStr = hours.toString().padLeft(2, '0');
  final mStr = minutes.toString().padLeft(2, '0');
  final sStr = seconds.toString().padLeft(2, '0');

  if (totalDays >= 365) {
    final years = totalDays ~/ 365;
    return '$years year${years > 1 ? 's' : ''}';
  } else if (totalDays >= 30) {
    final months = totalDays ~/ 30;
    return '$months Month${months > 1 ? 's' : ''}';
  } else if (totalDays >= 1) {
    return '$totalDays day${totalDays > 1 ? 's' : ''}';
  } else {
    return hours > 0 ? '$hStr:$mStr:$sStr' : '$mStr:$sStr';
  }
}

double parseMiningPowerToGh(String input) {
  input = input.trim().toLowerCase();
  if (input.endsWith('th')) {
    final value = double.tryParse(input.replaceAll('th', '').trim());
    return value != null ? value * 1000 : 0.0;
  } else if (input.endsWith('gh')) {
    final value = double.tryParse(input.replaceAll('gh', '').trim());
    return value ?? 0.0;
  } else {
    return double.tryParse(input) ?? 0.0;
  }
}

String miningDateFormat(String inputDate) {
  try {
    final date = DateFormat('d-M-yyyy').parse(inputDate);
    return DateFormat('d MMMM yyyy').format(date);
  } catch (e) {
    return inputDate;
  }
}

bool isProfileComplete() {
  final name = HiveService().getData<String>(AppConfig.userName);
  final email = HiveService().getData<String>(AppConfig.userEmail);
  final mobile = HiveService().getData<String>(AppConfig.userMobile);
  final btc = HiveService().getData<String>(AppConfig.userBtcAddress);

  return (name?.isNotEmpty ?? false) &&
      (email?.isNotEmpty ?? false) &&
      (mobile?.isNotEmpty ?? false) &&
      (btc?.isNotEmpty ?? false);
}

String? formatUtcMillisToLocal(String? utcMillis) {
  if (utcMillis == null || utcMillis.isEmpty) return null;

  final dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(utcMillis), isUtc: true).toLocal();

  return dateTime.toIso8601String();
}

showWatchAdDialog(
  BuildContext context, {
  required String text,
  required int time,
  required VoidCallback onWatchAd,
  VoidCallback? notNow,
}) {
  final double minutes = time / 60;
  final adTime = minutes % 1 == 0 ? minutes.toStringAsFixed(0) : minutes.toStringAsFixed(2);
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomCard(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppAsset.watchAd, scale: 10),
                const SizedBox(height: 10),
                Text(
                  "watchAdTitle".trParams({
                    "text": text,   // dynamic value
                    "adTime": adTime,      // dynamic value
                  }),
                  textAlign: TextAlign.center,
                  style: textRoboto(context, fontSize: 15),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: AppColor.primary.withAlpha(80),
                        border: Border.all(color: AppColor.primary),
                        onTap: () {
                          Navigation.pop();
                          notNow?.call();
                        },
                        text: 'watchAdN'.tr,
                      ),
                    ),
                    10.widthBox,
                    Expanded(
                      child: AppButton(
                        color: AppColor.primary,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        border: Border.all(color: AppColor.primary),
                        onTap: () {
                          Navigation.pop();
                          onWatchAd();
                        },
                        text: 'watchAdY'.tr,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


showLockBtcDialog(
    BuildContext context, {
      required String title,
      required String text,
      required VoidCallback onWatchAd,
      VoidCallback? notNow,
    }) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomCard(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigation.pop();
                      },
                      child: Icon(FontAwesomeIcons.xmark, color: AppColor.subText, size: 20),
                    ),
                  ],
                ),
                10.heightBox,
                Divider(color: AppColor.card, height: 0),
                15.heightBox,
                Image.asset(AppAsset.watchAd, scale: 6),
                20.heightBox,
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: textRoboto(context, fontSize: 15),
                ),
                20.heightBox,
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: AppColor.primary.withAlpha(80),
                        border: Border.all(color: AppColor.primary),
                        onTap: () {
                          Navigation.pop();
                          notNow?.call();
                        },
                        text: 'watchAdN'.tr,
                      ),
                    ),
                    10.widthBox,
                    Expanded(
                      child: AppButton(
                        color: AppColor.primary,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        border: Border.all(color: AppColor.primary),
                        onTap: () {
                          Navigation.pop();
                          onWatchAd();
                        },
                        text: 'watchAdY'.tr,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

final faqList = [
  FAQModel(qus: 'q0'.tr, ans: 'a1'.tr),
  FAQModel(qus: 'q9'.tr, ans: 'a9'.tr),
  FAQModel(qus: 'q10'.tr, ans: 'a10'.tr),
  FAQModel(qus: 'q1'.tr, ans: 'a1'.tr),
  FAQModel(qus: 'q3'.tr, ans: 'a3'.tr),
  FAQModel(qus: 'q4'.tr, ans: 'a4'.tr),
  FAQModel(qus: 'q5'.tr, ans: 'a5'.tr),
  FAQModel(qus: 'q6'.tr, ans: 'a6'.tr),
  FAQModel(qus: 'q7'.tr, ans: 'a7'.tr),
  FAQModel(qus: 'q8'.tr, ans: 'a8'.tr),

];

String decryptAESCryptoJS(Map body) {
  try {
    final String base64Encrypted = body["encrypted"];
    final String base64Key = AppConfig.keyIv;
    final String base64Iv = AppConfig.iv;

    final key = encrypt.Key(Uint8List.fromList(base64Decode(base64Key)));
    final iv = encrypt.IV(Uint8List.fromList(base64Decode(base64Iv)));
    final encryptedData = base64Decode(base64Encrypted);

    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final decrypted = encrypter.decryptBytes(encrypt.Encrypted(encryptedData), iv: iv);
    return utf8.decode(decrypted);
  } catch (e) {
    rethrow;
  }
}

class FAQModel {
  String? qus;
  String? ans;

  FAQModel({this.qus, this.ans});
}
