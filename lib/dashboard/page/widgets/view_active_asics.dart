import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/responsiv.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class ViewActiveAsics extends StatefulWidget {
  const ViewActiveAsics({super.key});

  @override
  State<ViewActiveAsics> createState() => _ViewActiveAsicsState();
}

class _ViewActiveAsicsState extends State<ViewActiveAsics> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  void initState() {
    super.initState();
    homeCtrl.getActiveSubscription();
  }

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
            customHeader(context, 'scp'.tr),
            Expanded(
              child: cardLayout(
                child: Obx(
                  () => homeCtrl.userActiveBotList.isEmpty
                      ? Center(child: NoData(text: 'wbcp'.tr, isCenter: true))
                      : AnimationLimiter(
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8,
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            itemCount: homeCtrl.userActiveBotList.length,
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom: 20,
                              top: 25,
                            ),
                            itemBuilder: (context, index) {
                              final data = homeCtrl.userActiveBotList[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 300),
                                child: SlideAnimation(
                                  verticalOffset: 20,
                                  child: FadeInAnimation(
                                    child: CustomCard(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${data.botType}', style: textRoboto(context)),
                                          3.heightBox,
                                          Divider(color: AppColor.divider, height: 0),
                                          13.heightBox,
                                          Center(
                                            child: SizedBox(
                                              height: context.responsive.heightPercent(9),
                                              child: Image.network(
                                                "${AppConfig.imageBaseurl}${data.type}",
                                                height: context.responsive.heightPercent(9),
                                                loadingBuilder: (context, child, loadingProgress) {
                                                  if (loadingProgress == null) return child;
                                                  return SizedBox(
                                                    height: context.responsive.heightPercent(9),
                                                    width: context.responsive.widthPercent(9),
                                                    child: Center(
                                                      child: CircularProgressIndicator(
                                                        strokeWidth: 1,
                                                        color: AppColor.subText,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                errorBuilder: (context, error, stackTrace) {
                                                  return Image.asset(AppAsset.blockEdge);
                                                },
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Column(
                                            children: [
                                              detailRow(text: "Speed", subText: "${data.power}"),
                                              detailRow(
                                                text: "Purchase",
                                                subText: convertPurchaseDate(
                                                  data.addTime.toString(),
                                                ),
                                              ),
                                              detailRow(
                                                text: "Validity",
                                                subText: convertPurchaseDate(
                                                  data.expireTime.toString(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ).p(10),
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
        bottomNavigationBar: SafeArea(child: NativeBanner()),
      ),
    );
  }

  String convertPurchaseDate(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat('dd/MM/yyyy').format(parsedDate);
  }

  detailRow({final String? text, final String? subText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text ?? "", style: subTextRoboto(context, fontSize: 13)),
        Text(
          subText ?? "",
          style: subTextRoboto(context, fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }
}
