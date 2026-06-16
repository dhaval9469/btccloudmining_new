import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IpWidget1 extends StatelessWidget {
  final VoidCallback onNext;

  const IpWidget1({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: Column(
        children: [
          30.heightBox,
          Image.asset(AppAsset.introOne, height: 350, fit: BoxFit.cover),
          Spacer(),

          Text(
            'Mine BTC Remotely with Secure Cloud Technology.No Hardware Required. Earn Daily.',
            textAlign: TextAlign.center,
            style: textMontserrat(context, color: AppColor.subText, fontSize: 13),
          ),
          30.heightBox,
          AppButton(
            padding: EdgeInsets.symmetric(vertical: 6),
            color: AppColor.primaryButton,
            onTap: onNext,
            text: 'Next',
            fontSize: 17,
          ),
          50.heightBox,
        ],
      ).px(20),
      bottomNavigationBar: SafeArea(child: NativeBanner()),
    );
  }
}
