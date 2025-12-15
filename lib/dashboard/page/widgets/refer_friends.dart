import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:velocity_x/velocity_x.dart';

class ReferFriendsPage extends StatefulWidget {
  const ReferFriendsPage({super.key});

  @override
  State<ReferFriendsPage> createState() => _ReferFriendsPageState();
}

class _ReferFriendsPageState extends State<ReferFriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          children: [
            customHeader(context, 'sre'.tr),
            Expanded(
              child: cardLayout(
                child: Column(
                  children: [
                    30.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Your Referral Code", style: textMontserrat(context)),
                        FaIcon(FontAwesomeIcons.shareNodes, color: AppColor.text, size: 15),
                      ],
                    ).px(15),
                    15.heightBox,
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColor.card),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("H30OPV", style: textMontserrat(context, fontWeight: FontWeight.bold, fontSize: 18))],
                        ),
                      ),
                    ).px(15),
                    20.heightBox,
                    Row(
                      children: [
                        Expanded(
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
                                  Text("Copy Code", style: subTextMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        15.widthBox,
                        Expanded(
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
                      ],
                    ).px(15),
                    25.heightBox,
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.gift, color: AppColor.subText, size: 15),
                        10.widthBox,
                        Text(
                          "Benefits of Referrals",
                          style: subTextMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ).px(15),
                    15.heightBox,
                    benefitRow('Get 0.00000005 BTC for every referral'),
                    benefitRow('Your friends get huge bonuses to start mining'),
                    benefitRow('Unlimited referrals – invite as many as you want!'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  benefitRow(String text) {
    return Row(
      children: [
        FaIcon(FontAwesomeIcons.circleCheck, color: AppColor.subText, size: 12),
        10.widthBox,
        Text(text, style: subTextMontserrat(context,fontSize: 12)),
      ],
    ).px(15);
  }
}
