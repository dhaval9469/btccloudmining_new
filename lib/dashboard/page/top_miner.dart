import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class TopMiner extends StatefulWidget {
  const TopMiner({super.key});

  @override
  State<TopMiner> createState() => _TopMinerState();
}

class _TopMinerState extends State<TopMiner> {
  final HomeCtrl homeCtrl = Get.find();

  int _staggerIndex = 0;

  Widget stagger(Widget child) {
    return StaggerItem(index: _staggerIndex++, child: child);
  }

  @override
  Widget build(BuildContext context) {
    _staggerIndex = 0;

    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          children: [
            stagger(
              Row(
                children: [Text("LeaderBoard", style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600))],
              ).p(15),
            ),

            Expanded(
              child: cardLayout(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.name ?? '', style: textMontserrat(context, fontSize: 13, fontWeight: FontWeight.w600)),
                                Text(data.btc ?? '', style: subTextRoboto(context, fontSize: 12, fontWeight: FontWeight.w600)),
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
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }
}
