import 'package:app_settings/app_settings.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NoInternetPopup extends StatelessWidget {
  final VoidCallback? onTryAgain;
  static bool showingPopUp = false;

  const NoInternetPopup({super.key, this.onTryAgain});

  static show(BuildContext context, {VoidCallback? onTryAgain}) {
    if (showingPopUp) {
      return;
    }
    showingPopUp = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: AppColor.newCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: NoInternetPopup(onTryAgain: onTryAgain),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) {
          showingPopUp = false;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAsset.noInternet, scale: 6),
            10.heightBox,
            Text(
              'No Internet',
              style: textRoboto(context, fontWeight: FontWeight.w600, fontSize: 16),
            ),
            5.heightBox,
            Text('Please check your connection to continue.',
                textAlign: TextAlign.center, style: subTextRoboto(context)),
            10.heightBox,
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: openWifiSettings,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        color: AppColor.thirdCard,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Open Settings',
                          style: textRoboto(context,color: AppColor.white),
                        ),
                      ),
                    ),
                  ),
                ),
                7.widthBox,
                Expanded(
                  child: InkWell(
                    onTap: () => tryAgain(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                          color: AppColor.thirdCard,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          'Try Again',
                          style: textRoboto(context,color: AppColor.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> openWifiSettings() async {
    AppSettings.openAppSettings(type: AppSettingsType.wifi);
  }

  void tryAgain(BuildContext context) {
    showingPopUp = false;
    Navigation.pop();
    if (onTryAgain != null) {
      onTryAgain?.call();
    } else {
      Navigation.popAndPushNamed(Routes.splash);
    }
  }
}
