import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:btccloudmining/ad_modual/native/big_native.dart';
import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/int_rwd_admanger.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/active_bot_model.dart';
import 'package:btccloudmining/dashboard/repository/daily_reward.dart';
import 'package:btccloudmining/dashboard/repository/daily_reward_two.dart';
import 'package:btccloudmining/dashboard/repository/start_time_rp.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
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
      appBar: commonAppBar(),
      body: Column(
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
                  Text("hh".trParams({"name": "$userName"}), style: textMontserrat(context, fontSize: 12)),
                  Text(emailId ?? "", style: textMontserrat(context, fontSize: 12)),
                ],
              ),
            ],
          ).pOnly(left: 15, right: 15, top: 10, bottom: 15),

          Expanded(
            child: cardLayout(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.heightBox,
                    SlideFadeTransition(
                      index: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(AppAsset.bitcoin, scale: 20),
                          13.widthBox,
                          Obx(() {
                            return AnimatedFlipCounter(
                              value: homeCtrl.miningBtc.value,
                              fractionDigits: 12,
                              duration: Duration(seconds: 5),
                              curve: Curves.easeOut,
                              textStyle: textRoboto(
                                context,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ).copyWith(letterSpacing: 1),
                            );
                          }),
                          10.widthBox,
                          Text("BTC", style: textRoboto(context, fontSize: 18, fontWeight: FontWeight.w600)),
                          Spacer(),
                          ValueListenableBuilder(
                            valueListenable: HiveService().getListenable(keys: [AppConfig.lockMinedBTC]),
                            builder: (context, Box box, _) {
                              bool isLocked = box.get(AppConfig.lockMinedBTC, defaultValue: false);

                              return GestureDetector(
                                onTap: () {
                                  InterstitialAdManager().showInterstitialByCount();
                                  if (isLocked) {
                                    Navigation.pushNamed(Routes.unlockPage);
                                  } else {
                                    Navigation.pushNamed(Routes.lockPage);
                                  }
                                },
                                child: Image.asset(isLocked ? AppAsset.lock : AppAsset.unLock, scale: 22, color: AppColor.text),
                              );
                            },
                          ),
                        ],
                      ).px(15).py(15),
                    ),


                    SlideFadeTransition(
                      index: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AnimatedFlipCounter(
                                      duration: Duration(seconds: 1),
                                      fractionDigits: 2,
                                      value: getMiningPowerValue(homeCtrl.activeHashRate.value),
                                      textStyle: textMontserrat(context, fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2, left: 5),
                                      child: Text("TH/s", style: subTextRoboto(context, fontSize: 20)),
                                    ),
                                  ],
                                );
                              }),

                              Row(
                                children: [
                                  BlinkingGreenDot(),
                                  5.widthBox,
                                  Obx(
                                    () => AnimatedFlipCounter(
                                      duration: Duration(seconds: 1),
                                      value: int.parse(homeCtrl.activeMiners.value.toString()),
                                      textStyle: subTextRoboto(context, fontSize: 13),
                                    ),
                                  ),
                                  5.widthBox,
                                  Text("ham".tr, style: subTextRoboto(context, fontSize: 13)),
                                ],
                              ),
                            ],
                          ),
                          Obx(() {
                            return Lottie.asset(
                              "assets/lottie/splash_lottie.json",
                              height: 100,
                              repeat: true,
                              animate: homeCtrl.isMining.value,
                            );
                          }),
                        ],
                      ).p(10).px(15),
                    ),

                    SlideFadeTransition(index: 3, child: SmallNative()),

                    SlideFadeTransition(
                      index: 4,
                      child: Obx(() {
                        final sessionTimer = StartTimeService();
                        return GestureDetector(
                          onTap: sessionTimer.isRunning
                              ? () {}
                              : () {
                                  showStartAdDialog(
                                    context,
                                    text: 'swadt'.trParams({
                                      "cs": "${getMiningPowerValue(homeCtrl.activeHashRate.value).toStringAsFixed(2)} TH/s",
                                    }),
                                    onWatchAd: () {
                                      handleMiningTap(sessionTimer);
                                    },
                                  );
                                },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xffFF9800), Color(0xffF44336)]),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppAsset.hammer, scale: 4),
                                  7.widthBox,
                                  Text(
                                    sessionTimer.isRunning
                                        ? sessionTimer.formatDuration(sessionTimer.startTimeLeft.value)
                                        : 'hsm'.tr,
                                    style: textMontserrat(
                                      context,
                                      color: AppColor.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).pOnly(right: 15, left: 15, top: 20, bottom: 13),
                    ),

                    SlideFadeTransition(
                      index: 5,
                      child: Text(
                        'hsmn'.tr,
                        textAlign: TextAlign.center,
                        style: subTextMontserrat(context, fontSize: 12).copyWith(height: 0),
                      ).px(15),
                    ),

                    SlideFadeTransition(
                      index: 5,
                      child: Obx(() {
                        return homeCtrl.activeBotList.isEmpty
                            ? SizedBox.shrink()
                            : CustomCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('hab'.tr, style: subTextRoboto(context, fontWeight: FontWeight.w600)).px(10),
                                    7.heightBox,
                                    Divider(color: AppColor.divider, height: 0),
                                    10.heightBox,
                                    ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: homeCtrl.activeBotList.length,
                                      itemBuilder: (context, index) {
                                        final data = homeCtrl.activeBotList[index];
                                        return Row(
                                          children: [
                                            Image.asset(AppAsset.minerAd, scale: 25),
                                            10.widthBox,
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(data.botType, style: subTextRoboto(context, fontSize: 13)),
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
                    ),

                    SlideFadeTransition(
                      index: 6,
                      child: Row(
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
                                    style: subTextRoboto(context),
                                  ),
                                  5.heightBox,
                                  Divider(color: AppColor.divider, height: 0),
                                  Row(
                                    children: [
                                      Image.asset(AppAsset.thunderbolt, scale: 22),
                                      7.widthBox,
                                      RichText(
                                        text: TextSpan(
                                          text: AppConfig.appDataSet?.dailyRewardHashRate.toString(),
                                          style: subTextRoboto(context, fontSize: 18),
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
                                          : () {
                                              EasyLoading.showToast("hdrcm".tr);
                                            },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: isEligible ? AppColor.secondaryButton : AppColor.secondaryButton.withAlpha(100),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          rewardTime != Duration.zero ? service.formatDuration(rewardTime) : 'hadboost'.tr,
                                          style: subTextRoboto(
                                            context,
                                            color: isEligible ? AppColor.subTextTwo : AppColor.subText,
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
                                    style: subTextRoboto(context),
                                  ),
                                  5.heightBox,
                                  Divider(color: AppColor.divider, height: 0),
                                  Row(
                                    children: [
                                      Image.asset(AppAsset.thunderbolt, scale: 22),
                                      7.widthBox,
                                      RichText(
                                        text: TextSpan(
                                          text: AppConfig.appDataSet?.dailyRewardHashRateTwo.toString(),
                                          style: subTextRoboto(context, fontSize: 18),
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
                                          : () {
                                              EasyLoading.showToast("hqrcm".tr);
                                            },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: isEligible ? AppColor.secondaryButton : AppColor.secondaryButton.withAlpha(100),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          rewardTime != Duration.zero ? service.formatDuration(rewardTime) : 'hadboost'.tr,
                                          style: subTextRoboto(
                                            context,
                                            color: isEligible ? AppColor.subTextTwo : AppColor.subText,
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
                      ).px(15).py(18),
                    ),

                    Obx(
                      () => homeCtrl.isPurchase.value
                          ? SlideFadeTransition(
                              index: 7,
                              child: CustomCard(
                                child: Row(
                                  children: [

                                    Image.asset('assets/images/turbo_min.png',scale: 20),
                                    10.widthBox,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Power: ", style: subTextRoboto(context, fontSize: 12)),

                                            Text(
                                              homeCtrl.randomRewardList.value.hashrate.toString(),
                                              style: textRoboto(context, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Boost: ", style: subTextRoboto(context, fontSize: 12)),
                                            Text(
                                              "${homeCtrl.randomRewardList.value.miningBoost}",
                                              style: textRoboto(context, fontWeight: FontWeight.bold,),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        InterstitialAdManager().showInterstitialByCount();
                                        homeCtrl.storeItemData.value = homeCtrl.randomRewardList.value;
                                        Navigation.pushNamed(Routes.storeInfo);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF44336),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          'Turbo Mine',
                                          style: textMontserrat(
                                            context,
                                            color: AppColor.text,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ).pSymmetric(h: 10, v: 6),
                                      ),
                                    ),
                                  ],
                                ).pOnly(top: 10,bottom: 10,right: 12,left: 8),
                              ).px(15),
                            ).pOnly(bottom: 20)
                          : SizedBox.shrink(),
                    ),

                    SlideFadeTransition(
                      index: 8,
                      child: ExpansionTile(
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
                            Image.asset(AppAsset.faqs, scale: 20),
                            10.widthBox,
                            Text('FAQs', style: subTextMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600)),
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
                                backgroundColor: AppColor.cardLayout,
                                collapsedBackgroundColor: AppColor.cardLayout,
                                iconColor: AppColor.subText,
                                collapsedIconColor: AppColor.subText,
                                expansionAnimationStyle: AnimationStyle(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                childrenPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                title: Text(
                                  "${data.qus}",
                                  style: textMontserrat(context, fontWeight: FontWeight.w600, color: AppColor.subTextTwo),
                                ),
                                children: [Text("${data.ans}", style: subTextMontserrat(context, fontSize: 13))],
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 12);
                            },
                          ),
                        ],
                      ).pOnly(right: 15, left: 15, bottom: 20),
                    ),

                    SlideFadeTransition(index: 10, child: BigNativeS()),
                    40.heightBox,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleMiningTap(StartTimeService timer) async {
    if (timer.isRunning) return;
    await Future.delayed(Duration(seconds: 1));
    IntOrRwdAdManger().showIntORRwdAdOnStart(
      onReward: () {},
      onAdClosed: () {
        timer.start(seconds: AppConfig.mingTimer);
      },
    );
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
