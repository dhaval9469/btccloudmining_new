import 'package:btccloudmining/ad_modual/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/native_banner.dart';
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
        final match = homeCtrl.storeItemData.value.plans?.firstWhereOrNull((plan) => plan.planId == element.id);
        if (match != null) {
          match.amount = element.price;
        }
      }

      setState(() {});
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
            customHeader(context, '${homeCtrl.storeItemData.value.name}'),
            Expanded(
              child: cardLayout(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      25.heightBox,
                      Container(
                        height: context.responsive.heightPercent(18),
                        width: context.responsive.widthPercent(40),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${AppConfig.imageBaseurl}${homeCtrl.storeItemData.value.image}"),
                          ),
                        ),
                      ),
                      5.heightBox,
                      NativeBanner(),
                      10.heightBox,
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homeCtrl.storeItemData.value.plans?.length ?? 0,
                        itemBuilder: (context, index) {
                          final plan = homeCtrl.storeItemData.value.plans?[index];
                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                homeCtrl.selectedPlanIndex.value = index;
                                homeCtrl.selectPlanDetails.value = plan;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: homeCtrl.selectedPlanIndex.value == index
                                        ? [Color(0xff12B985), Color(0xff2267E8)]
                                        : [AppColor.card, AppColor.card],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(AppAsset.rentalDay, scale: 30, color: AppColor.white),
                                        5.widthBox,
                                        Text('sitp'.tr, style: textRoboto(context)),
                                        Spacer(),
                                        Text(
                                          "${plan?.renetalDays} day",
                                          style: textMontserrat(
                                            context,
                                            fontWeight: homeCtrl.selectedPlanIndex.value == index
                                                ? FontWeight.bold
                                                : FontWeight.w500,
                                            fontSize: homeCtrl.selectedPlanIndex.value == index ? 15 : 14,
                                            color: AppColor.text,
                                          ),
                                        ),
                                      ],
                                    ).px(10).py(5),
                                    CustomCard(
                                      color: AppColor.newBg,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${plan?.description}',
                                            style: subTextRoboto(context, fontSize: 12, color: Colors.white54),
                                          ),
                                          7.heightBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              plan?.discount != 0
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xff9C27B0),
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Limited-Time Offer – Save ',
                                                            style: textRoboto(context, fontSize: 12),
                                                          ),
                                                          Text(
                                                            '${plan?.discount}%',
                                                            style: textMontserrat(
                                                              context,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ],
                                                      ).pSymmetric(v: 2, h: 10),
                                                    )
                                                  : SizedBox.shrink(),
                                            ],
                                          ),
                                        ],
                                      ).p(7),
                                    ).px(5),
                                    5.heightBox,
                                  ],
                                ),
                              ).px(15),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 10.heightBox;
                        },
                      ),
                      15.heightBox,
                      CustomCard(
                        borderRadius: BorderRadius.circular(12),
                        child: Obx(() {
                          final plans = homeCtrl.selectPlanDetails.value;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('siod'.tr, style: textRoboto(context, fontWeight: FontWeight.bold)).px(10),
                              Divider(color: AppColor.card),
                              orderDetail(text: 'Hashrate', subText: homeCtrl.storeItemData.value.hashrate),
                              3.heightBox,
                              orderDetail(text: 'Power', subText: homeCtrl.storeItemData.value.power),

                              3.heightBox,
                              orderDetail(text: 'Efficiency', subText: homeCtrl.storeItemData.value.efficiency),

                              3.heightBox,
                              orderDetail(text: 'Algorithm', subText: homeCtrl.storeItemData.value.algorithm ?? 'SHA-256'),

                              3.heightBox,
                              Divider(color: AppColor.card),
                              plans?.discount != 0
                                  ? orderDetail(text: 'Discount', subText: '${plans?.discount}%')
                                  : SizedBox.shrink(),
                              orderDetail(text: 'Price', subText: '${plans?.amount}'),
                            ],
                          ).py(10);
                        }),
                      ).px(15),
                      15.heightBox,
                      Text(
                        'sisub'.tr,
                        textAlign: TextAlign.center,
                        style: subTextRoboto(context, fontWeight: FontWeight.w400, fontSize: 12),
                      ).px(15),
                      20.heightBox,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
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
      ),
      // bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }

  detailRow({final String? text, final String? subText, final String? image, final double? scale}) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image ?? ""),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(AppColor.iconColor, BlendMode.srcIn),
            ),
          ),
        ),
        7.widthBox,
        Text(text ?? "", style: subTextRoboto(context)),
        Spacer(),
        Text(subText ?? "", style: textRoboto(context, fontWeight: FontWeight.w600)),
      ],
    ).px(10);
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
          botType: data.name.toString(),
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
                  "name": homeCtrl.storeItemData.value.name.toString(),
                  "hashrate": homeCtrl.storeItemData.value.hashrate.toString(),
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
