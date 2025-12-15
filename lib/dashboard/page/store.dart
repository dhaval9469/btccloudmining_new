import 'package:btccloudmining/ad_modual/banner.dart';
import 'package:btccloudmining/ad_modual/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/active_bot_model.dart';
import 'package:btccloudmining/dashboard/model/sub_details_model.dart';
import 'package:btccloudmining/dashboard/repository/storead_rewardservice.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/responsiv.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/app_widget.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [Text("Upgrade", style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600))],
            ).p(15),

            Obx(
              () => homeCtrl.subscriptionPlanList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: context.responsive.heightPercent(30)),
                      child: Column(children: [CircularProgressIndicator()]),
                    )
                  : Expanded(
                      child: cardLayout(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.65,
                          ),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          itemCount: 4,
                          // itemCount: homeCtrl.subscriptionPlanList.length,
                          itemBuilder: (context, index) {
                            final data = homeCtrl.subscriptionPlanList[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.thirdCard),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Bronze Plan', style: textRoboto(context, fontSize: 16, fontWeight: FontWeight.w600)),
                                      7.heightBox,
                                      itemDetails("Speed", "${data.hashrate}"),
                                      itemDetails("Mining Speed", "${data.hashrate}"),

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
                                                          sessionTimer.isRunning && homeCtrl.planAdIndex.value == index
                                                              ? sessionTimer.formatDuration(sessionTimer.adRewardTimeLeft.value)
                                                              : 'swAdBoost'.tr,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: subTextRoboto(context, fontSize: 15, color: AppColor.text),
                                                        ).pSymmetric(h: 7, v: 5),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })
                                            : SizedBox(height: 28),
                                      ),
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
                                            )
                                          : SizedBox.shrink(),
                                      10.heightBox,
                                    ],
                                  ).p(12),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
            ),
            20.heightBox,
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

  itemDetails(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key, style: subTextRoboto(context, fontSize: 13)),
        Text(
          value,
          style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 13, color: AppColor.text),
        ),
      ],
    );
  }
}
