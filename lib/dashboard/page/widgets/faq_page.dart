import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/utils.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        InterstitialAdManager().showInterstitialByBackCount();
        Navigation.pop();
      },
      child: Scaffold(
        backgroundColor: AppColor.newBg,
        appBar: buildCustomAppBar(context, title: 'FAQs'),
        body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          shrinkWrap: true,
          itemCount: faqList.length,
          itemBuilder: (context, index) {
            final data = faqList[index];
            return CustomCard(
              child: ExpansionTile(
                backgroundColor: AppColor.primaryCard,
                collapsedBackgroundColor:AppColor.primaryCard,
                iconColor: AppColor.subText,
                collapsedIconColor: AppColor.subText,
                expansionAnimationStyle: AnimationStyle(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                childrenPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                title: Text(data.qus.toString(), style: textRoboto(context, fontSize: 15)),
                children: [Text(data.ans.toString(), style: subTextRoboto(context, fontSize: 13))],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 12);
          },
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner()),
      ),
    );
  }
}
