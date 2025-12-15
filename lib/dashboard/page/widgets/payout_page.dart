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
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class PayoutPage extends StatefulWidget {
  const PayoutPage({super.key});

  @override
  State<PayoutPage> createState() => _PayoutPageState();
}

class _PayoutPageState extends State<PayoutPage> {
  final HomeCtrl homeCtrl = Get.find();
  double balance = 0.0;
  String btcWalletID = '';

  @override
  void initState() {
    balance = (homeCtrl.totalMineBtc.value + homeCtrl.totalReferralBtc.value);
    btcWalletID = HiveService().getData<String>(AppConfig.userBtcAddress) ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(context, title: 'Payout'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.bitcoin),
              10.widthBox,
              Text(
                balance.toStringAsFixed(12),
                style: textMontserrat(context, fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ],
          ),
          20.heightBox,
          pvaCard(text: btcWalletID),
          10.heightBox,
          pvaCard(text: balance.toStringAsFixed(12)),
          2.heightBox,
          Align(
            alignment: Alignment.topRight,
            child: Text('withdrawal Limit: 0.1 BTC', style: subTextRoboto(context, fontSize: 11)),
          ),
          15.heightBox,
          GestureDetector(
            onTap: () async {
              if (isProfileComplete()) {
                double withdrawalLimit = AppConfig.appDataSet?.withdrawalLimit ?? 0.0;

                if (balance >= withdrawalLimit) {
                  AddWDModel addWDModel = await ApiRepo.addWithdrawDetails(
                    email: HiveService().getData<String>(AppConfig.userEmail),
                    btc: balance.toStringAsFixed(12),
                  );
                  if (addWDModel.statusCode == '200') {
                    homeCtrl.totalMineBtc.value = 0.000000000000;
                    homeCtrl.totalReferralBtc.value = 0.000000000000;
                    homeCtrl.miningBtc.value = 0.000000000000;
                    HiveService().deleteData(AppConfig.btcBalance);
                  } else {
                    withdrawErrorDialog(massage: addWDModel.blanace?.toStringAsFixed(12));
                  }
                } else {
                  EasyLoading.showToast(
                    'You must have at least ${AppConfig.appDataSet?.withdrawalLimit} BTC to withdraw.',
                  );
                }
              } else {
                EasyLoading.showToast('Please update your profile before making a withdrawal.');
                AppConfig.bottomBarValue.value = 3;
                Navigation.pop();
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text('Proceed', style: textRoboto(context, color: AppColor.white, fontSize: 16)),
              ),
            ),
          ),
          15.heightBox,
          Text(
            'Please read carefully before proceeding.',
            style: subTextRoboto(context, fontSize: 13).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: AppColor.secondaryCard.withAlpha(100),
            ),
          ),
          10.heightBox,
          Text(
            'Transaction fees are necessary for blockchain transactions and are not controlled by this platform. Fees may vary based on blockchain network conditions. Please refer to the specific fees; the amount credited will be the withdrawal amount minus the blockchain fees. Transaction fees for the BTC network and BEP-20 network are relatively high. You can verify these fees on the blockchain.',
            style: TextStyle(fontSize: 12, color: AppColor.subText),
          ),
          Text(
            'Please ensure you use a secure and reliable BTC wallet, and double-check the wallet address to ensure the safety of your funds.',
            style: TextStyle(fontSize: 12, color: AppColor.subText),
          ),
        ],
      ).px(15),
    );
  }

  Widget pvaCard({String? text}) {
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
        style: (text?.isEmpty ?? true) ? subTextRoboto(context,color: Color(0xFF6B7280)) : textMontserrat(context, fontSize: 15,color: Color(0xFF1F2937)),
      ),
    );
  }

  void withdrawErrorDialog({String? massage}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 30),
          child: CustomCard(
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(AppAsset.error404, height: 150, fit: BoxFit.fill, repeat: true),
                  10.heightBox,
                  Text(
                    '⚠ BTC amount doesn’t match!',
                    textAlign: TextAlign.center,
                    style: textRoboto(context, fontSize: 15),
                  ),
                  7.heightBox,
                  Text(
                    'Expected: $massage',
                    textAlign: TextAlign.center,
                    style: textMontserrat(context),
                  ),
                  Text(
                    'Received: ${balance.toStringAsFixed(12)}',
                    textAlign: TextAlign.center,
                    style: textMontserrat(context),
                  ),
                  15.heightBox,
                  AppButton(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    color: AppColor.primary,
                    onTap: () {
                      Navigation.pop();
                      AppConfig.bottomBarValue.value = 0;
                      Navigation.popAndPushNamed(Routes.bottom);
                      InterstitialAdManager().showInterstitialByCount();
                    },
                    text: 'Close',
                  ),
                  10.heightBox,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
