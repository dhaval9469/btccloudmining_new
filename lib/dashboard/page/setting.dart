import 'package:btccloudmining/ad_modual/banner.dart';
import 'package:btccloudmining/ad_modual/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/dashboard/service/auth_service.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/responsiv.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final HomeCtrl homeCtrl = Get.find();
  String? userProfile = '';
  String? userEmail = '';

  @override
  void initState() {
    super.initState();
    userProfile = HiveService().getData<String>(AppConfig.userImage);
    userEmail = HiveService().getData<String>(AppConfig.userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      appBar: buildCustomAppBar(context, title: 'sah'.tr, isNonBack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.heightBox,

              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(AppAsset.link), fit: BoxFit.fill),
                          ),
                        ),
                        10.widthBox,
                        Text('sre'.tr, style: textRoboto(context)),
                      ],
                    ),
                    5.heightBox,
                    Text(
                      'sresub'.trParams({"btcValue": AppConfig.referEarn.toStringAsFixed(12)}),
                      style: subTextRoboto(context, fontSize: 12).copyWith(height: 1.3),
                    ),
                    10.heightBox,
                    AppButton(
                      color: AppColor.card,
                      onTap: () => shareInvite(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppConfig.referralCode,
                            style: textMontserrat(context, fontSize: 15),
                          ).py(5),
                          5.widthBox,
                          FaIcon(FontAwesomeIcons.share, color: AppColor.white, size: 15),
                        ],
                      ),
                    ),


                  ],
                ).p(10),
              ),

              20.heightBox,
              option(
                onTap: () {
                  InterstitialAdManager().showInterstitialByCount();
                  Navigation.pushNamed(Routes.miningRecord);
                },
                text: 'smr'.tr,
                image: AppAsset.record,
              ),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),
              option(
                onTap: () {
                  InterstitialAdManager().showInterstitialByCount();
                  Navigation.pushNamed(Routes.viewActiveAsics);
                },
                text: 'svaa'.tr,
                image: AppAsset.asic,
              ),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),

              option(
                onTap: () {
                  InterstitialAdManager().showInterstitialByCount();
                  Navigation.pushNamed(Routes.topMiner);
                },
                text: 'stm'.tr,
                image: AppAsset.activeMiner,
              ),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),
              option(
                onTap: () {
                  InterstitialAdManager().showInterstitialByCount();
                  Navigation.pushNamed(Routes.profilePage);
                },
                text: 'sp'.tr,
                image: AppAsset.profile,
              ),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),

              option(onTap: () => rateUs(), text: 'sru'.tr, image: AppAsset.star),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),

              option(onTap: () => shareApp(), text: 'ss'.tr, image: AppAsset.share),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),

              option(
                onTap: () {
                  InterstitialAdManager().showInterstitialByCount();
                  Navigation.pushNamed(Routes.languagePage, arg: {'page': 'setting'});
                },
                text: 'sl'.tr,
                image: AppAsset.language,
              ),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),
              option(
                onTap: () {
                  InterstitialAdManager().showInterstitialByCount();
                  Navigation.pushNamed(Routes.privacyPolicy);
                },
                text: 'spp'.tr,
                image: AppAsset.pp,
              ),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),

              option(
                onTap: () {
                  InterstitialAdManager().showInterstitialByCount();
                  Navigation.pushNamed(Routes.customerSupport);
                },
                text: 'scs'.tr,
                image: AppAsset.customer,
              ),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),
              option(onTap: () => logOut(), text: 'slo'.tr, image: AppAsset.logout),
              Divider(color: Colors.white24, height: 20, thickness: 0.5),
              option(onTap: () => deleteAccount(), text: 'sda'.tr, image: AppAsset.trash),
              20.heightBox,
            ],
          ).px(15),
        ),
      ),
      bottomNavigationBar: SafeArea(child: ShowBanner()),
    );
  }

  option({
    final String? image,
    final GestureTapCallback? onTap,
    final IconData? iconData,
    final String? text,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image ?? ''), fit: BoxFit.fill),
            ),
          ),
          10.widthBox,
          Text(text ?? '', style: textRoboto(context, fontSize: 15, color: AppColor.white)),
          Spacer(),
          Image.asset(AppAsset.raw, scale: 30, color: Colors.white54),
        ],
      ),
    );
  }

  Future<void> shareApp() async {
    final message = 'sShareText'.trParams({"shareAppLink": AppConfig.appLink});

    await SharePlus.instance.share(ShareParams(text: message));
  }

  rateUs() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.newCard,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          height: context.responsive.heightPercent(40),
          decoration: BoxDecoration(
            color: AppColor.newCard,
            border: Border(top: BorderSide(color: AppColor.card)),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.circleXmark, color: Colors.transparent, size: 20),
                  Text(
                    'sfh'.tr,
                    style: textMontserrat(context, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () => Navigation.pop(),
                    child: FaIcon(FontAwesomeIcons.circleXmark, color: AppColor.subText, size: 20),
                  ),
                ],
              ),
              12.heightBox,
              Text('sfText'.tr, textAlign: TextAlign.center, style: textRoboto(context)),
              15.heightBox,
              RatingBar.builder(
                initialRating: homeCtrl.setRating.value,
                minRating: 2,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 35,
                updateOnDrag: true,
                unratedColor: AppColor.card,
                itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const Icon(Icons.sentiment_very_dissatisfied, color: Colors.red);
                    case 1:
                      return const Icon(Icons.sentiment_dissatisfied, color: Colors.redAccent);
                    case 2:
                      return const Icon(Icons.sentiment_neutral, color: Colors.amber);
                    case 3:
                      return const Icon(Icons.sentiment_satisfied, color: Colors.lightGreen);
                    case 4:
                      return const Icon(Icons.sentiment_very_satisfied, color: Colors.green);
                    default:
                      return const Icon(Icons.star, color: Colors.grey); // Fallback
                  }
                },
                onRatingUpdate: (rating) {
                  homeCtrl.setRating.value = rating;
                },
              ),
              20.heightBox,
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 6),
                color: AppColor.primary,
                onTap: () async {
                  Navigation.pop();
                  if (homeCtrl.setRating.value >= 3) {
                    final Uri url = Uri.parse(AppConfig.appLink);
                    if (await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication)) {
                      throw Exception('Could not launch $url');
                    }
                  }
                },
                text: 'sfsb'.tr,
              ),
            ],
          ).p(12),
        );
      },
    );
  }

  logOut() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.newCard,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          height: context.responsive.heightPercent(32),
          decoration: BoxDecoration(
            color: AppColor.newCard,
            border: Border(top: BorderSide(color: AppColor.card)),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAsset.logout, scale: 10),
              15.heightBox,
              Text('slt'.tr, textAlign: TextAlign.center, style: textRoboto(context, fontSize: 16)),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      color: AppColor.primary,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      border: Border.all(color: AppColor.primary),
                      onTap: () async {
                        EasyLoading.show();
                        await AuthService().signOut();
                        HiveService().saveData(AppConfig.isLogin, false);
                        HiveService().clearAllBoxes();
                        EasyLoading.dismiss();
                        Navigation.pop();
                        Navigation.popAndPushNamed(Routes.signInPage);
                        AppConfig.bottomBarValue.value = 0;
                      },
                      text: 'slyb'.tr,
                    ),
                  ),
                  15.widthBox,
                  Expanded(
                    child: AppButton(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      color: AppColor.primary.withAlpha(80),
                      border: Border.all(color: AppColor.primary),
                      textColor: AppColor.text,
                      onTap: () {
                        Navigation.pop();
                      },
                      text: 'slnb'.tr,
                    ),
                  ),
                ],
              ),
            ],
          ).p(12),
        );
      },
    );
  }

  deleteAccount() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.newCard,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          height: context.responsive.heightPercent(38),
          decoration: BoxDecoration(
            color: AppColor.newCard,
            border: Border(top: BorderSide(color: AppColor.card)),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAsset.trash, scale: 10),
              15.heightBox,
              Text('sdh'.tr, textAlign: TextAlign.center, style: textRoboto(context, fontSize: 16)),
              10.heightBox,
              Text('sdsub'.tr, textAlign: TextAlign.center, style: subTextRoboto(context, fontSize: 13)),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      color: AppColor.primary,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      border: Border.all(color: AppColor.primary),
                      onTap: () async {
                        EasyLoading.show();

                        await ApiRepo.accountDelete(
                          email: HiveService().getData<String>(AppConfig.userEmail),
                        );
                        await AuthService().signOut();
                        HiveService().saveData(AppConfig.isLogin, false);
                        HiveService().clearAllBoxes();

                        EasyLoading.dismiss();
                        EasyLoading.showToast("sdstostm".tr, duration: Duration(seconds: 3));
                        Navigation.popAndPushNamed(Routes.signInPage);
                      },
                      text: 'slyb'.tr,
                    ),
                  ),
                  15.widthBox,
                  Expanded(
                    child: AppButton(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      color: AppColor.primary.withAlpha(80),
                      border: Border.all(color: AppColor.primary),
                      textColor: AppColor.text,
                      onTap: () {
                        Navigation.pop();
                      },
                      text: 'slnb'.tr,
                    ),
                  ),
                ],
              ),
            ],
          ).p(12),
        );
      },
    );
  }

  Future<void> shareInvite() async {
    final message = 'sifText'.trParams({
      'referralCode': AppConfig.referralCode,
      "siAppLink": AppConfig.appLink,
    });
    await SharePlus.instance.share(ShareParams(text: message));
  }
}
