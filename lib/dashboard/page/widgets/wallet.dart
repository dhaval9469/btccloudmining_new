import 'package:btccloudmining/ad_modual/banner.dart';
import 'package:btccloudmining/ad_modual/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/addwd_model.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
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
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final HomeCtrl homeCtrl = Get.find();
  double balance = 0.0;
  String? formatted;
  String btcWalletID = '';

  @override
  void initState() {
    balance = (homeCtrl.totalMineBtc.value + homeCtrl.totalReferralBtc.value);
    double usdValue = balance * (AppConfig.appDataSet?.btcPriceInUSD ?? 0.0);
    formatted = NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(usdValue);
    btcWalletID = HiveService().getData<String>(AppConfig.userBtcAddress) ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(
        context,
        title: '',
        isNonBack: true,
        toolbarHeight: 70,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAsset.coin, scale: 2.5),
                15.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          balance.toStringAsFixed(12),
                          style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        7.widthBox,
                        Text(
                          'wtc'.tr,
                          style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      formatted ?? '',
                      style: subTextRoboto(context, fontWeight: FontWeight.w600).copyWith(height: 1),
                    ),
                  ],
                ),
              ],
            ),
            10.heightBox,
            Divider(color: Colors.white, height: 0, thickness: 0.1),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.heightBox,
            Container(
              decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('wmb'.tr, style: textRoboto(context)),
                  Text(
                    homeCtrl.totalMineBtc.value.toStringAsFixed(12),
                    style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ).pSymmetric(v: 4, h: 7),
            ),
            10.heightBox,
            Container(
              decoration: BoxDecoration(color: AppColor.card, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('wrb'.tr, style: textRoboto(context)),
                  Text(
                    homeCtrl.totalReferralBtc.value.toStringAsFixed(12),
                    style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ).pSymmetric(v: 4, h: 7),
            ),
            15.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('wpayout'.tr, style: textRoboto(context, fontWeight: FontWeight.bold, fontSize: 15)),
                GestureDetector(
                  onTap: (){
                    InterstitialAdManager().showInterstitialByCount();
                    Navigation.pushNamed(Routes.payoutHistory);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'wvh'.tr,
                        style: subTextRoboto(
                          context,
                          fontSize: 13,
                          color: Colors.white38,
                        ).copyWith(height: 1.2),
                      ),
                      5.widthBox,
                      Image.asset(AppAsset.raw, scale: 40, color: Colors.white38),
                    ],
                  ),
                ),
              ],
            ),
            5.heightBox,
            Divider(color: AppColor.card, height: 0),
            10.heightBox,
            GestureDetector(
              onTap:() => finishSetup(),
              child: pvaCard(
                text: btcWalletID.isNotEmpty ? btcWalletID : "wbwa".tr,
                style: btcWalletID.isNotEmpty
                    ? textMontserrat(context, fontSize: 15, color: const Color(0xFF1F2937))
                    : subTextRoboto(context, color: const Color(0xFF6B7280)),
              ),
            ),
            13.heightBox,
            pvaCard(text: balance.toStringAsFixed(12)),
            2.heightBox,
            Align(
              alignment: Alignment.topRight,
              child: Text(
                  "wwl".trParams({
                    "btc": "${AppConfig.appDataSet?.withdrawalLimit} BTC",
                  }),
                  style: subTextRoboto(context, fontSize: 11)),
            ),
            15.heightBox,
            GestureDetector(
              onTap: () async {

                  double withdrawalLimit = AppConfig.appDataSet?.withdrawalLimit ?? 0.0;

                  if (balance >= withdrawalLimit) {
                    AddWDModel addWDModel = await ApiRepo.addWithdrawDetails(
                      email: HiveService().getData<String>(AppConfig.userEmail),
                      btc: balance.toStringAsFixed(12),
                    );
                    if (addWDModel.statusCode == '200') {
                      withdrawDialog();
                      homeCtrl.totalMineBtc.value = 0.000000000000;
                      homeCtrl.totalReferralBtc.value = 0.000000000000;
                      homeCtrl.miningBtc.value = 0.000000000000;
                      HiveService().deleteData(AppConfig.btcBalance);
                    } else {
                      withdrawErrorDialog(massage: addWDModel.blanace?.toStringAsFixed(12));
                    }
                  } else {
                    EasyLoading.showToast(
                      "wwlError".trParams({
                        "btcLimit": AppConfig.appDataSet?.withdrawalLimit?.toStringAsFixed(2) ?? '',
                      }),
                    );
                  }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    'wpr'.tr,
                    style: textRoboto(context, color: AppColor.white, fontSize: 16),
                  ),
                ),
              ),
            ),

            15.heightBox,
            Text(
              'wnh'.tr,
              style: subTextRoboto(context, fontSize: 13).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColor.secondaryCard.withAlpha(100),
              ),
            ),
            10.heightBox,
            Text(
              'wnsubone'.tr,
              style: TextStyle(fontSize: 12, color: AppColor.subText),
            ),
            Text(
              'wnsubtwo'.tr,
              style: TextStyle(fontSize: 12, color: AppColor.subText),
            ),
            20.heightBox,
          ],
        ).px(15),
      ),
      bottomNavigationBar: SafeArea(child: ShowBanner()),
    );
  }

  Widget pvaCard({String? text, TextStyle? style}) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.primaryCard,
        border: Border.all(color: AppColor.card),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        text ?? '',
        maxLines: 1,
        style: style ?? textMontserrat(context, fontSize: 15, color: const Color(0xFF1F2937)),
      ),
    );
  }

  finishSetup() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.newCard,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          height: context.responsive.heightPercent(35),
          decoration: BoxDecoration(
            color: AppColor.newCard,
            border: Border(top: BorderSide(color: AppColor.card)),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAsset.setup, scale: 8).py(10),
              Text(
                'wfash'.tr,
                style: textRoboto(context, fontWeight: FontWeight.bold),
              ).pSymmetric(h: 10),
              Text(
                'wfassub'.tr,
                textAlign: TextAlign.center,
                style: subTextRoboto(context, fontSize: 13),
              ).p(10),
              5.heightBox,
              GestureDetector(
                onTap: () {
                  InterstitialAdManager().showInterstitialByCount();
                  Navigation.pop();
                  Navigation.pushNamed(Routes.profilePage);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    child: Text(
                      'wfsb'.tr,
                      style: textRoboto(
                        context,
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ).px(10),
              ),
            ],
          ).p(12),
        );
      },
    );
  }

  withdrawDialog({String? title, String? massage}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.newCard,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          height: context.responsive.heightPercent(41),
          decoration: BoxDecoration(
            color: AppColor.newCard,
            border: Border(top: BorderSide(color: AppColor.card)),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(AppAsset.done, width: 150, height: 150, fit: BoxFit.fill, repeat: true),
              10.heightBox,
              Text(
                'wwh'.tr,
                textAlign: TextAlign.center,
                style: textRoboto(context, fontSize: 15),
              ),
              15.heightBox,
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 6),
                color: AppColor.primary,
                onTap: () {
                  Navigation.pop();
                },
                text: 'wwb'.tr,
              ),
            ],
          ).p(12),
        );
      },
    );
  }

  withdrawErrorDialog({String? massage}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.newCard,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          height: context.responsive.heightPercent(45),
          decoration: BoxDecoration(
            color: AppColor.newCard,
            border: Border(top: BorderSide(color: AppColor.card)),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(AppAsset.error404, height: 150, fit: BoxFit.fill, repeat: true),
              10.heightBox,
              Text(
                'wweh'.tr,
                textAlign: TextAlign.center,
                style: textRoboto(context, fontSize: 15),
              ),
              7.heightBox,
              Text(
                  "weem".trParams({
                    "massage": massage ?? '',
                  }),
                  textAlign: TextAlign.center, style: textMontserrat(context)),
              Text(
                "wer".trParams({
                  "balance": balance.toStringAsFixed(12),
                }),
                textAlign: TextAlign.center,
                style: textMontserrat(context),
              ),
              15.heightBox,
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 6),
                color: AppColor.primary,
                onTap: () {
                  Navigation.pop();
                  InterstitialAdManager().showInterstitialByCount();
                },
                text: 'wc'.tr,
              ),
            ],
          ).p(12),
        );
      },
    );
  }
}
