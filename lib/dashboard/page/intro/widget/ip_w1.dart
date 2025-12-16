import 'package:btccloudmining/ad_modual/native/intro_small_native.dart';
import 'package:btccloudmining/ad_modual/native/small_native.dart';
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
          Image.asset(AppAsset.introOne,height: 350,fit: BoxFit.cover),
          Spacer(),
          Text(
            'Earn Bitcoin the Smart Way ',
            textAlign: TextAlign.center,
            style: textRoboto(
              context,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColor.white,
            ),
          ),
          15.heightBox,
          Text(
            'Start remote BTC mining with zero setup.No hardware. No hassle. Just daily earnings on autopilot.',
            textAlign: TextAlign.center,
            style: textMontserrat(context, color: AppColor.white,fontSize: 13),
          ),
          25.heightBox,
          AppButton(
            padding: EdgeInsets.symmetric(vertical: 5),
            color: AppColor.primary,
            onTap:onNext,
            text: 'Next',
            fontSize: 20,
          ),
          20.heightBox,
        ],
      ).px(20),
      bottomNavigationBar: SafeArea(child: IntoSmallNative()),
    );
  }
}
