import 'package:btccloudmining/ad_modual/native/native_banner.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/service/language_service.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CLanPage extends StatefulWidget {
  const CLanPage({super.key});

  @override
  State<CLanPage> createState() => _CLanPageState();
}

class _CLanPageState extends State<CLanPage> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  void initState() {
    super.initState();
    setSelectedLanguageFromStorage();
  }

  void setSelectedLanguageFromStorage() {
    final langCode = HiveService().getData<String>(AppConfig.locale);
    final index = languagesList.indexWhere((lang) => lang['code'] == langCode);
    homeCtrl.selectedLanguage.value = index >= 0 ? index : 0;
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
        appBar: buildCustomAppBar(
          context,
          leadingIcon: false,
          title: 'sl'.tr,
          actions: [
            Obx(() {
              return homeCtrl.isChangingLanguage.value
                  ? Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 1, color: AppColor.text),
                      ),
                    )
                  : IconButton(
                      onPressed: () async {
                        homeCtrl.isChangingLanguage.value = true;
                        await Future.delayed(Duration(seconds: 2));
                        LanguageService.changeLanguage(homeCtrl.languageCode.value);
                        Navigation.pushNamed(Routes.countryPage);
                        homeCtrl.isChangingLanguage.value = false;
                        // InterstitialAdManager().showInterstitialAds();
                      },
                      icon: Icon(FontAwesomeIcons.check, color: AppColor.text, size: 20),
                    );
            }),
          ],
        ),
        body: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: languagesList.length,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 20),
              itemBuilder: (context, index) {
                final data = languagesList[index];
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      homeCtrl.languageCode.value = data['code'].toString();
                      homeCtrl.selectedLanguage.value = index;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: homeCtrl.selectedLanguage.value == index
                              ? AppColor.primaryButton
                              : AppColor.divider,
                        ),
                        color: homeCtrl.selectedLanguage.value == index
                            ? AppColor.primaryButton
                            : AppColor.newCard,
                      ),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              "${data['flag']}",
                              height: 25,
                              width: 25,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Center(
                                    child: CircularProgressIndicator(strokeWidth: 1, color: AppColor.subText),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return ClipOval(
                                  child: Image.asset(AppAsset.earth, scale: 20, fit: BoxFit.cover),
                                );
                              },
                            ),
                          ),
                          13.widthBox,
                          Text(
                            '${data['language']}',
                            style: textRoboto(
                              context,
                              fontSize: 16,
                              color: homeCtrl.selectedLanguage.value == index
                                  ? AppColor.text
                                  : AppColor.subText,
                              fontWeight: homeCtrl.selectedLanguage.value == index
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          RadioGroup<int>(
                            groupValue: homeCtrl.selectedLanguage.value,
                            onChanged: (int? value) {
                              setState(() {
                                homeCtrl.selectedLanguage.value = value ?? 0;
                                homeCtrl.languageCode.value = data['code'].toString();
                              });
                            },
                            child: Radio<int>(
                              value: index,
                              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                if (states.contains(WidgetState.selected)) {
                                  return AppColor.text;
                                }
                                return AppColor.divider;
                              }),
                              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ],
                      ).pSymmetric(v: 7, h: 10),
                    ),
                  );
                });
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 12);
              },
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(child: NativeBanner()),
      ),
    );
  }

  final languagesList = [
    {"language": "English", "code": "en", "flag": "https://flagcdn.com/w80/gb.png"},
    {"language": "French", "code": "fr", "flag": "https://flagcdn.com/w80/fr.png"},
    {"language": "German", "code": "de", "flag": "https://flagcdn.com/w80/de.png"},
    {"language": "Spanish", "code": "es", "flag": "https://flagcdn.com/w80/es.png"},
    {"language": "Portuguese", "code": "pt", "flag": "https://flagcdn.com/w80/nl.png"},
    {"language": "Malay", "code": "ms", "flag": "https://flagcdn.com/w80/my.png"},
    {"language": "Filipino", "code": "fil", "flag": "https://flagcdn.com/w80/ph.png"},
    {"language": "Swahili", "code": "sw", "flag": "https://flagcdn.com/w80/tz.png"},
    {"language": "Hausa", "code": "ha", "flag": "https://flagcdn.com/w80/ng.png"},
  ];
}
