import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class TopMiner extends StatefulWidget {
  const TopMiner({super.key});

  @override
  State<TopMiner> createState() => _TopMinerState();
}

class _TopMinerState extends State<TopMiner> {
  final HomeCtrl homeCtrl = Get.find();

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
            customHeader(context, 'bl'.tr),

            Expanded(
              child: cardLayout(
                child: AnimationLimiter(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
                    itemCount: homeCtrl.leaderBoardList.length,
                    itemBuilder: (context, index) {
                      final data = homeCtrl.leaderBoardList[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 300),
                        child: SlideAnimation(
                          verticalOffset: 20,
                          child: FadeInAnimation(
                            child: CustomCard(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.name ?? '',
                                          style: textMontserrat(
                                            context,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              data.message ?? '',
                                              style: subTextRoboto(
                                                context,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            10.widthBox,
                                            Text(
                                              data.btc ?? '',
                                              style: subTextRoboto(
                                                context,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      AppAsset.trophy,
                                      scale: 20,
                                      color: index == 0
                                          ? Color(0xffD4AF37)
                                          : index == 1
                                          ? Color(0xffC0C0C0)
                                          : index == 2
                                          ? Color(0xffCD7F32)
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return index == 2
                          ? SlideFadeTransition(index: 3, child: SmallNative(radius: 8,)).py(10)
                          : index != 0 && index % 10 == 0
                          ? SlideFadeTransition(index: 3, child: NativeBanner(radius: 8,)).py(10)
                          : SizedBox(height: 10);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
