import 'package:btccloudmining/ad_modual/big_native.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/widget/blinking_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class ExitPage extends StatelessWidget {
  const ExitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 55),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigation.pop();
                  },
                  child: FaIcon(FontAwesomeIcons.xmark, color: AppColor.subText),
                ),
              ),
            ),
            30.heightBox,
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(AppAsset.appLogo, scale: 5),
            ),
            25.heightBox,
            Text(
              AppConfig.appName,
              style: textMontserrat(context, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            10.heightBox,
            Text(
              "Effortless Bitcoin Mining, anytime, anywhere.",
              style: textMontserrat(context, fontSize: 13),
            ),
            30.heightBox,
            AppButton(
              onTap: () {
                Navigation.pop();
              },
              color: AppColor.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  'WAIT',
                  style: textMontserrat(
                    context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.white,
                  ),
                ),
              ),
            ).px(15),
            15.heightBox,
            BigNative(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 40,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => SystemNavigator.pop(),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: AppColor.thirdCard),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  'Tap to Exit',
                  textAlign: TextAlign.center,
                  style: textMontserrat(
                    context,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          ),
          /*     child: AppButton(
            onTap: () async {
              SystemNavigator.pop();
            },
            text: 'Tap to Exit',
          ),*/
        ),
        /*        child: GestureDetector(
          onTap: () async {
            EasyLoading.show();
            await miningController.saveMiningState(miningController.btcBalance.value);
            EasyLoading.dismiss();
            SystemNavigator.pop();
          },
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColor.best,
            ),
            child: AppText(
              "Tap to Exit",
              color: AppColor.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),*/
      ),
    );
  }
}
