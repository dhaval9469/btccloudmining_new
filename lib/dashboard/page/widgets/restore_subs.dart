import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/sub_details_model.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/dashboard/service/subscription_service.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class RestoreSubsPage extends StatelessWidget {
  RestoreSubsPage({super.key});

  final HomeCtrl homeCtrl = Get.find();
  final subscriptionService = SubscriptionService();

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
            customHeader(context, 'srs'.tr),
            35.heightBox,

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.highlightColor),
              child: const Icon(Icons.workspace_premium_rounded, color: Colors.orange, size: 55),
            ),

            25.heightBox,

            Text(
              "Restore Your Premium",
              style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.text),
            ),

            12.heightBox,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                "Already purchased premium subscription? Restore your plan and continue enjoying premium mining features.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 13, height: 1.6, color: AppColor.subText, fontWeight: FontWeight.w500),
              ),
            ),

            20.heightBox,

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ICON
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.sync_rounded, color: Colors.red, size: 22),
                ),

                20.widthBox,

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Automatic Sync",
                        style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w700, color: AppColor.text),
                      ),
                      Text(
                        "All premium benefits will sync automatically after restore.",
                        style: GoogleFonts.inter(fontSize: 12, height: 1.5, color: AppColor.subText, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ).px(18),

            35.heightBox,

            GestureDetector(
              onTap: () async {
                EasyLoading.show(status: "Restoring...", maskType: EasyLoadingMaskType.black);

                await Future.delayed(Duration(seconds: 2));

                try {
                  final restoredPurchases = await subscriptionService.restorePurchases();

                  if (restoredPurchases.isEmpty) {
                    EasyLoading.dismiss();
                    showSuccessDialog(
                      context,
                      isEmpty: true,
                      massage: 'snasfua'.tr,
                      onTap: () {
                        Navigation.pop();
                        InterstitialAdManager().showInterstitialAds();
                      },
                    );
                    return;
                  }

                  final email = HiveService().getData<String>(AppConfig.userEmail);
                  await ApiRepo.userLogin(email: email, reference: '', firstTime: 'yes');

                  homeCtrl.activeHashRate.value = AppConfig.appDataSet?.startHashRate ?? 9.70;

                  for (var purchase in restoredPurchases) {
                    for (var plan in homeCtrl.subscriptionPlanList) {
                      final plans = plan.plans ?? <Plans>[];
                      for (var planDetail in plans) {
                        if (planDetail.planId == purchase.productID) {
                          await ApiRepo.getSubDetails(
                            email: email,
                            botType: plan.planName,
                            plan: planDetail.planId,
                            power: plan.hashrate,
                            durationSeconds: planDetail.durationSeconds.toString(),
                            durationType: planDetail.renetalDays.toString(),
                            powerType: '',
                            type: plan.image,
                            addTime: formatUtcMillisToLocal(purchase.transactionDate),
                            token: purchase.verificationData.serverVerificationData,
                            productID: purchase.productID,
                            purchaseStatus: purchase.status.name,
                            purchaseId: purchase.purchaseID,
                            originalJson: purchase.verificationData.localVerificationData,
                          );

                          homeCtrl.activeHashRate.value += parseMiningPowerToGh(plan.hashrate.toString());
                        }
                      }
                    }
                  }

                  EasyLoading.dismiss();
                  showSuccessDialog(
                    context,
                    isEmpty: false,
                    massage: 'srsm'.tr,
                    onTap: () {
                      Navigation.pop();
                      InterstitialAdManager().showInterstitialAds();
                    },
                  );
                } catch (e) {
                  EasyLoading.dismiss();
                  EasyLoading.showError("Error during restore");
                  debugPrint('$e');
                  return;
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)]),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    "Restore Subscription",
                    style: GoogleFonts.sora(color: AppColor.text, fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ).py(8),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner()),
      ),
    );
  }
}
