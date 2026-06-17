import 'package:btccloudmining/ad_modual/banner/large_banner.dart';
import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/ctrl/reward_ctrl.dart';
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
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final HomeCtrl homeCtrl = Get.find();
  final RewardCooldownCtrl rewardCooldownCtrl = Get.put(RewardCooldownCtrl());
  CarouselSliderController carouselSliderController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    homeCtrl.planKeys = List.generate(homeCtrl.subscriptionPlanList.length, (_) => GlobalKey());
    homeCtrl.storePlanIndex.value = 0;
    homeCtrl.storePlanName.value = homeCtrl.subscriptionPlanList[0].planName.toString();
    homeCtrl.storePlanDetailsList.value = homeCtrl.subscriptionPlanList[0].plans ?? [];
    homeCtrl.storePlanAdsTime.value = homeCtrl.subscriptionPlanList[0].adTime ?? 0;
    homeCtrl.storePlanAds.value = homeCtrl.subscriptionPlanList[0].planads ?? false;
    homeCtrl.storePlanDetails.value = homeCtrl.subscriptionPlanList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: commonAppBar(),
      body: Column(
        children: [
          Row(
            children: [Text("bu".tr, style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600))],
          ).pOnly(left: 15, right: 15, top: 10, bottom: 15),

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
                              child: CustomCard(
                                child: Row(
                                  children: [
                                    Text(
                                      'scpeed'.tr,
                                      style: subTextMontserrat(context, fontSize: 14, fontWeight: FontWeight.w600),
                                    ),

                                    Text(
                                      ' ${getMiningPowerValue(homeCtrl.activeHashRate.value).toStringAsFixed(2)}  TH/s',
                                      style: subTextRoboto(
                                        context,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: AppColor.text,
                                      ),
                                    ),
                                    Text(' + ', style: textMontserrat(context, fontWeight: FontWeight.bold, fontSize: 16)),
                                    Text(
                                      '${homeCtrl.storePlanDetails.value.hashrate}',
                                      style: textMontserrat(
                                        context,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: AppColor.accent,
                                      ),
                                    ),
                                  ],
                                ).px(15).py(10),
                              ).px(15),
                            ),
                            SlideFadeTransition(index: 2, child: SmallNative(radius: 8)).p(10),
                            SlideFadeTransition(
                              index: 2,
                              child: CustomCard(
                                child: Center(
                                  child: Image.network(
                                    "${AppConfig.imageBaseurl}${homeCtrl.storePlanDetails.value.image}",
                                    height: context.responsive.heightPercent(15),
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return SizedBox(
                                        height: context.responsive.heightPercent(15),
                                        width: context.responsive.widthPercent(15),
                                        child: Center(child: CircularProgressIndicator(strokeWidth: 1, color: AppColor.subText)),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(AppAsset.blockEdge, scale: 4.5);
                                    },
                                  ),
                                ).pSymmetric(v: 15),
                              ).px(15),
                            ),
                            20.heightBox,

                            SlideFadeTransition(
                              index: 3,
                              child: SizedBox(
                                height: context.responsive.heightPercent(5),
                                child: ListView.separated(
                                  controller: homeCtrl.planScrollController,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(horizontal: context.responsive.widthPercent(4)),
                                  itemCount: homeCtrl.subscriptionPlanList.length,
                                  itemBuilder: (context, index) {
                                    final data = homeCtrl.subscriptionPlanList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        homeCtrl.storePlanIndex.value = index;
                                        homeCtrl.storePlanName.value = data.planName.toString();
                                        homeCtrl.storePlanAdsTime.value = data.adTime ?? 0;
                                        homeCtrl.storePlanAds.value = data.planads ?? false;
                                        homeCtrl.storePlanDetailsList.value = data.plans ?? [];
                                        homeCtrl.storePlanDetails.value = data;

                                        final tabContext = homeCtrl.planKeys[index].currentContext;

                                        if (tabContext != null) {
                                          Scrollable.ensureVisible(
                                            tabContext,
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeOut,
                                            alignment: 0.5,
                                          );
                                        }
                                      },
                                      child: AnimatedContainer(
                                        key: homeCtrl.planKeys[index],
                                        duration: const Duration(milliseconds: 250),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: homeCtrl.storePlanIndex.value == index
                                                ? [Color(0xffFF9800), Color(0xffF44336)]
                                                : [AppColor.secondaryButton, AppColor.secondaryButton],
                                          ),
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.bolt_rounded,
                                              size: 20,
                                              color: homeCtrl.storePlanIndex.value == index
                                                  ? AppColor.white
                                                  : AppColor.accentColor,
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              "${data.hashrate}",
                                              textAlign: TextAlign.center,
                                              textHeightBehavior: const TextHeightBehavior(
                                                applyHeightToFirstAscent: false,
                                                applyHeightToLastDescent: false,
                                              ),
                                              style: textMontserrat(
                                                context,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: AppColor.text,
                                              ).copyWith(height: 1),
                                            ),
                                          ],
                                        ).px(16).py(5),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return SizedBox(width: context.responsive.widthPercent(4));
                                  },
                                ),
                              ),
                            ),

                            22.heightBox,

                            homeCtrl.isPurchase.value
                                ? GestureDetector(
                                    onTap: () {
                                      InterstitialAdManager().showInterstitialByCount();
                                      homeCtrl.storeItemData.value = homeCtrl.storePlanDetails.value;
                                      Navigation.pushNamed(Routes.storeInfo);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)]),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'spn'.tr,
                                            style: textMontserrat(context, fontWeight: FontWeight.bold, fontSize: 16),
                                          ).pSymmetric(v: 8),
                                        ],
                                      ),
                                    ).px(15),
                                  )
                                : SizedBox.shrink(),

                            homeCtrl.storePlanAds.value != true
                                ? Obx(() {
                                    final sessionTimer = StoreAdRewardService();
                                    final time = homeCtrl.storePlanAdsTime.value / 60;
                                    return GestureDetector(
                                      onTap: !sessionTimer.isRunning
                                          ? () {
                                              showWatchAdDialog(
                                                context,
                                                text: homeCtrl.storePlanDetails.value.hashrate.toString(),
                                                time: homeCtrl.storePlanDetails.value.adTime ?? 120,
                                                onWatchAd: () {
                                                  handleBoostTap(sessionTimer, homeCtrl.storePlanDetails.value);
                                                },
                                              );
                                            }
                                          : () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColor.secondaryButton,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: sessionTimer.isRunning
                                            ? Text(
                                                sessionTimer.formatDuration(sessionTimer.adRewardTimeLeft.value),
                                                style: textMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600),
                                              ).pSymmetric(v: 8)
                                            : Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: context.responsive.widthPercent(40),
                                                    child: Text(
                                                      'swab'.tr,
                                                      style: textMontserrat(context, fontSize: 14, fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  Text(
                                                    '(${time.toStringAsFixed(0)} minute)',
                                                    style: subTextRoboto(context, color: AppColor.text),
                                                  ),
                                                ],
                                              ).pSymmetric(v: 8),
                                      ).px(15),
                                    ).pOnly(top: 18);
                                  })
                                : SizedBox.shrink(),

                            15.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: FaIcon(FontAwesomeIcons.circleCheck, size: 10, color: AppColor.subText),
                                ),
                                10.widthBox,
                                Flexible(child: Text('s1'.tr, style: subTextMontserrat(context, fontSize: 12))),
                              ],
                            ).px(15),
                            3.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.circleCheck, size: 10, color: AppColor.subText),
                                10.widthBox,
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 's2'.tr,
                                      style: subTextMontserrat(context, fontSize: 12),
                                      children: [
                                        TextSpan(
                                          text: " Privacy Policy",
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigation.pushNamed(Routes.privacyPolicy);
                                            },
                                          style: subTextMontserrat(
                                            context,
                                            fontSize: 12,
                                            color: Color(0xFF4D9EFF),
                                          ).copyWith(decoration: TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).px(15),
                            25.heightBox,
                            SlideFadeTransition(index: 3, child: LargeBanner()),
                            40.heightBox,
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
      /*      body: Column(
        children: [
          Row(
            children: [
              Text("bu".tr, style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ).pOnly(left: 15, right: 15, top: 10, bottom: 15),

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
                              child: CustomCard(
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
                                      '${getMiningPowerValue(homeCtrl.activeHashRate.value).toStringAsFixed(2)}  TH/s',
                                      style: subTextMontserrat(
                                        context,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ).px(15).py(10),
                              ).px(15),
                            ),
                            // SlideFadeTransition(index: 2, child: NativeBanner(radius: 8)).p(15),
                            20.heightBox,
                            SlideFadeTransition(
                              index: 2,
                              child: CarouselSlider.builder(
                                itemCount: homeCtrl.subscriptionPlanList.length,
                                itemBuilder: (context, index, realIndex) {
                                  final data = homeCtrl.subscriptionPlanList[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white30),
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
                                        Divider(height: 0, color: Colors.white30),
                                        5.heightBox,
                                        Center(
                                          child: Image.network(
                                            "${AppConfig.imageBaseurl}${data.image}",
                                            height: context.responsive.heightPercent(18),
                                            width: context.responsive.widthPercent(55),
                                            loadingBuilder: (context, child, loadingProgress) {
                                              if (loadingProgress == null) return child;
                                              return SizedBox(
                                                height: context.responsive.heightPercent(18),
                                                width: context.responsive.widthPercent(18),
                                                child: Center(
                                                  child: CircularProgressIndicator(
                                                    strokeWidth: 1,
                                                    color: AppColor.subText,
                                                  ),
                                                ),
                                              );
                                            },
                                            errorBuilder: (context, error, stackTrace) {
                                              return Image.asset(AppAsset.blockEdge, scale: 4.5);
                                            },
                                          ),
                                        ).pSymmetric(v: 12),
                                        itemDetails("siods".tr, "${data.hashrate}"),
                                        itemDetails("siode".tr, "${data.efficiency}"),
                                        itemDetails("siodn".tr, "${data.miningBoost}"),

                                        12.heightBox,

                                        homeCtrl.isPurchase.value
                                            ? GestureDetector(
                                                onTap: () {
                                                  InterstitialAdManager().showInterstitialByCount();
                                                  homeCtrl.storeItemData.value = data;
                                                  Navigation.pushNamed(Routes.storeInfo);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [Color(0xffFF9800), Color(0xffF44336)],
                                                    ),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'spn'.tr,
                                                        style: textMontserrat(
                                                          context,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15,
                                                        ),
                                                      ).pSymmetric(v: 7),
                                                    ],
                                                  ),
                                                ).px(15),
                                              )
                                            : SizedBox.shrink(),

                                        homeCtrl.isPurchase.value ? 12.heightBox : 0.heightBox,

                                        data.planads != true
                                            ? Obx(() {
                                                final sessionTimer = StoreAdRewardService();
                                                final time = (data.adTime ?? 120) / 60;

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
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: AppColor.secondaryButton,
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child:
                                                        sessionTimer.isRunning &&
                                                            homeCtrl.planAdIndex.value == index
                                                        ? Text(
                                                            sessionTimer.formatDuration(
                                                              sessionTimer.adRewardTimeLeft.value,
                                                            ),
                                                            style: textMontserrat(
                                                              context,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ).pSymmetric(v: 7)
                                                        : Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              SizedBox(
                                                                width: context.responsive.widthPercent(38),
                                                                child: Text(
                                                                  'swab'.tr,
                                                                  style: textMontserrat(
                                                                    context,
                                                                    fontSize: 14,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                '(${time.toStringAsFixed(0)} minute)',
                                                                style: subTextRoboto(
                                                                  context,
                                                                  color: AppColor.text,
                                                                ),
                                                              ),
                                                            ],
                                                          ).pSymmetric(v: 7),
                                                  ).px(15),
                                                );
                                              })
                                            : SizedBox.shrink(),
                                      ],
                                    ),
                                  ).pSymmetric(h: 7);
                                },
                                options: CarouselOptions(
                                  height: context.responsive.heightPercent(
                                    homeCtrl.isPurchase.value ? 48 : 42,
                                  ),
                                  reverse: false,
                                  viewportFraction: 0.8,
                                  initialPage: 1,
                                  enableInfiniteScroll: false,
                                ),
                              ),
                            ),
                            15.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    size: 10,
                                    color: AppColor.subText,
                                  ),
                                ),
                                10.widthBox,
                                Flexible(
                                  child: Text('s1'.tr, style: subTextMontserrat(context, fontSize: 12)),
                                ),
                              ],
                            ).px(15),
                            3.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FaIcon(FontAwesomeIcons.circleCheck, size: 10, color: AppColor.subText),
                                10.widthBox,
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 's2'.tr,
                                      style: subTextMontserrat(context, fontSize: 12),
                                      children: [
                                        TextSpan(
                                          text: " Privacy Policy",
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigation.pushNamed(Routes.privacyPolicy);
                                            },
                                          style: subTextMontserrat(
                                            context,
                                            fontSize: 12,
                                            color: Color(0xFF4D9EFF),
                                          ).copyWith(decoration: TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).px(15),
                            25.heightBox,
                            SlideFadeTransition(index: 3, child: LargeBanner()),
                            40.heightBox,
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),*/
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
          power: data.efficiency ?? '',
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
        Text(
          "$key:  ",
          style: textRoboto(context, fontWeight: FontWeight.bold, fontSize: 13, color: AppColor.subText),
        ),
        Text(
          value,
          style: textRoboto(context, fontWeight: FontWeight.bold, fontSize: 14, color: AppColor.subText),
        ),
      ],
    );
  }

  /*
  Future<void> handleRewardBoostTap({ListReward? data}) async {
    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        if (data?.rewardType == "speed") {
          RewardTimeService().start(
            seconds: data?.time ?? 0,
            bonusPower: double.parse(data?.reward ?? "11.5"),
            bonusType: data?.rewardUnit ?? "",
          );

          try {
            final activeMiner = ActiveBotModel(
              productID: '',
              botType: "${data?.rewardName} Reward",
              type: data?.reward ?? '',
              power: data?.reward ?? '',
              machineType: "",
              duration: data?.time ?? 60,
              addTime: DateTime.now().millisecondsSinceEpoch,
              expireTime: data?.time ?? 60,
            );

            await HiveService().addToBox(activeMiner, boxName: 'brm_activeBot_box');
          } catch (e) {
            debugPrint('$e');
          }
        } else if (data?.rewardType == "btc") {
          double rewardBTC = double.parse(data?.reward ?? "0");
          homeCtrl.totalMineBtc.value += rewardBTC;
        } else {
          final String storedSC = HiveService().getData<String>(AppConfig.superCoin) ?? "0";

          final String rewardSC = data?.reward ?? "0";

          final num getSC = num.parse(storedSC);
          final num reward = num.parse(rewardSC);

          final num totalSC = getSC + reward;

          HiveService().saveData(AppConfig.superCoin, totalSC.toString());
        }
      },
      onAdClosed: () {},
    );

    EasyLoading.dismiss();
  }
*/
}
