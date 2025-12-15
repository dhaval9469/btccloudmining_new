import 'package:btccloudmining/ad_modual/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/small_native.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
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
    return Scaffold(
      backgroundColor: AppColor.newCard,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAsset.done, width: 200, height: 200, fit: BoxFit.fill, repeat: false),
            Text('src'.tr, style: textMontserrat(context, fontSize: 24, fontWeight: FontWeight.w600)),
            15.heightBox,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'srsubone'.tr,
                style: subTextRoboto(context, fontSize: 13),
                children: [
                  TextSpan(
                    text: '${AppConfig.appDataSet?.startHashRate} Gh/s',
                    style: subTextRoboto(context, fontSize: 13),
                  ),
                  TextSpan(text: 'srsubtwo'.tr, style: subTextRoboto(context, fontSize: 13)),
                ],
              ),
            ),
            25.heightBox,
            AppButton(
              padding: EdgeInsets.symmetric(vertical: 6),
              color: AppColor.primary,
              onTap: () {
                if (AppConfig.appDataSet?.startRewardAdsFirsTime == true) {
                  showWatchAdDialog(context);
                } else {
                  Navigation.pushNamed(Routes.bottom);
                }
              },
              text: "srls".tr,
            ),
            20.heightBox,
          ],
        ).px(15),
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }

  showWatchAdDialog(BuildContext context) {
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
                    'srdh'.trParams({
                      "value": AppConfig.endpoint?.startingReward?.toStringAsFixed(12) ?? "",
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
                            Navigation.pushNamed(Routes.bottom);
                          },
                          text: 'srdnt'.tr,
                        ),
                      ),
                      10.widthBox,
                      Expanded(
                        child: AppButton(
                          color: AppColor.primary,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          border: Border.all(color: AppColor.primary),
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
