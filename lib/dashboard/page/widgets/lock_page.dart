import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/responsiv.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class LockPage extends StatefulWidget {
  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  final HomeCtrl homeCtrl = Get.find();
  double balance = 0.0;

  @override
  void initState() {
    balance = (homeCtrl.totalMineBtc.value + homeCtrl.totalReferralBtc.value);
    super.initState();
  }

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
        appBar: commonAppBar(),
        body: Column(
          children: [
            customHeader(context, 'lPh'.tr),
            Expanded(
              child: cardLayout(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SlideFadeTransition(
                        index: 1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: context.responsive.heightPercent(10),
                              decoration: BoxDecoration(
                                color: AppColor.newCard,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColor.primaryButton),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffFF9800).withAlpha(20),
                                    blurRadius: 15,
                                    spreadRadius: 30,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                AppAsset.lock,
                                scale: 15,
                                color: AppColor.primaryButton,
                              ).p(25),
                            ),
                            Lottie.asset(
                              AppAsset.lockLoader,
                              height: context.responsive.heightPercent(20),
                            ),
                          ],
                        ),
                      ).py(40),
                      SlideFadeTransition(
                        index: 2,
                        child: Text(
                          "lPvl".tr,
                          style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      20.heightBox,

                      SlideFadeTransition(
                        index: 3,
                        child: Text(
                          "lPsc".trParams({"lockbtc": balance.toStringAsFixed(12)}),
                          textAlign: TextAlign.center,
                          style: subTextMontserrat(context),
                        ).px(15),
                      ),
                      30.heightBox,
                      SlideFadeTransition(
                        index: 4,
                        child: GestureDetector(
                          onTap: () {
                            showWatchLockDialog(
                              context,
                              text: "lptl".trParams({"tolockbtc": balance.toStringAsFixed(12)}),
                              onWatchAd: () {
                                handleLockTap();
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.primaryButton,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'lPlb'.tr,
                                style: textRoboto(
                                  context,
                                  color: AppColor.text,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ).px(15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner()),
      ),
    );
  }

  showWatchLockDialog(
    BuildContext context, {
    required String text,
    required VoidCallback onWatchAd,
    VoidCallback? notNow,
  }) {
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
                    text,
                    textAlign: TextAlign.center,
                    style: subTextMontserrat(context, fontSize: 13),
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
                            Navigation.pop();
                            notNow?.call();
                          },
                          text: 'watchAdN'.tr,
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

  Future<void> handleLockTap() async {
    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        await HiveService().saveData(AppConfig.lockMinedBTC, true);
        await HiveService().saveData(
          AppConfig.lockMinedBTCTime,
          DateTime.now().millisecondsSinceEpoch,
        );
      },
      onAdClosed: () {
        showSuccessDialog(
          context,
          isEmpty: false,
          massage: "lPbsm".trParams({"lockedbtc": balance.toStringAsFixed(12)}),
          onTap: () {
            Navigation.pop();
          },
        );
      },
    );
  }
}
