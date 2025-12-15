import 'package:btccloudmining/ad_modual/banner.dart';
import 'package:btccloudmining/ad_modual/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/interstitial.dart';
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
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(context, title: 'sm'.tr, isNonBack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              15.heightBox,
              CustomCard(
                child: Row(
                  children: [
                    Image.asset(AppAsset.miner, scale: 8),
                    10.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My ASICs',
                          style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        Row(
                          children: [
                            Text('Hashrate: ', style: subTextRoboto(context, fontSize: 12)),
                            Text(
                              '${getMiningPowerValue(homeCtrl.activeHashRate.value).toStringAsFixed(2)} ${getMiningPowerUnit(homeCtrl.activeHashRate.value)}',
                              style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        InterstitialAdManager().showInterstitialByCount();
                        Navigation.pushNamed(Routes.viewActiveAsics);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: context.responsive.widthPercent(25),
                        decoration: BoxDecoration(
                          color: AppColor.card,
                          border: Border.all(color: AppColor.card),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'sva'.tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: subTextRoboto(context, color: Colors.white54),
                        ).pSymmetric(v: 4, h: 2),
                      ),
                    ),
                  ],
                ).p(10),
              ).px(15),
              40.heightBox,
              Obx(
                () => homeCtrl.subscriptionPlanList.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: context.responsive.heightPercent(15)),
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: context.responsive.heightPercent(37),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: homeCtrl.subscriptionPlanList.length,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final data = homeCtrl.subscriptionPlanList[index];
                            return Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: context.responsive.widthPercent(60),
                                      height: context.responsive.heightPercent(32),
                                      decoration: BoxDecoration(
                                        color: AppColor.newCard,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: AppColor.secondCard,
                                              borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(12),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '${data.name}',
                                            style: textRoboto(context, fontWeight: FontWeight.w600),
                                          ).px(12),
                                          3.heightBox,
                                          Divider(color: AppColor.card, height: 0).px(12),
                                          7.heightBox,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Hashrate',
                                                style: subTextRoboto(context, fontSize: 12),
                                              ),
                                              Text(
                                                '${data.hashrate}',
                                                style: textRoboto(
                                                  context,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ).px(12),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Power', style: subTextRoboto(context, fontSize: 12)),
                                              Text(
                                                '${data.power}',
                                                style: textRoboto(
                                                  context,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ).px(12),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Efficiency',
                                                style: subTextRoboto(context, fontSize: 12),
                                              ),
                                              Text(
                                                '${data.efficiency}',
                                                style: textRoboto(
                                                  context,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: AppColor.text,
                                                ),
                                              ),
                                            ],
                                          ).px(12),
                                          13.heightBox,
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColor.thirdCard,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: data.planads == true
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
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              sessionTimer.isRunning &&
                                                                      homeCtrl.planAdIndex.value == index
                                                                  ? sessionTimer.formatDuration(
                                                                      sessionTimer
                                                                          .adRewardTimeLeft
                                                                          .value,
                                                                    )
                                                                  : 'swAdBoost'.tr,
                                                              maxLines: 1,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: subTextRoboto(
                                                                context,
                                                                fontSize: 15,
                                                                color: AppColor.text,
                                                              ),
                                                            ).pSymmetric(h: 7, v: 5),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  })
                                                : SizedBox(height: 28),
                                          ).px(12),
                                          10.heightBox,
                                          homeCtrl.isPurchase.value
                                              ? AppButton(
                                                  padding: EdgeInsets.symmetric(vertical: 5),
                                                  color: AppColor.accent,
                                                  text: 'spn'.tr,
                                                  onTap: () {
                                                    InterstitialAdManager().showInterstitialByCount();
                                                    homeCtrl.storeItemData.value = data;
                                                    Navigation.pushNamed(Routes.storeInfo);
                                                  },
                                                ).px(12)
                                              : SizedBox.shrink(),
                                          10.heightBox,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.newBg,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: AppColor.secondCard, width: 5),
                                    // shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SizedBox(
                                      height: context.responsive.heightPercent(9),
                                      width: context.responsive.widthPercent(35),
                                      child: Image.network(
                                        "${AppConfig.imageBaseurl}${data.image}",
                                        height: context.responsive.heightPercent(9),
                                        width: context.responsive.widthPercent(35),
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
                                          return Image.asset(AppAsset.antminerS19XP);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return 10.widthBox;
                          },
                        ),
                      ),
              ),
              15.heightBox,
              conditionRow('spsub'.tr),
              20.heightBox,
            ],
          ),
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

  conditionRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('●', style: subTextMontserrat(context, color: AppColor.thirdCard)),
        5.widthBox,
        Flexible(child: Text(text, style: subTextMontserrat(context, fontSize: 13))),
      ],
    ).px(15);
  }

  String setImage(int index) {
    return switch (index) {
      0 => AppAsset.one,
      1 => AppAsset.two,
      2 => AppAsset.three,
      3 => AppAsset.four,
      4 => AppAsset.five,
      _ => AppAsset.one,
    };
  }

  double setScale(int index) {
    return switch (index) {
      0 => 9,
      1 => 9,
      2 => 9,
      3 => 12,
      4 => 12,
      _ => 9,
    };
  }
}
