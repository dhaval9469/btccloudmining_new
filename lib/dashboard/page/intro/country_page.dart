import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  String? selectedRegion = "Choose Your Region";
  bool isInitializing = false;
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Scaffold(
        backgroundColor: AppColor.newBg,
        appBar: AppBar(backgroundColor: AppColor.newBg, toolbarHeight: 0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isInitialized ?50.heightBox: 80.heightBox,
            Center(child: Image.asset(AppAsset.appLogo, scale: 3)),
            isInitialized ?50.heightBox: 80.heightBox,
            Text(
              headerText,
              style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600),
            ).px(3),
            15.heightBox,
            DropdownButtonFormField<String>(
              initialValue: selectedRegion,
              hint: Text("cicr".tr),
              items: regionList.map((region) {
                return DropdownMenuItem<String>(
                  value: region,
                  child: Text(
                    region,
                    style: textRoboto(context, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                );
              }).toList(),
              onChanged: (value) async {
                if (value != null && value != "Choose Your Region") {
                  setState(() {
                    selectedRegion = value;
                    isInitializing = true;
                  });

                  await Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      isInitializing = false;
                      isInitialized = true;
                    });
                  });
                }
              },

              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.newCard,
                isDense: true,
                enabled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColor.subText),
              dropdownColor: AppColor.newCard,
            ),
            Center(
              child: Column(
                children: [
                  if (isInitializing) ...[
                    15.heightBox,
                    Lottie.asset('assets/lottie/connnecting.json', height: 100),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'ci'.tr,
                          textStyle: textMontserrat(
                            context,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.subText,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      repeatForever: true,
                    ).px(15),
                  ] else if (isInitialized) ...[
                    Column(
                      children: [
                        Lottie.asset(AppAsset.done, height: 100, repeat: false),
                        Text(
                          'csc'.trParams({"selectedRegion": "$selectedRegion"}),
                          textAlign: TextAlign.center,
                          style: textRoboto(context, fontSize: 14, color: AppColor.subText),
                        ),
                        15.heightBox,
                        Text(
                          'cscr'.trParams({
                            "reward":
                                "${AppConfig.endpoint?.startingReward?.toStringAsFixed(2)} Gh/s",
                          }),
                          textAlign: TextAlign.center,
                          style: textRoboto(context, fontSize: 13, color: AppColor.subText),
                        ),
                      ],
                    ).px(15),
                  ] else ...[
                    20.heightBox,
                    Text(
                      'cyrs'.tr,
                      textAlign: TextAlign.center,
                      style: textRoboto(context, fontSize: 14, color: AppColor.subText),
                    ).px(15),
                  ],
                ],
              ),
            ),
            25.heightBox,
            AppButton(
              color: AppColor.secondaryButton,
              onTap: () {
                if (selectedRegion != "Choose Your Region") {
                  Navigation.pushNamed(Routes.signInPage);
                } else {
                  EasyLoading.showToast("csre".tr);
                }
                InterstitialAdManager().showInterstitialAds();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  "ccb".tr,
                  style: textMontserrat(
                    context,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.text,
                  ),
                ),
              ),
            ),
          ],
        ).px(15),
        bottomNavigationBar: SafeArea(child: NativeBanner()),
      ),
    );
  }

  final regionList = [
    "Choose Your Region",
    "Global",
    "Asia",
    "Africa",
    "Europe",
    "North America",
    "South America",
    "Australia",
    "Pacific",
    "Middle East",
  ];

  String get headerText {
    if (isInitializing) {
      return "cics".tr;
    } else if (isInitialized) {
      return "cisc".tr;
    } else {
      return "cisyr".tr;
    }
  }
}
