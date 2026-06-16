import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IpWidget2 extends StatelessWidget {
  final VoidCallback onNext;

  const IpWidget2({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: Column(
        children: [
          30.heightBox,
          Image.asset(AppAsset.introTwo, scale: 1.8),
          Spacer(),
          Text(
            'Boost Your Mining Power Instantly',
            textAlign: TextAlign.center,
            style: textRoboto(
              context,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.text,
            ),
          ),
          15.heightBox,
          Text(
            'Scale your earnings without expensive equipment. Activate cloud mining and watch your BTC grow effortlessly.',
            textAlign: TextAlign.center,
            style: textMontserrat(context, color: AppColor.subText,fontSize: 13),
          ),
          20.heightBox,
          AppButton(
            padding: EdgeInsets.symmetric(vertical: 6),
            color: AppColor.secondaryButton,
            onTap:onNext,
            text: 'Next',
            fontSize: 17,
          ),
          30.heightBox,
        ],
      ).px(20),
      bottomNavigationBar: SafeArea(child: NativeBanner()),
    );
  }
}
