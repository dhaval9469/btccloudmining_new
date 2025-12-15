import 'package:btccloudmining/ad_modual/small_native.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PayoutHistory extends StatefulWidget {
  const PayoutHistory({super.key});

  @override
  State<PayoutHistory> createState() => _PayoutHistoryState();
}

class _PayoutHistoryState extends State<PayoutHistory> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  void initState() {
    super.initState();
    homeCtrl.getWithdrawDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(context, title: 'History'),
      body: Obx(
        () => homeCtrl.withdrawDetailsList.isEmpty
            ? Center(child: NoData(isCenter: true, text: 'You don’t have any payout history yet.'))
            : ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: homeCtrl.withdrawDetailsList.length,
                itemBuilder: (context, index) {
                  final data = homeCtrl.withdrawDetailsList[index];
                  double usdValue =
                      double.parse(data.dr ?? "") * (AppConfig.appDataSet?.btcPriceInUSD ?? 0.0);
                  final formatted = NumberFormat.currency(
                    symbol: '\$',
                    decimalDigits: 4,
                  ).format(usdValue);
                  return CustomCard(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.dr.toString(), style: textRoboto(context, fontSize: 12)),
                            Text(
                              miningDateFormat(data.date ?? ""),
                              style: textRoboto(context, fontSize: 12),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(formatted, style: textMontserrat(context, fontWeight: FontWeight.w600)),
                            Text(
                              data.status ?? '',
                              style: textRoboto(
                                context,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                              // color: Theme.of(context).colorScheme.onSurface),
                            ),
                          ],
                        ),
                      ],
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
