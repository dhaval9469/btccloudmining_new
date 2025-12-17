import 'package:btccloudmining/ad_modual/native/small_native.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class ReferFriendsPage extends StatefulWidget {
  const ReferFriendsPage({super.key});

  @override
  State<ReferFriendsPage> createState() => _ReferFriendsPageState();
}

class _ReferFriendsPageState extends State<ReferFriendsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.newBg,
        body: Column(
          children: [
            customHeader(context, 'sre'.tr),
            Expanded(
              child: cardLayout(
                child: Column(
                  children: [
                    30.heightBox,
                    SlideFadeTransition(
                      index: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Your Referral Code", style: textMontserrat(context)),
                          GestureDetector(
                            onTap: () async {
                              final message = AppConfig.referralCode;
                              await SharePlus.instance.share(ShareParams(text: message));
                            },
                            child: FaIcon(FontAwesomeIcons.shareNodes, color: AppColor.text, size: 15),
                          ),
                        ],
                      ).px(15),
                    ),
                    15.heightBox,
                    SlideFadeTransition(
                      index: 2,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColor.card),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppConfig.referralCode,
                                style: textMontserrat(context, fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ).px(15),
                    ),
                    20.heightBox,
                    SlideFadeTransition(
                      index: 3,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await FlutterClipboard.copy(AppConfig.referralCode);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColor.thirdCard),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.copy, color: AppColor.subText, size: 15),
                                      10.widthBox,
                                      Text(
                                        "Copy Code",
                                        style: subTextMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          15.widthBox,
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final message = AppConfig.referralCode;
                                await SharePlus.instance.share(ShareParams(text: message));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColor.thirdCard),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.slideshare, color: AppColor.subText, size: 15),
                                      10.widthBox,
                                      Text("Share", style: subTextMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ).px(15),
                    ),
                    25.heightBox,
                    SlideFadeTransition(
                      index: 4,
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.gift, color: AppColor.subText, size: 15),
                          10.widthBox,
                          Text(
                            "Benefits of Referrals",
                            style: subTextMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ).px(15),
                    ),
                    15.heightBox,
                    SlideFadeTransition(index: 5, child: benefitRow('Get 0.00000005 BTC for every referral')),
                    SlideFadeTransition(index: 6, child: benefitRow('Your friends get huge bonuses to start mining')),
                    SlideFadeTransition(index: 7, child: benefitRow('Unlimited referrals – invite as many as you want!')),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SmallNative(),
      ),
    );
  }

  benefitRow(String text) {
    return Row(
      children: [
        FaIcon(FontAwesomeIcons.circleCheck, color: AppColor.subText, size: 12),
        10.widthBox,
        Text(text, style: subTextMontserrat(context, fontSize: 12)),
      ],
    ).px(15);
  }
}
