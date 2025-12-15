import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/user_model.dart';
import 'package:btccloudmining/dashboard/service/auth_service.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/responsiv.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:btccloudmining/widget/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../service/api_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController referralCodeCtrl = TextEditingController();
  final HomeCtrl homeCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            100.heightBox,
            Image.asset(AppAsset.login, scale: 2),
            30.heightBox,

            Text('lh'.tr, style: textRoboto(context)),
            7.heightBox,
            Text('lsub'.tr, textAlign: TextAlign.center, style: subTextRoboto(context, fontSize: 13)),
            20.heightBox,
            AppButton(
              color: AppColor.primary,
              onTap: () => handleSingInTap(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.google, size: 20, color: Colors.white),
                    15.widthBox,
                    Text(
                      'lcwg'.tr,
                      style: textMontserrat(
                        context,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: context.responsive.heightPercent(33)),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'ltou'.tr,
                    style: textRoboto(context, color: AppColor.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigation.pushNamed(Routes.privacyPolicy);
                      },
                  ),
                  TextSpan(
                    text: ' | ',
                    style: subTextRoboto(context, color: AppColor.secondaryCard.withAlpha(150)),
                  ),
                  TextSpan(
                    text: 'spp'.tr,
                    style: textRoboto(context, color: AppColor.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigation.pushNamed(Routes.privacyPolicy);
                      },
                  ),
                ],
              ),
            ),
            10.heightBox,
            Text(
              'lsubText'.tr,
              textAlign: TextAlign.center,
              style: subTextRoboto(context, fontSize: 12).copyWith(height: 1.2),
            ),
            60.heightBox,
          ],
        ).px(15),
      ),
    );
  }

  handleSingInTap() async {
    try {
      FocusScope.of(context).unfocus();
      EasyLoading.show();

      final userCredential = await AuthService().signInWithGoogle();

      if (userCredential == null || userCredential.user == null) {
        EasyLoading.dismiss();
        return;
      }
      final user = userCredential.user;
      final String email = user?.email ?? '';

      if (email.isEmpty) {
        EasyLoading.dismiss();
        return;
      }

      HiveService().saveData(AppConfig.userEmail, email);
      HiveService().saveData(AppConfig.userName, user?.displayName);
      HiveService().saveData(AppConfig.userImage, user?.photoURL ?? "");
      HiveService().saveData(AppConfig.userMobile, user?.phoneNumber ?? "");
      HiveService().saveData(AppConfig.isLogin, true);
      EasyLoading.dismiss();
      referenceCode(email: email);
    } catch (e) {
      debugPrint('$e');
    }
  }

  referenceCode({String? email}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.newCard,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.newCard,
                border: Border(top: BorderSide(color: AppColor.card)),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppAsset.referFriend, scale: 3),
                    15.heightBox,
                    Text('lrc'.tr, style: textRoboto(context)),
                    2.heightBox,
                    Text('lrsub'.tr, style: subTextRoboto(context, fontSize: 13)),
                    15.heightBox,
                    CommonTextField(
                      hintText: "lrhint".tr,
                      controller: referralCodeCtrl,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.characters,
                    ),
                    25.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppButton(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            color: AppColor.primary.withAlpha(80),
                            border: Border.all(color: AppColor.primary),
                            onTap: () async {
                              homeCtrl.userActiveBotList.clear();
                              final UserProfileModel userProfileModel = await ApiRepo.userLogin(
                                email: email,
                                reference: '',
                                firstTime: '',
                              );
          
                              homeCtrl.activeHashRate.value = AppConfig.appDataSet?.startHashRate ?? 9.7;
                              homeCtrl.totalMineBtc.value = double.parse(
                                userProfileModel.totalBtcDirect.toString(),
                              );
                              homeCtrl.miningBtc.value = double.parse(
                                userProfileModel.totalBtcDirect.toString(),
                              );
                              homeCtrl.totalReferralBtc.value = double.parse(
                                userProfileModel.totalBtcRefrence.toString(),
                              );
                              homeCtrl.userActiveBotList.addAll(userProfileModel.subscription ?? []);
          
                              AppConfig.mingTimer = userProfileModel.mingTimer ?? 1800;
                              AppConfig.factorFast = userProfileModel.factorFast ?? 0.000000000001;
                              AppConfig.factorRegular = userProfileModel.factorRegular ?? 0.0000000000005;
                              AppConfig.factorMedium = userProfileModel.factorMedium ?? 0.0000000000002;
                              AppConfig.factorSlow = userProfileModel.factorSlow ?? 0.00000000000005;
                              AppConfig.factorUltraSlow =
                                  userProfileModel.factorUltraSlow ?? 0.000000000000005;
                              AppConfig.miningIntervals = userProfileModel.miningIntervals ?? 60;
                              AppConfig.userProfileId = userProfileModel.profileId ?? "";
                              AppConfig.referralCode = userProfileModel.profileRefrenceCode ?? "";
                              Navigation.pop();
                              Navigation.pushNamed(Routes.signInRewardPage);
                            },
                            text: 'lskip'.tr,
                          ),
                        ),
                        15.widthBox,
                        Expanded(
                          child: AppButton(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            color: AppColor.primary,
                            textColor: AppColor.text,
                            border: Border.all(color: AppColor.primary),
                            onTap: () async {
                              if (referralCodeCtrl.text.isNotEmpty) {
                                homeCtrl.userActiveBotList.clear();
                                final UserProfileModel userProfileModel = await ApiRepo.userLogin(
                                  email: email,
                                  reference: referralCodeCtrl.text.trim(),
                                  firstTime: '',
                                );
          
                                homeCtrl.activeHashRate.value = AppConfig.appDataSet?.startHashRate ?? 9.7;
                                homeCtrl.totalMineBtc.value = double.parse(
                                  userProfileModel.totalBtcDirect.toString(),
                                );
                                homeCtrl.miningBtc.value = double.parse(
                                  userProfileModel.totalBtcDirect.toString(),
                                );
                                homeCtrl.totalReferralBtc.value = double.parse(
                                  userProfileModel.totalBtcRefrence.toString(),
                                );
                                homeCtrl.userActiveBotList.addAll(userProfileModel.subscription ?? []);
          
                                AppConfig.mingTimer = userProfileModel.mingTimer ?? 1800;
                                AppConfig.factorFast = userProfileModel.factorFast ?? 0.000000000001;
                                AppConfig.factorRegular =
                                    userProfileModel.factorRegular ?? 0.0000000000005;
                                AppConfig.factorMedium = userProfileModel.factorMedium ?? 0.0000000000002;
                                AppConfig.factorSlow = userProfileModel.factorSlow ?? 0.00000000000005;
                                AppConfig.factorUltraSlow =
                                    userProfileModel.factorUltraSlow ?? 0.000000000000005;
                                AppConfig.miningIntervals = userProfileModel.miningIntervals ?? 60;
                                AppConfig.userProfileId = userProfileModel.profileId ?? "";
                                AppConfig.referralCode = userProfileModel.profileRefrenceCode ?? "";
                                Navigation.pop();
                                Navigation.pushNamed(Routes.signInRewardPage);
                              } else {
                                EasyLoading.showToast("Please enter referral code.");
                              }
                            },
                            text: 'lsubmit'.tr,
                          ),
                        ),
                      ],
                    ),
                    10.heightBox,
                  ],
                ).p(12),
              ),
            ),
          ),
        );
      },
    );
  }
}
