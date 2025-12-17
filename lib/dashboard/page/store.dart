import 'package:btccloudmining/ad_modual/banner/banner.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/active_bot_model.dart';
import 'package:btccloudmining/dashboard/model/sub_details_model.dart';
import 'package:btccloudmining/dashboard/repository/storead_rewardservice.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/responsiv.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final HomeCtrl homeCtrl = Get.find();
  CarouselSliderController carouselSliderController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text("bu".tr, style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ).p(15),

            Obx(
              () => homeCtrl.subscriptionPlanList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: context.responsive.heightPercent(30)),
                      child: Column(children: [CircularProgressIndicator()]),
                    )
                  : Expanded(
                      child: cardLayout(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.heightBox,
                              SlideFadeTransition(
                                index: 1,
                                child: Row(
                                  children: [
                                    Text(
                                      'scpeed'.tr,
                                      style: subTextMontserrat(
                                        context,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '${getMiningPowerValue(homeCtrl.activeHashRate.value).toStringAsFixed(2)} ${getMiningPowerUnit(homeCtrl.activeHashRate.value)}',
                                      style: subTextMontserrat(
                                        context,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ).px(15),
                              ),
                              15.heightBox,
                              SlideFadeTransition(
                                index: 2,
                                child: CarouselSlider.builder(
                                  itemCount: homeCtrl.subscriptionPlanList.length,
                                  itemBuilder: (context, index, realIndex) {
                                    final data = homeCtrl.subscriptionPlanList[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: AppColor.thirdCard, width: 2),
                                          left: BorderSide(color: AppColor.thirdCard, width: 2),
                                          right: BorderSide(color: AppColor.thirdCard, width: 2),
                                        ),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "${data.planName}",
                                            style: textMontserrat(
                                              context,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ).pSymmetric(v: 10),
                                          Divider(height: 0, color: AppColor.thirdCard, thickness: 2),
                                          Center(
                                            child: Image.network(
                                              "${AppConfig.imageBaseurl}${data.image}",
                                              height: context.responsive.heightPercent(13),
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
                                          ).pSymmetric(v: 10),
                                          itemDetails("Speed", "${data.hashrate}"),
                                          itemDetails("Earning", "${data.efficiency}"),
                                          /*                         data.planads != true
                                              ? Obx(() {
                                                  final sessionTimer = StoreAdRewardService();
                                                  return GestureDetector(
                                                    onTap: !sessionTimer.isRunning
                                                        ? () {
                                                            showWatchAdDialog(
                                                              context,
                                                              text: data.hashrate.toString(),
                                                              time: data.adTime ?? 120,
                                                              onWatchAd: () {
                                                                homeCtrl.planAdIndex.value = index;
                                                                handleBoostTap(sessionTimer, data);
                                                              },
                                                            );
                                                          }
                                                        : () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColor.thirdCard,
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            sessionTimer.isRunning &&
                                                                    homeCtrl.planAdIndex.value == index
                                                                ? sessionTimer.formatDuration(
                                                                    sessionTimer.adRewardTimeLeft.value,
                                                                  )
                                                                : 'swAdBoost'.tr,
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: textRoboto(context),
                                                          ).pSymmetric(v: 5),
                                                          10.widthBox,
                                                          Image.asset(AppAsset.boost, scale: 5),
                                                        ],
                                                      ),
                                                    ).pOnly(bottom: 13),
                                                  );
                                                }).px(15)
                                              : SizedBox.shrink(),*/
                                          Spacer(),
                                          homeCtrl.isPurchase.value
                                              ? GestureDetector(
                                                  onTap: () {
                                                    InterstitialAdManager().showInterstitialByCount();
                                                    homeCtrl.storeItemData.value = data;
                                                    Navigation.pushNamed(Routes.storeInfo);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColor.secondButton,
                                                      border: Border.all(
                                                        color: AppColor.secondButton,
                                                        width: 2,
                                                      ),
                                                      borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(23),
                                                        bottomRight: Radius.circular(23),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'spn'.tr,
                                                          style: textRoboto(
                                                            context,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 15,
                                                          ),
                                                        ).pSymmetric(v: 6),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : SizedBox.shrink(),
                                        ],
                                      ),
                                    ).pSymmetric(h: 7);
                                  },
                                  options: CarouselOptions(
                                    height: context.responsive.heightPercent(32),
                                    reverse: false,
                                    viewportFraction: 0.6,
                                    initialPage: 1,
                                    enableInfiniteScroll: false,
                                    onPageChanged: (index, reason) {
                                      homeCtrl.planCount.value = index;
                                    },
                                  ),
                                ),
                              ),
                              10.heightBox,
                              SlideFadeTransition(
                                index: 3,
                                child: Obx(
                                  () => homeCtrl.subscriptionPlanList.isEmpty
                                      ? const SizedBox.shrink()
                                      : Align(
                                          alignment: Alignment.center,
                                          child: AnimatedSmoothIndicator(
                                            activeIndex: homeCtrl.planCount.value,
                                            count: homeCtrl.subscriptionPlanList.length,
                                            effect: ExpandingDotsEffect(
                                              dotHeight: 7,
                                              dotWidth: 7,
                                              activeDotColor: AppColor.accent,
                                              dotColor: Colors.white24,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              25.heightBox,
                              SlideFadeTransition(
                                index: 4,
                                child: Text(
                                  "scfpb".tr,
                                  style: subTextMontserrat(
                                    context,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ).px(15),
                              ),
                              10.heightBox,
                              SlideFadeTransition(
                                index: 5,
                                child: CarouselSlider.builder(
                                  itemCount: homeCtrl.subscriptionPlanList.length,
                                  itemBuilder: (context, index, realIndex) {
                                    final data = homeCtrl.subscriptionPlanList[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.newCard,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: context.responsive.heightPercent(12),
                                            width: context.responsive.widthPercent(30),
                                            decoration: BoxDecoration(
                                              color: AppColor.newBg,
                                              borderRadius: BorderRadius.circular(6),
                                              image: DecorationImage(
                                                image: AssetImage(AppAsset.miner),
                                                scale: 4.5,
                                              ),
                                            ),
                                          ),
                                          10.widthBox,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data.hashrate}",
                                                style: textMontserrat(
                                                  context,
                                                  fontSize: 13,
                                                  color: AppColor.subText,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "scfs".tr,
                                                style: subTextMontserrat(context, fontSize: 12),
                                              ),
                                              10.heightBox,
                                              data.planads != true
                                                  ? Obx(() {
                                                      final sessionTimer = StoreAdRewardService();
                                                      return GestureDetector(
                                                        onTap: !sessionTimer.isRunning
                                                            ? () {
                                                                showWatchAdDialog(
                                                                  context,
                                                                  text: data.hashrate.toString(),
                                                                  time: data.adTime ?? 120,
                                                                  onWatchAd: () {
                                                                    homeCtrl.planAdIndex.value = index;
                                                                    handleBoostTap(sessionTimer, data);
                                                                  },
                                                                );
                                                              }
                                                            : () {},
                                                        child: Container(
                                                          width: context.responsive.widthPercent(30),
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                            color: AppColor.thirdCard,
                                                            borderRadius: BorderRadius.circular(6),
                                                          ),
                                                          child: Text(
                                                            sessionTimer.isRunning &&
                                                                    homeCtrl.planAdIndex.value == index
                                                                ? sessionTimer.formatDuration(
                                                                    sessionTimer.adRewardTimeLeft.value,
                                                                  )
                                                                : 'swAdBoost'.tr,
                                                            style: textMontserrat(
                                                              context,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ).pSymmetric(v: 5),
                                                        ),
                                                      );
                                                    })
                                                  : SizedBox.shrink(),
                                            ],
                                          ),
                                        ],
                                      ).p(8),
                                    ).pOnly(left: 10);
                                  },
                                  options: CarouselOptions(
                                    height: context.responsive.heightPercent(12),
                                    reverse: false,
                                    viewportFraction: 0.7,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    padEnds: false,
                                  ),
                                ),
                              ),
                              20.heightBox,
                            ],
                          ),
                        ),
                      ),
                    ),
              /* : Expanded(
                      child: cardLayout(
                        child: AnimationLimiter(
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.57,
                            ),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                            itemCount: homeCtrl.subscriptionPlanList.length,
                            itemBuilder: (context, index) {
                              final data = homeCtrl.subscriptionPlanList[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 300),
                                child: SlideAnimation(
                                  verticalOffset: 20,
                                  child: FadeInAnimation(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColor.thirdCard),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "${data.planName}",
                                            style: textMontserrat(
                                              context,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ).pSymmetric(v: 8),
                                          Divider(height: 0, color: AppColor.thirdCard),
                                          Center(
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    "${AppConfig.imageBaseurl}${data.image}",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ).pSymmetric(v: 8),
                                          itemDetails("Speed", "${data.hashrate}"),
                                          itemDetails("Earning", "${data.efficiency}"),
                                          15.heightBox,
                                          data.planads != true
                                              ? Obx(() {
                                                  final sessionTimer = StoreAdRewardService();
                                                  return GestureDetector(
                                                    onTap: !sessionTimer.isRunning
                                                        ? () {
                                                            showWatchAdDialog(
                                                              context,
                                                              text: data.hashrate.toString(),
                                                              time: data.adTime ?? 120,
                                                              onWatchAd: () {
                                                                homeCtrl.planAdIndex.value = index;
                                                                handleBoostTap(sessionTimer, data);
                                                              },
                                                            );
                                                          }
                                                        : () {},
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color: AppColor.thirdCard,
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                sessionTimer.isRunning &&
                                                                        homeCtrl.planAdIndex.value == index
                                                                    ? sessionTimer.formatDuration(
                                                                        sessionTimer.adRewardTimeLeft.value,
                                                                      )
                                                                    : 'swAdBoost'.tr,
                                                                maxLines: 1,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: textRoboto(context),
                                                              ).pSymmetric(v: 5),
                                                            ],
                                                          ),
                                                        ),
                                                        13.heightBox,
                                                      ],
                                                    ),
                                                  );
                                                }).px(10)
                                              : SizedBox.shrink(),
                                          Spacer(),
                                          homeCtrl.isPurchase.value
                                              ? GestureDetector(
                                                  onTap: () {
                                                    InterstitialAdManager().showInterstitialByCount();
                                                    homeCtrl.storeItemData.value = data;
                                                    Navigation.pushNamed(Routes.storeInfo);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColor.secondButton,
                                                      borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(24),
                                                        bottomRight: Radius.circular(24),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'spn'.tr,
                                                          style: textRoboto(
                                                            context,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 15,
                                                          ),
                                                        ).pSymmetric(v: 6),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : SizedBox.shrink(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),*/
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: ShowBanner()),
    );
  }

  Future<void> handleBoostTap(StoreAdRewardService timer, ListPlan data) async {
    if (timer.isRunning) return;

    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        timer.start(seconds: data.adTime ?? 60, bonusPower: data.hashrate ?? '25 TH');
        final activeMiner = ActiveBotModel(
          productID: '',
          botType: data.planName.toString(),
          type: data.hashrate ?? '',
          power: data.power ?? '',
          machineType: "",
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

  itemDetails(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$key: ", style: textRoboto(context, fontSize: 13, color: AppColor.subText)),
        Text(
          value,
          style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 13, color: AppColor.subText),
        ),
      ],
    );
  }
}
