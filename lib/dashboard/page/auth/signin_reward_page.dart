import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInRewardPage extends StatefulWidget {
  const SignInRewardPage({super.key});

  @override
  State<SignInRewardPage> createState() => _SignInRewardPageState();
}

class _SignInRewardPageState extends State<SignInRewardPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Scaffold(
        backgroundColor: AppColor.newCard,
        appBar: commonAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppAsset.done, width: 200, height: 200, fit: BoxFit.fill, repeat: false),
              Text('src'.tr, style: textMontserrat(context, fontSize: 22, fontWeight: FontWeight.bold)),
              15.heightBox,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'srsubone'.tr,
                  style: subTextMontserrat(context, fontSize: 13),
                  children: [
                    TextSpan(
                      text: '${AppConfig.appDataSet?.startHashRate} Gh/s',
                      style: subTextMontserrat(context, fontSize: 13),
                    ),
                    TextSpan(text: 'srsubtwo'.tr, style: subTextMontserrat(context, fontSize: 13)),
                  ],
                ),
              ),
              25.heightBox,
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 6),
                color: AppColor.primaryButton,
                onTap: () {
                  if (AppConfig.appDataSet?.startRewardadsFirstime == true) {
                    showWatchAdDialog(context);
                  } else {
                    InterstitialAdManager().showInterstitialAds();
                    Navigation.pushNamed(Routes.bottom);
                  }
                },
                text: "srls".tr,
              ),
              40.heightBox,
            ],
          ).px(15),
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner()),
      ),
    );
  }

  showWatchAdDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomCard(
            borderRadius: BorderRadius.circular(18),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAsset.watchAd, scale: 10),
                  const SizedBox(height: 10),
                  Text(
                    'srdh'.trParams({"value": AppConfig.endpoint?.startingReward?.toStringAsFixed(12) ?? ""}),
                    textAlign: TextAlign.center,
                    style: textRoboto(context, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          textColor: AppColor.subText,
                          color: AppColor.secondaryButton.withAlpha(100),
                          border: Border.all(color: AppColor.secondaryButton),
                          onTap: () {
                            Navigation.pushNamed(Routes.bottom);
                          },
                          text: 'srdnt'.tr,
                        ),
                      ),
                      10.widthBox,
                      Expanded(
                        child: AppButton(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          textColor: AppColor.subText,
                          color: AppColor.secondaryButton,
                          border: Border.all(color: AppColor.secondaryButton),
                          onTap: () {
                            IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
                              onReward: () {
                                Navigation.pushNamed(Routes.bottom);
                              },
                              onAdClosed: () {},
                            );
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
}
