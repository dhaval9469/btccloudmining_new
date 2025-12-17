import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/int_rwd_admanger.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/active_bot_model.dart';
import 'package:btccloudmining/dashboard/model/sub_details_model.dart';
import 'package:btccloudmining/dashboard/repository/storeinfo_rewardservice.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/dashboard/service/subscription_service.dart';
import 'package:btccloudmining/helper/exception_handler.dart';
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
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class StoreInfo extends StatefulWidget {
  const StoreInfo({super.key});

  @override
  State<StoreInfo> createState() => _StoreInfoState();
}

class _StoreInfoState extends State<StoreInfo> {
  final HomeCtrl homeCtrl = Get.find();
  final subscriptionService = SubscriptionService();

  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() async {
    try {
      EasyLoading.show();
      await Future.delayed(Duration(seconds: 1));

      homeCtrl.selectedPlanIndex.value = 0;
      homeCtrl.selectPlanDetails.value = homeCtrl.storeItemData.value.plans?[0];

      for (var element in subscriptionService.products) {
        final match = homeCtrl.storeItemData.value.plans?.firstWhereOrNull(
          (plan) => plan.planId == element.id,
        );
        if (match != null) {
          match.amount = element.price;
        }
      }
      // setState(() {});
      EasyLoading.dismiss();
    } catch (e, st) {
      EasyLoading.dismiss();
      AppException.showException(e, st);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          children: [
            customHeader(context, '${homeCtrl.storeItemData.value.planName}'),
            Expanded(
              child: cardLayout(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SlideFadeTransition(
                        index: 1,
                        child: Center(
                          child: Image.network(
                            "${AppConfig.imageBaseurl}${homeCtrl.storeItemData.value.image}",
                            height: context.responsive.heightPercent(15),
                            width: context.responsive.widthPercent(40),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return SizedBox(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColor.button,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(AppAsset.blockEdge);
                            },
                          ),
                        ).py(20),
                      ),
                      SlideFadeTransition(
                        index: 2,
                        child: detailRow(text: "sisa".tr, subText: homeCtrl.storeItemData.value.hashrate),
                      ),
                      SlideFadeTransition(
                        index: 2,
                        child: detailRow(text: "sip".tr, subText: homeCtrl.storeItemData.value.power),
                      ),
                      SlideFadeTransition(
                        index: 2,
                        child: detailRow(text: "sies".tr, subText: homeCtrl.storeItemData.value.efficiency),
                      ),
                      SlideFadeTransition(
                        index: 3,
                        child: Text(
                          homeCtrl.storeItemData.value.description ?? "",
                          textAlign: TextAlign.center,
                          style: subTextMontserrat(context, fontSize: 11),
                        ).px(15).py(10),
                      ),
                      AppConfig.appDataSet?.showTwoAd == true
                          ? SlideFadeTransition(index: 3, child: NativeBanner().pOnly(bottom: 7))
                          : SizedBox(),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homeCtrl.storeItemData.value.plans?.length ?? 0,
                        itemBuilder: (context, index) {
                          final plan = homeCtrl.storeItemData.value.plans?[index];
                          return SlideFadeTransition(
                            index: index + 4,
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  homeCtrl.selectedPlanIndex.value = index;
                                  homeCtrl.selectPlanDetails.value = plan;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: homeCtrl.selectedPlanIndex.value == index
                                          ? AppColor.thirdCard
                                          : AppColor.unSelectPlan,
                                      width: homeCtrl.selectedPlanIndex.value == index ? 2 : 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${plan?.validity}",
                                            style: textRoboto(
                                              context,
                                              color: homeCtrl.selectedPlanIndex.value == index
                                                  ? AppColor.text
                                                  : AppColor.subText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${plan?.amount}",
                                            style: textMontserrat(
                                              context,
                                              fontWeight: homeCtrl.selectedPlanIndex.value == index
                                                  ? FontWeight.bold
                                                  : FontWeight.w500,
                                              fontSize: homeCtrl.selectedPlanIndex.value == index ? 15 : 14,
                                              color: homeCtrl.selectedPlanIndex.value == index
                                                  ? AppColor.text
                                                  : AppColor.subText,
                                            ),
                                          ),
                                        ],
                                      ),

                                      plan?.discount != 0
                                          ? Container(
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xffFF9800), // Orange
                                                    Color(0xffF44336), // Red
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text('siltos'.tr, style: textRoboto(context, fontSize: 12)),
                                                  Text(
                                                    '${plan?.discount}%',
                                                    style: textRoboto(
                                                      context,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ).pSymmetric(v: 2, h: 10),
                                            ).pOnly(top: 10)
                                          : SizedBox.shrink(),
                                    ],
                                  ).px(15).py(10),
                                ).px(15),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 10.heightBox;
                        },
                      ),
                      20.heightBox,
                      SlideFadeTransition(
                        index: 6,
                        child: GestureDetector(
                          onTap: () async {
                            EasyLoading.show();

                            final plan = homeCtrl.selectPlanDetails.value;
                            final PurchaseResult result = await subscriptionService.buy(plan?.planId ?? "");

                            if (!result.success) {
                              EasyLoading.dismiss();
                              EasyLoading.showToast("⚠️ Error: ${result.message ?? 'Unknown error'}");
                              return;
                            }

                            final addTimeFormatted =
                                formatUtcMillisToLocal(result.transactionDate) ??
                                DateTime.now().toUtc().millisecondsSinceEpoch.toString();

                            try {
                              await ApiRepo.getSubDetails(
                                email: HiveService().getData<String>(AppConfig.userEmail),
                                botType: homeCtrl.storeItemData.value.planName,
                                plan: plan?.planId,
                                power: homeCtrl.storeItemData.value.hashrate,
                                durationSeconds: plan?.durationSeconds.toString(),
                                durationType: plan?.renetalDays.toString(),
                                type: homeCtrl.storeItemData.value.image,
                                powerType: '',
                                addTime: addTimeFormatted,
                                token: result.token,
                                productID: plan?.planId,
                                purchaseStatus: result.status,
                                purchaseId: '',
                                originalJson: '',
                              );

                              homeCtrl.activeHashRate.value += parseMiningPowerToGh(
                                homeCtrl.storeItemData.value.hashrate.toString(),
                              );
                              EasyLoading.dismiss();
                              withdrawDialog(data: homeCtrl.selectPlanDetails.value);
                            } catch (e) {
                              EasyLoading.dismiss();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.thirdCard,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'siap'.tr,
                                  style: textRoboto(context, fontWeight: FontWeight.bold, fontSize: 16),
                                ).pSymmetric(v: 6),
                              ],
                            ),
                          ).px(15),
                        ),
                      ),
                      5.heightBox,
                      SlideFadeTransition(
                        index: 7,
                        child: Text(
                          'sisub'.tr,
                          textAlign: TextAlign.center,
                          style: subTextRoboto(context, fontWeight: FontWeight.w400, fontSize: 12),
                        ).px(15),
                      ),
                      20.heightBox,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),
      /*  bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: context.responsive.heightPercent(4.7),
          child: AppButton(
            padding: EdgeInsets.symmetric(vertical: 5),
            color: AppColor.button,
            text: 'siap'.tr,
            onTap: () async {
              EasyLoading.show();

              final plan = homeCtrl.selectPlanDetails.value;
              final PurchaseResult result = await subscriptionService.buy(plan?.planId ?? "");

              if (!result.success) {
                EasyLoading.dismiss();
                EasyLoading.showToast("⚠️ Error: ${result.message ?? 'Unknown error'}");
                return;
              }

              final addTimeFormatted =
                  formatUtcMillisToLocal(result.transactionDate) ?? DateTime.now().toUtc().millisecondsSinceEpoch.toString();

              try {
                await ApiRepo.getSubDetails(
                  email: HiveService().getData<String>(AppConfig.userEmail),
                  botType: homeCtrl.storeItemData.value.name,
                  plan: plan?.planId,
                  power: homeCtrl.storeItemData.value.hashrate,
                  durationSeconds: plan?.durationSeconds.toString(),
                  durationType: plan?.renetalDays.toString(),
                  type: homeCtrl.storeItemData.value.image,
                  powerType: '',
                  addTime: addTimeFormatted,
                  token: result.token,
                  productID: plan?.planId,
                  purchaseStatus: result.status,
                  purchaseId: '',
                  originalJson: '',
                );

                homeCtrl.activeHashRate.value += parseMiningPowerToGh(homeCtrl.storeItemData.value.hashrate.toString());
                EasyLoading.dismiss();
                withdrawDialog(data: homeCtrl.selectPlanDetails.value);
              } catch (e) {
                EasyLoading.dismiss();
              }
            },
          ).px(15),
        ).pOnly(bottom: 10),
      ),*/
    );
  }

  detailRow({String? text, String? subText}) {
    return Row(
      children: [
        FaIcon(FontAwesomeIcons.circleCheck, color: AppColor.subText, size: 12),
        7.widthBox,
        Text(text ?? "", style: subTextRoboto(context)),
        Spacer(),
        Text(subText ?? "", style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 15)),
      ],
    ).px(20);
  }

  orderDetail({final String? text, final String? subText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text ?? "", style: subTextRoboto(context)),
        Text(subText ?? "", style: textRoboto(context, fontWeight: FontWeight.w600)),
      ],
    ).px(10);
  }

  Future<void> handleBoostTap(StoreInfoAdRewardService timer, ListPlan data) async {
    if (timer.isRunning) return;

    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        timer.start(seconds: data.adTime ?? 120, bonusPower: data.hashrate ?? '50 TH');

        final activeMiner = ActiveBotModel(
          productID: '',
          botType: data.planName.toString(),
          type: data.hashrate ?? '',
          power: data.power ?? '',
          machineType: data.efficiency ?? '',
          duration: data.adTime ?? 60,
          addTime: DateTime.now().millisecondsSinceEpoch,
          expireTime: data.adTime ?? 60,
        );

        await HiveService().addToBox(activeMiner, boxName: 'brm_activeBot_box');
      },
      onAdClosed: () {},
    );

    EasyLoading.dismiss();
  }

  withdrawDialog({Plans? data}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.newCard,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          height: context.responsive.heightPercent(38),
          decoration: BoxDecoration(
            color: AppColor.newCard,
            border: Border(top: BorderSide(color: AppColor.card)),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(AppAsset.done, width: 100, height: 100, fit: BoxFit.fill, repeat: true),
              10.heightBox,
              Text(
                "sissm".trParams({
                  "name": homeCtrl.storeItemData.value.planName.toString(),
                  "speed": homeCtrl.storeItemData.value.hashrate.toString(),
                  "day": "${data?.renetalDays}",
                }),
                textAlign: TextAlign.center,
                style: textRoboto(context, fontSize: 15),
              ),
              20.heightBox,
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 6),
                color: AppColor.primary,
                onTap: () {
                  Navigation.pop();
                  Navigation.pop();
                },
                text: 'wwb'.tr,
              ),
            ],
          ).p(12),
        );
      },
    );
  }
}
