import 'package:btccloudmining/ad_modual/small_native.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class TopMiner extends StatelessWidget {
  TopMiner({super.key});

  final HomeCtrl homeCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(context, title: 'stm'.tr),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
          itemCount: homeCtrl.leaderBoardList.length,
          itemBuilder: (context, index) {
            final data = homeCtrl.leaderBoardList[index];
            double usdValue = double.parse(data.btc ?? "") * (AppConfig.appDataSet?.btcPriceInUSD ?? 0.0);
            final formatted = NumberFormat.currency(symbol: '\$', decimalDigits: 4).format(usdValue);
            return CustomCard(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.name ?? '',
                          style: textRoboto(context, fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          data.btc ?? '',
                          style: textMontserrat(context, fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    2.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(data.message ?? '', style: subTextRoboto(context, fontSize: 12)),
                        ),
                        Text(formatted, style: subTextMontserrat(context, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
        ),
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),

    );
  }
}
