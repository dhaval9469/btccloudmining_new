import 'package:btccloudmining/ad_modual/small_native.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/mining_record.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/responsiv.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class MiningRecord extends StatefulWidget {
  const MiningRecord({super.key});

  @override
  State<MiningRecord> createState() => _MiningRecordState();
}

class _MiningRecordState extends State<MiningRecord> {
  final HomeCtrl homeCtrl = Get.find();

  MiningRecordModel? miningRecordModel;

  @override
  void initState() {
    super.initState();
    getTimeLineData();
  }

  Future<void> getTimeLineData() async {
    miningRecordModel = await ApiRepo.viewBtc(email: HiveService().getData<String>(AppConfig.userEmail));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(context, title: 'smr'.tr),
      body: Column(
        children: [
          15.heightBox,
          CustomCard(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('wmb'.tr, style: textRoboto(context)),
                    Text(
                      miningRecordModel?.totalBtcDirect ?? '',
                      style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
                Divider(color: AppColor.card),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('wrb'.tr, style: textRoboto(context)),
                    Text(
                      miningRecordModel?.totalBtcRefrence ?? '',
                      style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ).p(10),
          ).px(15),
          20.heightBox,
          miningRecordModel?.data?.isEmpty ?? false
              ? Center(
                  child: NoData(top: context.responsive.heightPercent(20), text: 'mrEmpty'.tr),
                )
              : Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("mdp".tr, style: textMontserrat(context, fontWeight: FontWeight.w600)).px(16),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 7, bottom: 20),
                        itemCount: miningRecordModel?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final data = miningRecordModel?.data?[index];
                          double usdValue =
                              double.parse(data?.cr ?? "") *
                              (AppConfig.appDataSet?.btcPriceInUSD ?? 0.0);
                          final formatted = NumberFormat.currency(
                            symbol: '\$',
                            decimalDigits: 4,
                          ).format(usdValue);
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColor.newCard,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data?.cr.toString() ?? "",
                                        style: textMontserrat(
                                          context,
                                          fontWeight: FontWeight.w600,
                                        ).copyWith(height: 1),
                                      ),
                                      3.heightBox,
                                      Text(
                                        miningDateFormat(data?.date ?? ""),
                                        style: subTextRoboto(context, fontSize: 12).copyWith(height: 1),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    formatted,
                                    style: textMontserrat(
                                      context,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).px(15);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 10.heightBox;
                        },
                      ),
                    ],
                  ),
                ),
        ],
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }
}
