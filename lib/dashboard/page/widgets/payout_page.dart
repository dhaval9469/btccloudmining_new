import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
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
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:btccloudmining/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class PayoutPage extends StatefulWidget {
  const PayoutPage({super.key});

  @override
  State<PayoutPage> createState() => _PayoutPageState();
}

class _PayoutPageState extends State<PayoutPage> {
  final HomeCtrl homeCtrl = Get.find();
  late TextEditingController btcWalletIDCtrl;

  double balance = 0.0;

  @override
  void initState() {
    balance = (homeCtrl.totalMineBtc.value + homeCtrl.totalReferralBtc.value);
    btcWalletIDCtrl = TextEditingController(text: HiveService().getData<String>(AppConfig.userBtcAddress));
    homeCtrl.getWithdrawDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customHeader(context, 'swb'.tr),
            Expanded(
              child: cardLayout(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    25.heightBox,
                    SlideFadeTransition(
                      index: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAsset.bitcoin, scale: 18),
                          10.widthBox,
                          Text(
                            balance.toStringAsFixed(12),
                            style: textRoboto(context, fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    SlideFadeTransition(
                      index: 2,
                      child: CommonTextField(
                        hintText: "wbera".tr,
                        controller: btcWalletIDCtrl,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "wberae".tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    10.heightBox,
                    SlideFadeTransition(index: 3, child: pvaCard(text: balance.toStringAsFixed(12))),
                    2.heightBox,
                    SlideFadeTransition(
                      index: 3,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'wbwl'.trParams({
                            "limit": "${AppConfig.appDataSet?.withdrawalLimit}",
                          }),
                          style: subTextRoboto(context, fontSize: 11),
                        ),
                      ),
                    ),
                    15.heightBox,
                    SlideFadeTransition(
                      index: 4,
                      child: GestureDetector(
                        onTap: () async {
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
                              'wbwle'.trParams({"limitError": "${AppConfig.appDataSet?.withdrawalLimit}"}),
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.thirdCard,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              'wbpb'.tr,
                              style: textRoboto(
                                context,
                                color: AppColor.text,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppConfig.appDataSet?.showTwoAd == true
                        ? SlideFadeTransition(index: 4, child: NativeBanner())
                        : SizedBox(),
                    SlideFadeTransition(
                      index: 5,
                      child: Text(
                        "wbwh".tr,
                        style: textMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600),
                      ).pOnly(top: 25, bottom: 2),
                    ),
                    SlideFadeTransition(
                      index: 5,
                      child: Divider(color: Colors.grey.withAlpha(100), thickness: 0.5, height: 0),
                    ),
                    SlideFadeTransition(
                      index: 6,
                      child: Obx(
                        () => homeCtrl.withdrawDetailsList.isEmpty
                            ? Center(
                                child: Text(
                                  "wbydhapy".tr,
                                  style: subTextMontserrat(context, fontSize: 12),
                                ).pOnly(top: 25),
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                itemCount: homeCtrl.withdrawDetailsList.length,
                                itemBuilder: (context, index) {
                                  final data = homeCtrl.withdrawDetailsList[index];
                                  double usdValue =
                                      double.parse(data.dr ?? "") *
                                      (AppConfig.appDataSet?.btcPriceInUSD ?? 0.0);
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
                                            Text(
                                              data.dr.toString(),
                                              style: textRoboto(context, fontSize: 12),
                                            ),
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
                                            Text(
                                              formatted,
                                              style: textMontserrat(context, fontWeight: FontWeight.w600),
                                            ),
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
                    ),
                  ],
                ).px(15),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }

  Widget pvaCard({String? text}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColor.primaryCard),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Text(text ?? '', style: textRoboto(context, fontSize: 16, color: Color(0xFF1F2937))),
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
                    'BTC amount doesn’t match. Please check again!',
                    textAlign: TextAlign.center,
                    style: subTextMontserrat(context, fontSize: 15),
                  ),
                  7.heightBox,
                  Text('Expected: $massage', textAlign: TextAlign.center, style: subTextRoboto(context)),
                  Text(
                    'Received: ${balance.toStringAsFixed(12)}',
                    textAlign: TextAlign.center,
                    style: subTextRoboto(context),
                  ),
                  15.heightBox,
                  AppButton(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    color: AppColor.thirdCard,
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
