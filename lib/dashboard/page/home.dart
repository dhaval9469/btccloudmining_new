import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:btccloudmining/ad_modual/banner.dart';
import 'package:btccloudmining/ad_modual/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/large_banner.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/active_bot_model.dart';
import 'package:btccloudmining/dashboard/repository/daily_reward.dart';
import 'package:btccloudmining/dashboard/repository/daily_reward_two.dart';
import 'package:btccloudmining/dashboard/repository/start_time_rp.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCtrl homeCtrl = Get.find();
  String? userImage = "";
  String? userName = "";
  String? emailId = "";

  @override
  void initState() {
    super.initState();
    homeCtrl.getActiveBooster();
    userImage = HiveService().getData<String>(AppConfig.userImage);
    userName = HiveService().getData<String>(AppConfig.userName);
    emailId = HiveService().getData<String>(AppConfig.userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          children: [

            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: userImage?.isNotEmpty ?? false
                      ? Image.network(HiveService().getData<String>(AppConfig.userImage) ?? "", scale: 3)
                      : Icon(FontAwesomeIcons.solidCircleUser, size: 35, color: AppColor.white),
                ),
                10.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello, $userName", style: textMontserrat(context, fontSize: 12)),
                    Text(emailId ?? "", style: subTextMontserrat(context, fontSize: 12)),
                  ],
                ),
                10.widthBox,
              ],
            ).p(15),

            Expanded(
              child: cardLayout(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAsset.bitcoin, scale: 18),
                          10.widthBox,
                          Obx(() {
                            return AnimatedFlipCounter(
                              value: homeCtrl.miningBtc.value,
                              fractionDigits: 12,
                              duration: Duration(seconds: 5),
                              curve: Curves.easeOut,
                              textStyle: textRoboto(context, fontSize: 22, fontWeight: FontWeight.w600),
                            );
                          }),
                          5.widthBox,
                          Text("BTC", style: textRoboto(context, fontSize: 19, fontWeight: FontWeight.w600)),
                        ],
                      ).pOnly(top: 20,left: 15,right: 15),

                      Lottie.asset("assets/lottie/cma.json",),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Speed", style: subTextRoboto(context)),
                          Obx(() {
                            return Row(
                              children: [
                                AnimatedFlipCounter(
                                  duration: Duration(seconds: 1),
                                  fractionDigits: 2,
                                  value: getMiningPowerValue(homeCtrl.activeHashRate.value),
                                  textStyle: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  getMiningPowerUnit(homeCtrl.activeHashRate.value),
                                  style: subTextRoboto(context, fontSize: 15),
                                ),
                              ],
                            );
                          }),
                        ],
                      ).px(15),
                      Row(
                        children: [
                          Text("ham".tr, style: subTextRoboto(context, fontSize: 13)),
                          Spacer(),
                          BlinkingGreenDot(),
                          5.widthBox,
                          Obx(
                            () => AnimatedFlipCounter(
                              duration: Duration(seconds: 1),
                              value: int.parse(homeCtrl.activeMiners.value.toString()),
                              textStyle: subTextRoboto(context, fontSize: 13),
                            ),
                          ),
                        ],
                      ).px(15),

                      Obx(() {
                        final sessionTimer = StartTimeService();
                        return GestureDetector(
                          onTap: () => handleMiningTap(sessionTimer),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF4B4CED),
                              // gradient: LinearGradient(colors: [Color(0xFF00A588), Color(0xFF024DC9)]),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppAsset.hammer, scale: 4),
                                  7.widthBox,
                                  Text(
                                    sessionTimer.isRunning
                                        ? sessionTimer.formatDuration(sessionTimer.startTimeLeft.value)
                                        : 'hsm'.tr,
                                    style: textMontserrat(context, color: AppColor.white, fontSize: 17, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).pOnly(right: 15, left: 15, top: 20, bottom: 10),
                      Text(
                        'hsmn'.tr,
                        textAlign: TextAlign.center,
                        style: subTextMontserrat(context, fontSize: 12).copyWith(height: 0),
                      ).px(15),

                      Obx(() {
                        return homeCtrl.activeBotList.isEmpty
                            ? SizedBox.shrink()
                            : CustomCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('hab'.tr, style: textRoboto(context, fontWeight: FontWeight.bold)).px(10),
                                    5.heightBox,
                                    Divider(color: AppColor.card, height: 0),
                                    10.heightBox,
                                    ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: homeCtrl.activeBotList.length,
                                      itemBuilder: (context, index) {
                                        final data = homeCtrl.activeBotList[index];
                                        return Row(
                                          children: [
                                            Image.asset(AppAsset.miner, scale: 12),
                                            10.widthBox,
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(data.botType, style: textRoboto(context, fontSize: 13).copyWith(height: 1)),
                                                Text(data.type, style: subTextRoboto(context, fontSize: 12)),
                                              ],
                                            ),
                                            Spacer(),
                                            StreamBuilder<Duration>(
                                              stream: Stream.periodic(const Duration(seconds: 1), (_) {
                                                return homeCtrl.remainingTime(data);
                                              }),
                                              builder: (context, snapshot) {
                                                final remaining = snapshot.data ?? Duration.zero;
                                                return Text(formatDuration(remaining), style: textRoboto(context, fontSize: 14));
                                              },
                                            ),
                                          ],
                                        ).px(10);
                                      },
                                      separatorBuilder: (BuildContext context, int index) {
                                        return 7.heightBox;
                                      },
                                    ),
                                  ],
                                ).py(10),
                              ).pOnly(left: 15, right: 15, top: 15);
                      }),

                      Row(
                        children: [
                          Expanded(
                            child: CustomCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'hdr'.tr,
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: textRoboto(context),
                                  ),
                                  5.heightBox,
                                  Divider(color: AppColor.card, height: 0),
                                  Row(
                                    children: [
                                      Image.asset(AppAsset.thunderbolt, scale: 25),
                                      7.widthBox,
                                      RichText(
                                        text: TextSpan(
                                          text: AppConfig.appDataSet?.dailyRewardHashRate.toString(),
                                          style: textMontserrat(context, fontSize: 18),
                                          children: [TextSpan(text: ' GH/s', style: subTextRoboto(context))],
                                        ),
                                      ),
                                    ],
                                  ).py(10),
                                  Obx(() {
                                    final service = DailyRewardService();
                                    final isEligible = service.isEligible.value;
                                    final rewardTime = service.rewardTimeLeft.value;
                                    return GestureDetector(
                                      onTap: isEligible
                                          ? () {
                                              showWatchAdDialog(
                                                context,
                                                text: '${AppConfig.appDataSet?.dailyRewardHashRate} GH/s',
                                                time: AppConfig.appDataSet?.dailyRewardTime ?? 120,
                                                onWatchAd: () {
                                                  handleBoostTap(service);
                                                },
                                              );
                                            }
                                          : () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: isEligible ? AppColor.thirdCard : AppColor.thirdCard.withAlpha(50),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          rewardTime != Duration.zero ? service.formatDuration(rewardTime) : 'hadboost'.tr,
                                          style: subTextRoboto(
                                            context,
                                            fontSize: 14,
                                            color: isEligible ? AppColor.white : AppColor.subText,
                                          ),
                                        ).pSymmetric(h: 7, v: 5),
                                      ),
                                    );
                                  }),
                                ],
                              ).p(7),
                            ),
                          ),
                          12.widthBox,
                          Expanded(
                            child: CustomCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'hqr'.tr,
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: textRoboto(context),
                                  ),
                                  5.heightBox,
                                  Divider(color: AppColor.card, height: 0),
                                  Row(
                                    children: [
                                      Image.asset(AppAsset.thunderbolt, scale: 25),
                                      7.widthBox,
                                      RichText(
                                        text: TextSpan(
                                          text: AppConfig.appDataSet?.dailyRewardHashRateTwo.toString(),
                                          style: textMontserrat(context, fontSize: 18),
                                          children: [TextSpan(text: ' GH/s', style: subTextRoboto(context))],
                                        ),
                                      ),
                                    ],
                                  ).py(10),

                                  Obx(() {
                                    final service = DailyRewardServiceTwo();
                                    final isEligible = service.isEligibleTwo.value;
                                    final rewardTime = service.rewardTimeLeftTwo.value;
                                    return GestureDetector(
                                      onTap: isEligible
                                          ? () {
                                              showWatchAdDialog(
                                                context,
                                                text: '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s',
                                                time: AppConfig.appDataSet?.dailyRewardTimeTwo ?? 180,
                                                onWatchAd: () {
                                                  handleBoostTapTwo(service);
                                                },
                                              );
                                            }
                                          : () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: isEligible ? AppColor.thirdCard : AppColor.thirdCard.withAlpha(50),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          rewardTime != Duration.zero ? service.formatDuration(rewardTime) : 'hadboost'.tr,
                                          style: subTextRoboto(
                                            context,
                                            fontSize: 14,
                                            color: isEligible ? AppColor.white : AppColor.subText,
                                          ),
                                        ).pSymmetric(h: 7, v: 5),
                                      ),
                                    );
                                  }),
                                ],
                              ).p(7),
                            ),
                          ),
                        ],
                      ).px(15).py(20),

                      ExpansionTile(
                        backgroundColor: AppColor.newCard,
                        collapsedBackgroundColor: AppColor.newCard,
                        iconColor: AppColor.subText,
                        collapsedIconColor: AppColor.subText,
                        minTileHeight: 20,
                        tilePadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        expansionAnimationStyle: AnimationStyle(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        childrenPadding: EdgeInsets.only(bottom: 15),
                        title: Row(
                          children: [
                            Image.asset(AppAsset.faqs, scale: 18),
                            10.widthBox,
                            Text('FAQs', style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        children: [
                          ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: faqList.length,
                            itemBuilder: (context, index) {
                              final data = faqList[index];
                              return ExpansionTile(
                                backgroundColor: AppColor.secondCard,
                                collapsedBackgroundColor: AppColor.secondCard,
                                iconColor: AppColor.subText,
                                collapsedIconColor: AppColor.subText,
                                expansionAnimationStyle: AnimationStyle(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                childrenPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                title: Text(data.qus.toString(), style: textRoboto(context, fontSize: 15)),
                                children: [Text(data.ans.toString(), style: subTextRoboto(context, fontSize: 13))],
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 12);
                            },
                          ),
                        ],
                      ).pOnly(right: 15, left: 15, bottom: 20),
                    ],
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

  Future<void> handleMiningTap(StartTimeService timer) async {
    if (timer.isRunning) return;
    EasyLoading.show(status: 'Loading ad...');
    await Future.delayed(Duration(seconds: 1));
    IntOrRwdAdManger().showIntORRwdAdOnStart(onReward: () {}, onAdClosed: () {});
    timer.start(seconds: AppConfig.mingTimer);
    EasyLoading.dismiss();
  }

  Future<void> handleBoostTap(DailyRewardService service) async {
    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnGift(
      onReward: () async {
        service.collectReward();

        final activeMiner = ActiveBotModel(
          productID: '',
          botType: 'Daily Reward',
          type: '${AppConfig.appDataSet?.dailyRewardHashRate} GH/s',
          power: '',
          machineType: '',
          duration: AppConfig.appDataSet?.dailyRewardTime ?? 120,
          addTime: DateTime.now().millisecondsSinceEpoch,
          expireTime: AppConfig.appDataSet?.dailyRewardTime ?? 120,
        );

        await HiveService().addToBox(activeMiner, boxName: 'brm_activeBot_box').whenComplete(() {
          homeCtrl.getActiveBooster();
        });
      },
      onAdClosed: () {},
    );

    EasyLoading.dismiss();
  }

  Future<void> handleBoostTapTwo(DailyRewardServiceTwo service) async {
    EasyLoading.show(status: 'Loading ad...');

    await Future.delayed(Duration(seconds: 1));

    IntOrRwdAdManger().showIntORRwdAdOnGift(
      onReward: () async {
        service.collectReward();

        final activeMiner = ActiveBotModel(
          productID: '',
          botType: 'Quick Reward',
          type: '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s',
          power: '',
          machineType: '',
          duration: AppConfig.appDataSet?.dailyRewardTimeTwo ?? 180,
          addTime: DateTime.now().millisecondsSinceEpoch,
          expireTime: AppConfig.appDataSet?.dailyRewardTimeTwo ?? 180,
        );

        await HiveService().addToBox(activeMiner, boxName: 'brm_activeBot_box').whenComplete(() {
          homeCtrl.getActiveBooster();
        });
      },
      onAdClosed: () {},
    );

    EasyLoading.dismiss();
  }

  detailRow({final String? text, final String? subText, final String? image}) {
    return Row(
      children: [
        Text(text ?? "", style: subTextRoboto(context, fontSize: 12)),
        Text(subText ?? "", style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 12)),
      ],
    );
  }
}
