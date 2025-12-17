import 'package:btccloudmining/ad_modual/banner/banner.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/active_bot_model.dart';
import 'package:btccloudmining/dashboard/repository/storead_rewardservice.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
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
              children: [Text("Upgrade", style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600))],
            ).p(15),

            Obx(
              () => !homeCtrl.subscriptionPlanList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: context.responsive.heightPercent(30)),
                      child: Column(children: [CircularProgressIndicator()]),
                    )
                  : Expanded(
                      child: cardLayout(
                        child: AnimationLimiter(
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.65,
                            ),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                            itemCount: subPlanList.length,
                            // itemCount: homeCtrl.subscriptionPlanList.length,
                            itemBuilder: (context, index) {
                              // final data = homeCtrl.subscriptionPlanList[index];
                              final data = subPlanList[index];
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
                                            style: textMontserrat(context, fontSize: 14, fontWeight: FontWeight.bold),
                                          ).pSymmetric(v: 8),
                                          Divider(height: 0, color: AppColor.thirdCard),
                                          Center(
                                            child: Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(image: AssetImage("${data.image}")),
                                              ),
                                            ),
                                          ),
                                          itemDetails("Speed", "${data.speed}"),
                                          2.heightBox,
                                          itemDetails("Earning", "${data.earning}"),
                                          15.heightBox,
                                          data.planads == true
                                              ? Obx(() {
                                                  final sessionTimer = StoreAdRewardService();
                                                  return GestureDetector(
                                                    onTap: !sessionTimer.isRunning
                                                        ? () {
                                                            showWatchAdDialog(
                                                              context,
                                                              text: data.speed.toString(),
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
                                                                sessionTimer.isRunning && homeCtrl.planAdIndex.value == index
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
                                                    // homeCtrl.storeItemData.value = data;
                                                    homeCtrl.sItemData.value = data;
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
                                                          style: textRoboto(context, fontWeight: FontWeight.bold, fontSize: 15),
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
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: ShowBanner()),
    );
  }

  Future<void> handleBoostTap(StoreAdRewardService timer, planD data) async {
    if (timer.isRunning) return;

    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnPlanAd(
      onReward: () async {
        timer.start(seconds: data.adTime ?? 60, bonusPower: data.speed ?? '25 TH');
        final activeMiner = ActiveBotModel(
          productID: '',
          botType: data.planName.toString(),
          type: data.speed ?? '',
          power: data.speed ?? '',
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
        Text("$key: ", style: textRoboto(context, fontSize: 14, color: AppColor.subText)),
        Text(
          value,
          style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 14, color: AppColor.subText),
        ),
      ],
    );
  }

  final List<planD> subPlanList = [
    planD(
      planName: "Bronze Plan",
      speed: "17 TH/s",
      image: AppAsset.one,
      earning: "3x",
      adTime: 300,
      planads: true,
      plans: [
        PlanDS(
          renetalDays: 7,
          amount: "890",
          planId: "bronze_week",
          description: "",
          discount: 0,
          validity: "Weekly",
          durationSeconds: 604800,
        ),
        PlanDS(
          renetalDays: 30,
          amount: "4899",
          planId: "bronze_month",
          description: "",
          discount: 5,
          validity: "Monthly",
          durationSeconds: 2592000,
        ),
      ],
    ),
    planD(
      planName: "Silver Plan",
      speed: "32 TH/s",
      image: AppAsset.two,
      earning: "5x",
      adTime: 300,
      planads: true,
      plans: [
        PlanDS(
          renetalDays: 7,
          amount: "1599",
          planId: "silver_week",
          description: "Silver weekly mining plan",
          discount: 0,
          validity: "Weekly",
          durationSeconds: 604800,
        ),
        PlanDS(
          renetalDays: 30,
          amount: "7999",
          planId: "silver_month",
          description: "Silver monthly mining plan",
          discount: 8,
          validity: "Monthly",
          durationSeconds: 2592000,
        ),
      ],
    ),
    planD(
      planName: "Gold Plan",
      speed: "55 TH/s",
      image: AppAsset.three,
      earning: "8x",
      adTime: 180,
      planads: true,
      plans: [
        PlanDS(
          renetalDays: 7,
          amount: "2999",
          planId: "gold_week",
          description: "Gold weekly mining plan",
          discount: 0,
          validity: "Weekly",
          durationSeconds: 604800,
        ),
        PlanDS(
          renetalDays: 30,
          amount: "14999",
          planId: "gold_month",
          description: "Gold monthly mining plan",
          discount: 10,
          validity: "Monthly",
          durationSeconds: 2592000,
        ),
      ],
    ),
    planD(
      planName: "Diamond Plan",
      speed: "105 TH/s",
      image: AppAsset.four,
      earning: "12x",
      adTime: 120,
      planads: true,
      plans: [
        PlanDS(
          renetalDays: 7,
          amount: "4999",
          planId: "diamond_week",
          description: "Diamond weekly mining plan",
          discount: 0,
          validity: "Weekly",
          durationSeconds: 604800,
        ),
        PlanDS(
          renetalDays: 30,
          amount: "24999",
          planId: "diamond_month",
          description: "Diamond monthly mining plan",
          discount: 15,
          validity: "Monthly",
          durationSeconds: 2592000,
        ),
      ],
    ),
    planD(
      planName: "Platinum Plan",
      speed: "185 TH/s",
      image: AppAsset.five,
      earning: "15x",
      adTime: 60,
      planads: true,
      plans: [
        PlanDS(
          renetalDays: 7,
          amount: "7999",
          planId: "platinum_week",
          description: "Platinum weekly mining plan",
          discount: 0,
          validity: "Weekly",
          durationSeconds: 604800,
        ),
        PlanDS(
          renetalDays: 30,
          amount: "39999",
          planId: "platinum_month",
          description: "Platinum monthly mining plan",
          discount: 20,
          validity: "Monthly",
          durationSeconds: 2592000,
        ),
      ],
    ),
  ];
}
