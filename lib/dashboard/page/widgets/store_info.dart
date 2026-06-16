import 'package:btccloudmining/ad_modual/banner/large_banner.dart';
import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
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
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      await Future.delayed(const Duration(seconds: 1));

      final currentItem = homeCtrl.storeItemData.value;

      final updatedPlans = (currentItem.plans ?? []).map((plan) {
        final product = subscriptionService.products.firstWhereOrNull((p) => p.id == plan.planId);

        if (product != null) {
          return plan.copyWith(amount: product.price);
        }
        return plan;
      }).toList();

      homeCtrl.storeItemData.value = currentItem.copyWith(plans: updatedPlans);

      homeCtrl.selectedPlanIndex.value = 0;
      homeCtrl.selectPlanDetails.value = updatedPlans.first;

      EasyLoading.dismiss();
    } catch (e, st) {
      EasyLoading.dismiss();
      AppException.showException(e, st);
    }
  }

  /*  setData() async {
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
        homeCtrl.storeItemData.refresh();
      }
      EasyLoading.dismiss();
    } catch (e, st) {
      EasyLoading.dismiss();
      AppException.showException(e, st);
    }
  }*/

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
                                  child: CircularProgressIndicator(strokeWidth: 1, color: AppColor.subText),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(AppAsset.blockEdge, scale: 4);
                            },
                          ),
                        ).py(20),
                      ),


                      SlideFadeTransition(index: 2, child: SmallNative(radius: 8,)).pOnly(bottom: 15,left: 15,right: 15),

                      SlideFadeTransition(
                        index: 2,
                        child: detailRow(text: "sisa".tr, subText: homeCtrl.storeItemData.value.hashrate),
                      ),
                      SlideFadeTransition(
                        index: 2,
                        child: detailRow(text: "sip".tr, subText: homeCtrl.storeItemData.value.efficiency),
                      ),
                      SlideFadeTransition(
                        index: 2,
                        child: detailRow(text: "sies".tr, subText: homeCtrl.storeItemData.value.miningBoost),
                      ),
                      15.heightBox,
                      SlideFadeTransition(
                        index: 3,
                        child: Text(
                          homeCtrl.storeItemData.value.description ?? "",
                          textAlign: TextAlign.center,
                          style: subTextMontserrat(context, fontSize: 11),
                        ).px(15),
                      ),
                      20.heightBox,
                      SlideFadeTransition(
                        index: 4,
                        child: Obx(
                          () => StaggeredGrid.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            children: List.generate(homeCtrl.storeItemData.value.plans?.length ?? 0, (index) {
                              final plan = homeCtrl.storeItemData.value.plans?[index];
                              return StaggeredGridTile.fit(
                                crossAxisCellCount: index == 2 ? 2 : 1,
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      homeCtrl.selectedPlanIndex.value = index;
                                      homeCtrl.selectPlanDetails.value = plan;
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: homeCtrl.selectedPlanIndex.value == index
                                              ? AppColor.primaryButton
                                              : Colors.white30,
                                          width: homeCtrl.selectedPlanIndex.value == index ? 2 : 1,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          plan?.discount == 0
                                              ? SizedBox(height: context.responsive.heightPercent(3))
                                              : Container(
                                                  height: context.responsive.heightPercent(3),
                                                  decoration: const BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [Color(0xffFF9800), Color(0xffF44336)],
                                                    ),
                                                    borderRadius: BorderRadius.vertical(
                                                      top: Radius.circular(14),
                                                    ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'siltos'.trParams({"discount": "${plan?.discount}"}),
                                                    style: textMontserrat(
                                                      context,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),

                                          10.heightBox,

                                          index == 2
                                              ? Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${plan?.validity}",
                                                      style: textMontserrat(
                                                        context,
                                                        color: homeCtrl.selectedPlanIndex.value == index
                                                            ? AppColor.text
                                                            : AppColor.subText,
                                                        fontWeight: homeCtrl.selectedPlanIndex.value == index
                                                            ? FontWeight.bold
                                                            : FontWeight.w500,
                                                        fontSize: homeCtrl.selectedPlanIndex.value == index
                                                            ? 16
                                                            : 14,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${plan?.amount}",
                                                      style: textMontserrat(
                                                        context,
                                                        fontWeight: homeCtrl.selectedPlanIndex.value == index
                                                            ? FontWeight.bold
                                                            : FontWeight.w500,
                                                        fontSize: homeCtrl.selectedPlanIndex.value == index
                                                            ? 16
                                                            : 14,
                                                        color: homeCtrl.selectedPlanIndex.value == index
                                                            ? AppColor.text
                                                            : AppColor.subText,
                                                      ),
                                                    ),
                                                  ],
                                                ).px(20)
                                              : Column(
                                                  children: [
                                                    Text(
                                                      "${plan?.validity}",
                                                      style: textMontserrat(
                                                        context,
                                                        color: homeCtrl.selectedPlanIndex.value == index
                                                            ? AppColor.text
                                                            : AppColor.subText,
                                                        fontWeight: homeCtrl.selectedPlanIndex.value == index
                                                            ? FontWeight.bold
                                                            : FontWeight.w500,
                                                        fontSize: homeCtrl.selectedPlanIndex.value == index
                                                            ? 16
                                                            : 14,
                                                      ),
                                                    ),
                                                    2.heightBox,
                                                    Text(
                                                      "${plan?.amount}",
                                                      style: textMontserrat(
                                                        context,
                                                        fontWeight: homeCtrl.selectedPlanIndex.value == index
                                                            ? FontWeight.bold
                                                            : FontWeight.w500,
                                                        fontSize: homeCtrl.selectedPlanIndex.value == index
                                                            ? 16
                                                            : 14,
                                                        color: homeCtrl.selectedPlanIndex.value == index
                                                            ? AppColor.text
                                                            : AppColor.subText,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                          10.heightBox,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ).px(15),
                        ),
                      ),
                      15.heightBox,
                      SlideFadeTransition(
                        index: 5,
                        child: CustomCard(
                          child: Obx(() {
                            final plans = homeCtrl.selectPlanDetails.value;
                            String priceString = plans?.amount ?? "₹0";
                            String cleanedPrice = priceString.replaceAll(RegExp(r'[^\d.]'), '');
                            double discountedPrice = double.tryParse(cleanedPrice) ?? 0;
                            int discountPercent = plans?.discount ?? 0;
                            double originalPrice = discountPercent > 0
                                ? discountedPrice / (1 - discountPercent / 100)
                                : discountedPrice;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'siod'.tr,
                                  style: textMontserrat(context, fontWeight: FontWeight.bold, fontSize: 15),
                                ).pOnly(left: 10, top: 7),
                                Divider(color: AppColor.card),
                                orderDetail(text: 'siods'.tr, subText: homeCtrl.storeItemData.value.hashrate),
                                3.heightBox,
                                orderDetail(
                                  text: 'siode'.tr,
                                  subText: homeCtrl.storeItemData.value.efficiency,
                                ),
                                3.heightBox,
                                orderDetail(
                                  text: 'siodn'.tr,
                                  subText: homeCtrl.storeItemData.value.miningBoost,
                                ),
                                3.heightBox,
                                orderDetail(text: 'siot'.tr, subText: "${plans?.renetalDays} Days"),
                                Divider(color: AppColor.card),

                                plans?.discount != 0
                                    ? Column(
                                        children: [
                                          orderDetail(
                                            text: 'siodop'.tr,
                                            subText: '₹${originalPrice.toStringAsFixed(2)}',
                                          ),
                                          3.heightBox,
                                          orderDetail(text: 'siodd'.tr, subText: '${plans?.discount}%'),
                                          3.heightBox,
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                orderDetail(text: 'siodp'.tr, subText: '${plans?.amount}'),
                                7.heightBox,
                              ],
                            );
                          }),
                        ).px(15),
                      ),
                      15.heightBox,
                      SlideFadeTransition(
                        index: 6,
                        child: Text(
                          'sisub'.tr,
                          textAlign: TextAlign.center,
                          style: subTextMontserrat(context, fontSize: 12),
                        ).px(15),
                      ),
                      20.heightBox,
                      SlideFadeTransition(index: 10, child: LargeBanner()),
                      40.heightBox,

                      // SlideFadeTransition(index: 7, child: SmallNative()),
                      // 80.heightBox,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SlideFadeTransition(
          index: 7,
          child: GestureDetector(
            onTap: () async {
              EasyLoading.show();

              final plan = homeCtrl.selectPlanDetails.value;
              final PurchaseResult result = await subscriptionService.buy(plan?.planId ?? "");

              if (!result.success) {
                EasyLoading.dismiss();
                EasyLoading.showToast("⚠️  ${result.status}");
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
                withdrawDialog();
              } catch (e) {
                EasyLoading.dismiss();
              }
            },
            child: Container(
              color: AppColor.newCard,
              child: SafeArea(
                child: Container(
                  height: context.responsive.heightPercent(5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)]),
                    // color: AppColor.primaryButton,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('siap'.tr, style: textRoboto(context, fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
                  ),
                ).pSymmetric(h: 15, v: 15),
              ),
            ),
          ),
        ),
      ),
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

  withdrawDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.newCard,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.cardLayout,
              border: Border(top: BorderSide(color: AppColor.neonBlue, width: 2)),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
                    "day": homeCtrl.selectPlanDetails.value?.renetalDays.toString() ?? "",
                  }),
                  textAlign: TextAlign.center,
                  style: textRoboto(context, fontSize: 15),
                ),
                20.heightBox,
                AppButton(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  color: AppColor.secondaryButton,
                  onTap: () {
                    Navigation.pop();
                    Navigation.pop();
                    InterstitialAdManager().showInterstitialAds();
                  },
                  text: 'sipsb'.tr,
                ),
                10.heightBox,
              ],
            ).p(12),
          ),
        );
      },
    );
  }
}
