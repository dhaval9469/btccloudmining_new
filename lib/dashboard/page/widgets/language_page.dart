import 'package:btccloudmining/ad_modual/interstitial.dart';
import 'package:btccloudmining/ad_modual/small_native.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/service/language_service.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
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
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigation.pop(),
                  child: FaIcon(FontAwesomeIcons.arrowLeftLong, color: AppColor.text),
                ),
                Text('sl'.tr, style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.w600)),
                Obx(() {
                  return homeCtrl.isChangingLanguage.value
                      ? Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 1, color: AppColor.white),
                          ),
                        )
                      : GestureDetector(
                          onTap: () async {
                            InterstitialAdManager().showInterstitialByCount();
                            homeCtrl.isChangingLanguage.value = true;
                            await Future.delayed(Duration(seconds: 2));

                            LanguageService.changeLanguage(homeCtrl.languageCode.value);

                              Navigation.pop();
                              homeCtrl.isChangingLanguage.value = false;
                          },
                          child: FaIcon(FontAwesomeIcons.check, color: AppColor.text, size: 20),
                        );
                }),
              ],
            ).p(15),

            Expanded(
              child: cardLayout(
                child: ListView.separated(
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
                            border: Border.all(color: AppColor.card),
                            color: homeCtrl.selectedLanguage.value == index ? AppColor.thirdCard : AppColor.newCard,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  image: DecorationImage(image: NetworkImage('${data['flag']}'), fit: BoxFit.cover),
                                ),
                              ),
                              15.widthBox,
                              Text(
                                '${data['language']}',
                                style: textRoboto(
                                  context,
                                  fontSize: 15,
                                  color: homeCtrl.selectedLanguage.value == index ? AppColor.white : AppColor.text,
                                  fontWeight: homeCtrl.selectedLanguage.value == index ? FontWeight.w600 : FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Radio<int>(
                                value: index,
                                groupValue: homeCtrl.selectedLanguage.value,
                                onChanged: (int? value) {
                                  setState(() {
                                    homeCtrl.selectedLanguage.value = value ?? 0;
                                    homeCtrl.languageCode.value = data['code'].toString();
                                  });
                                },
                                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return AppColor.white;
                                  }
                                  return AppColor.card;
                                }),
                                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ],
                          ).pSymmetric(v: 6, h: 10),
                        ),
                      );
                    });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 12);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: SmallNative()),
    );
  }

  final languagesList = [
    {"language": "English", "code": "en", "flag": "https://flagcdn.com/w80/gb.png"},
    {"language": "French", "code": "fr", "flag": "https://flagcdn.com/w80/fr.png"},
    {"language": "Spanish", "code": "es", "flag": "https://flagcdn.com/w80/es.png"},
    {"language": "Portuguese", "code": "pt", "flag": "https://flagcdn.com/w80/nl.png"},
    {"language": "Malay", "code": "ms", "flag": "https://flagcdn.com/w80/my.png"},
    {"language": "Filipino", "code": "fil", "flag": "https://flagcdn.com/w80/ph.png"},
    {"language": "Swahili", "code": "sw", "flag": "https://flagcdn.com/w80/tz.png"},
    {"language": "Hausa", "code": "ha", "flag": "https://flagcdn.com/w80/ng.png"},
  ];
}
