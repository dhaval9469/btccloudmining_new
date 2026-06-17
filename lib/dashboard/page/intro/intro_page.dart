import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
import 'package:btccloudmining/dashboard/page/intro/widget/ip_w1.dart';
import 'package:btccloudmining/dashboard/page/intro/widget/ip_w2.dart';
import 'package:btccloudmining/dashboard/page/intro/widget/ip_w3.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController pageController = PageController();
  int currentPage = 0;

  late List<Widget> introPages;

  @override
  void initState() {
    super.initState();

    introPages = [
      IpWidget1(onNext: goToNextPage),
      IpWidget2(onNext: goToNextPage),
      IpWidget3(onFinish: finishIntro),
    ];
  }

  void goToNextPage() {
    if (currentPage < introPages.length - 1) {
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        currentPage += 1;
      });
    }
  }

  void finishIntro() {
    InterstitialAdManager().showInterstitialAds();
    Navigation.pushNamed(Routes.countryPage);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Scaffold(
        backgroundColor: AppColor.newBg,
        appBar: commonAppBar(),
        body: PageView.builder(
          controller: pageController,
          itemCount: introPages.length,
          itemBuilder: (context, index) => introPages[index],
        ),
      ),
    );
  }

}
