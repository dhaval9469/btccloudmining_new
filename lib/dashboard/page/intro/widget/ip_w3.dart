import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IpWidget3 extends StatelessWidget {
  final VoidCallback onFinish;

  const IpWidget3({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: Column(
        children: [
          30.heightBox,
          Image.asset(AppAsset.introThree, scale: 2),
          Spacer(),
          Text(
            'Track Your Rewards in Real-Time',
            textAlign: TextAlign.center,
            style: textRoboto(context, fontSize: 20, fontWeight: FontWeight.w600, color: AppColor.text),
          ),
          15.heightBox,
          Text(
            'Monitor daily earnings directly from your dashboard. Stay informed and manage your mining progress easily.',
            textAlign: TextAlign.center,
            style: textMontserrat(context, color: AppColor.subText, fontSize: 13),
          ),
          20.heightBox,

          AppButton(
            padding: EdgeInsets.symmetric(vertical: 6),
            color: AppColor.secondaryButton,
            onTap: onFinish,
            text: 'Get Start',
            fontSize: 17,
          ),
          30.heightBox,
        ],
      ).px(20),
      bottomNavigationBar: SafeArea(child: NativeBanner()),
    );
  }
}
