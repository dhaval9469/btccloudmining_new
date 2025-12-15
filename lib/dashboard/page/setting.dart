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
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/cupertino.dart';
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

  int _staggerIndex = 0;

  Widget stagger(Widget child) {
    return StaggerItem(index: _staggerIndex++, child: child);
  }

  @override
  void initState() {
    super.initState();
    userProfile = HiveService().getData<String>(AppConfig.userImage);
    userEmail = HiveService().getData<String>(AppConfig.userEmail);
  }

  @override
  Widget build(BuildContext context) {
    _staggerIndex = 0;
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            stagger(
              Row(
                children: [
                  Text("Setting", style: textMontserrat(context, fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ).p(15),
            ),
            Expanded(
              child: cardLayout(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      stagger(
                        Text(
                          "Profile",
                          style: textMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600),
                        ).pOnly(top: 15, left: 17, bottom: 5),
                      ),
                      stagger(
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF222834),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(13),
                            child: option(
                              onTap: () {
                                InterstitialAdManager().showInterstitialByCount();
                                Navigation.pushNamed(Routes.profilePage);
                              },
                              text: 'sp'.tr,
                              image: AppAsset.profile,
                            ),
                          ),
                        ).px(15),
                      ),

                      stagger(
                        Text(
                          "General",
                          style: textMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600),
                        ).pOnly(top: 15, left: 17, bottom: 5),
                      ),
                      stagger(
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF222834),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(13),
                            child: Column(
                              spacing: 13,
                              children: [
                                option(
                                  onTap: () {
                                    InterstitialAdManager().showInterstitialByCount();
                                    Navigation.pushNamed(Routes.viewActiveAsics);
                                  },
                                  text: 'svaa'.tr,
                                  image: AppAsset.asic,
                                ),
                                option(
                                  onTap: () {
                                    InterstitialAdManager().showInterstitialByCount();
                                    Navigation.pushNamed(Routes.payoutPage);
                                  },
                                  text: 'sbtc'.tr,
                                  image: AppAsset.wallet,
                                ),
                                option(
                                  onTap: () {
                                    Navigation.pushNamed(Routes.referFriendsPage);
                                  },
                                  text: 'sre'.tr,
                                  image: AppAsset.link,
                                ),
                                option(
                                  onTap: () {
                                    InterstitialAdManager().showInterstitialByCount();
                                    Navigation.pushNamed(Routes.languagePage);
                                  },
                                  text: 'sl'.tr,
                                  image: AppAsset.language,
                                ),
                                option(onTap: () => rateUs(), text: 'sru'.tr, image: AppAsset.star),
                                option(onTap: () => shareApp(), text: 'ss'.tr, image: AppAsset.share),
                              ],
                            ),
                          ),
                        ).px(15),
                      ),

                      stagger(
                        Text(
                          "Account & Support",
                          style: textMontserrat(context, fontSize: 15, fontWeight: FontWeight.w600),
                        ).pOnly(top: 15, left: 17, bottom: 5),
                      ),
                      stagger(
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF222834),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(13),
                            child: Column(
                              spacing: 13,
                              children: [
                                option(
                                  onTap: () {
                                    InterstitialAdManager().showInterstitialByCount();
                                    Navigation.pushNamed(Routes.privacyPolicy);
                                  },
                                  text: 'spp'.tr,
                                  image: AppAsset.pp,
                                ),

                                option(
                                  onTap: () {
                                    InterstitialAdManager().showInterstitialByCount();
                                    Navigation.pushNamed(Routes.customerSupport);
                                  },
                                  text: 'scs'.tr,
                                  image: AppAsset.customer,
                                ),
                                option(onTap: () => logOut(), text: 'slo'.tr, image: AppAsset.logout),
                                option(onTap: () => deleteAccount(), text: 'sda'.tr, image: AppAsset.trash),
                              ],
                            ),
                          ),
                        ).px(15),
                      ),
                      20.heightBox,
                    ],
                  ),
                ),
              ),
            ),
          ],
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
              image: DecorationImage(
                image: AssetImage(image ?? ''),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppColor.text.withAlpha(200), // your color
                  BlendMode.srcIn, // best for icons
                ),
              ),
            ),
          ),
          10.widthBox,
          Text(text ?? '', style: textRoboto(context, fontSize: 15, color: AppColor.text.withAlpha(200))),
          Spacer(),
          Icon(CupertinoIcons.right_chevron, color: AppColor.text.withAlpha(200), size: 18),
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
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.circleXmark, color: Colors.transparent, size: 20),
                  Text('sfh'.tr, style: textMontserrat(context, fontWeight: FontWeight.bold, fontSize: 18)),
                  GestureDetector(
                    onTap: () => Navigation.pop(),
                    child: FaIcon(FontAwesomeIcons.circleXmark, color: AppColor.subText, size: 20),
                  ),
                ],
              ),
              12.heightBox,
              Text('sfText'.tr, textAlign: TextAlign.center, style: subTextRoboto(context)),
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
                color: AppColor.thirdCard,
                fontSize: 17,
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
              15.heightBox,
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
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAsset.logout, scale: 10, color: Colors.red),
              15.heightBox,
              Text('slt'.tr, textAlign: TextAlign.center, style: subTextMontserrat(context, fontSize: 15)),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      color: AppColor.thirdCard,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      border: Border.all(color: AppColor.thirdCard),
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
                      color: AppColor.thirdCard.withAlpha(80),
                      border: Border.all(color: AppColor.thirdCard),
                      textColor: AppColor.text,
                      onTap: () {
                        Navigation.pop();
                      },
                      text: 'slnb'.tr,
                    ),
                  ),
                ],
              ),
              15.heightBox,
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
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAsset.trash, scale: 10, color: Colors.red),
              10.heightBox,
              Text('sdh'.tr, textAlign: TextAlign.center, style: subTextMontserrat(context, fontSize: 15)),
              10.heightBox,
              Text('sdsub'.tr, textAlign: TextAlign.center, style: subTextMontserrat(context, fontSize: 13)),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      color: AppColor.thirdCard,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      border: Border.all(color: AppColor.thirdCard),
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
                      color: AppColor.thirdCard.withAlpha(80),
                      border: Border.all(color: AppColor.thirdCard),
                      textColor: AppColor.text,
                      onTap: () {
                        Navigation.pop();
                      },
                      text: 'slnb'.tr,
                    ),
                  ),
                ],
              ),
              15.heightBox,
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
