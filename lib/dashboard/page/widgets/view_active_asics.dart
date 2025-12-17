import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
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
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
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
                              childAspectRatio: 0.85,
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            itemCount: homeCtrl.userActiveBotList.length,
                            itemBuilder: (context, index) {
                              final data = homeCtrl.userActiveBotList[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 300),
                                child: SlideAnimation(
                                  verticalOffset: 20,
                                  child: FadeInAnimation(
                                    child: CustomCard(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${data.botType}', style: textRoboto(context)),
                                          5.heightBox,
                                          Center(
                                            child: SizedBox(
                                              height: context.responsive.heightPercent(8.5),
                                              child: Image.network(
                                                "${AppConfig.imageBaseurl}${data.type}",
                                                height: context.responsive.heightPercent(8.5),
                                                loadingBuilder: (context, child, loadingProgress) {
                                                  if (loadingProgress == null) return child;
                                                  return SizedBox(
                                                    child: Center(
                                                      child: CircularProgressIndicator(strokeWidth: 2, color: AppColor.button),
                                                    ),
                                                  );
                                                },
                                                errorBuilder: (context, error, stackTrace) {
                                                  return Image.asset(AppAsset.blockEdge);
                                                },
                                              ),
                                            ),
                                          ),
                                          5.heightBox,
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Hashrate',
                                                    style: subTextRoboto(context, fontWeight: FontWeight.w600, fontSize: 12),
                                                  ),
                                                  Text(data.power ?? '', style: subTextRoboto(context, fontSize: 13)),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Purchase', style: subTextRoboto(context, fontSize: 12)),
                                                  Text(
                                                    convertPurchaseDate(data.addTime.toString()),
                                                    style: subTextRoboto(context, fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Validity', style: subTextRoboto(context, fontSize: 12)),
                                                  Text(
                                                    convertPurchaseDate(data.expireTime.toString()),
                                                    style: subTextRoboto(context, fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ).p(7),
                                    ),
                                  ),
                                ),
                              );

                            },
                          ),
                      ),
                ).pOnly(top: 20, left: 15, right: 15, bottom: 15),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }

  String convertPurchaseDate(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat('dd/MM/yyyy').format(parsedDate);
  }
}
