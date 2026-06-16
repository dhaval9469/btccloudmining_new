import 'package:btccloudmining/ad_modual/native/native_banner.dart';
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
import 'package:btccloudmining/widget/app_widget.dart';
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Scaffold(
        backgroundColor: AppColor.newBg,
        appBar: commonAppBar(),
        body: Column(
          children: [
            100.heightBox,
            Image.asset(AppAsset.appLogo, scale: 3),
            80.heightBox,
            Text('lh'.tr, style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 15)),
            5.heightBox,
            Text('lsub'.tr, textAlign: TextAlign.center, style: subTextRoboto(context, fontSize: 13)),
            30.heightBox,
            AppButton(
              color: AppColor.primaryButton,
              onTap: () => handleSingInTap(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.google, size: 20, color: AppColor.text),
                    15.widthBox,
                    Text(
                      'lcwg'.tr,
                      style: textMontserrat(
                        context,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'ltou'.tr,
                    style: textRoboto(context, color: AppColor.primaryButton),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigation.pushNamed(Routes.privacyPolicy);
                      },
                  ),
                  TextSpan(
                    text: ' | ',
                    style: subTextRoboto(context, color: AppColor.divider, fontSize: 18),
                  ),
                  TextSpan(
                    text: 'spp'.tr,
                    style: textRoboto(context, color: AppColor.primaryButton),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigation.pushNamed(Routes.privacyPolicy);
                      },
                  ),
                ],
              ),
            ),
            10.heightBox,
            Text('lsubText'.tr, textAlign: TextAlign.center, style: subTextMontserrat(context, fontSize: 12)),
            20.heightBox,
          ],
        ).px(15),
        bottomNavigationBar: SafeArea(child: NativeBanner()),
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
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.cardLayout,
              border: Border(top: BorderSide(color: AppColor.neonBlue, width: 2)),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  10.heightBox,
                  Image.asset(AppAsset.voucher, scale: 7),
                  15.heightBox,
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
                          color: AppColor.secondaryButton.withAlpha(80),
                          border: Border.all(color: AppColor.secondaryButton),
                          onTap: () async {
                            homeCtrl.userActiveBotList.clear();

                            final UserProfileModel userProfileModel = await ApiRepo.userLogin(
                              email: email,
                              reference: '',
                              firstTime: '',
                            );

                            homeCtrl.activeHashRate.value = AppConfig.appDataSet?.startHashRate ?? 9.70;
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
                            AppConfig.factorUltraSlow = userProfileModel.factorUltraSlow ?? 0.000000000000005;
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
                          color: AppColor.secondaryButton,
                          textColor: AppColor.text,
                          border: Border.all(color: AppColor.secondaryButton),
                          onTap: () async {
                            if (referralCodeCtrl.text.isNotEmpty) {
                              homeCtrl.userActiveBotList.clear();
                              final UserProfileModel userProfileModel = await ApiRepo.userLogin(
                                email: email,
                                reference: referralCodeCtrl.text.trim(),
                                firstTime: '',
                              );

                              homeCtrl.activeHashRate.value = AppConfig.appDataSet?.startHashRate ?? 9.70;
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
        );
      },
    );
  }
}
