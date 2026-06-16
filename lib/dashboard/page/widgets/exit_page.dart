import 'package:btccloudmining/ad_modual/native/big_native.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ExitPage extends StatelessWidget {
  const ExitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        InterstitialAdManager().showInterstitialByBackCount();
        Navigation.pop();
      },
      child: Scaffold(
        backgroundColor: AppColor.newBg,
        body: SingleChildScrollView(
          child: Column(
            children: [
              40.heightBox,
              Image.asset(AppAsset.appLogo, scale: 2.5),
              Text(
                AppConfig.appName,
                style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.bold),
              ).px(15),
              7.heightBox,
              Text(
                "epst".tr,
                textAlign: TextAlign.center,
                style: subTextMontserrat(context, fontSize: 13),
              ).px(15),
              50.heightBox,
              BigNative(),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: 40,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => SystemNavigator.pop(),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: AppColor.secondaryButton),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Tap to Exit',
                    textAlign: TextAlign.center,
                    style: textMontserrat(
                      context,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ),
            /*     child: AppButton(
              onTap: () async {
                SystemNavigator.pop();
              },
              text: 'Tap to Exit',
            ),*/
          ),
          /*        child: GestureDetector(
            onTap: () async {
              EasyLoading.show();
              await miningController.saveMiningState(miningController.btcBalance.value);
              EasyLoading.dismiss();
              SystemNavigator.pop();
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColor.best,
              ),
              child: AppText(
                "Tap to Exit",
                color: AppColor.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),*/
        ),
      ),
    );
  }
}
