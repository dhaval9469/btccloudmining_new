import 'package:btccloudmining/ad_modual/interstitial.dart';
import 'package:btccloudmining/dashboard/ctrl/home_ctrl.dart';
import 'package:btccloudmining/dashboard/model/user_model.dart';
import 'package:btccloudmining/dashboard/repository/start_time_rp.dart';
import 'package:btccloudmining/dashboard/service/api_service.dart';
import 'package:btccloudmining/dashboard/service/connection_service.dart';
import 'package:btccloudmining/dashboard/service/subscription_service.dart';
import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/responsiv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/app_navigation/app_navigation.dart';
import '../widget/no_internet_popup.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final HomeCtrl homeCtrl = Get.find();
  late AnimationController _logoController;
  late AnimationController _textController;
  AppUpdateInfo? _updateInfo;
  bool _showLoader = false;

  @override
  void initState() {
    super.initState();

    checkInternet(context);

    _logoController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();

    _textController = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) _textController.forward();
    });
    _textController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showLoader = true;
        });
      }
    });
    Future.delayed(const Duration(seconds: 3), () async {
      checkForUpdate();
      startingHandle();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.newBg,
      body: Container(
        height: context.responsive.heightPercent(100),
        width: context.responsive.widthPercent(100),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAsset.splash), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(height: context.responsive.heightPercent(20)),

            ScaleTransition(
              scale: CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
              child: FadeTransition(
                opacity: _logoController,
                child: Image.asset(AppAsset.appLogo, scale: 4),
              ),
            ),
            50.heightBox,
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -2),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut)),
              child: FadeTransition(
                opacity: _textController,
                child: Text(
                  "BTC Remote Mining",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
            Spacer(),
            _showLoader
                ? CircularProgressIndicator(color: AppColor.subText, strokeWidth: 2)
                : SizedBox(),
            10.heightBox,
            Text(
              "This action may include ads.",
              textAlign: TextAlign.center,
              style: subTextRoboto(context),
            ),
            80.heightBox,
          ],
        ).px(15),
      ),
    );
  }

  startingHandle() async {

    final bool? isLoggedIn = HiveService().getData<bool>(AppConfig.isLogin);

    if (isLoggedIn == true) {
      homeCtrl.userActiveBotList.clear();
      final UserProfileModel userProfileModel = await ApiRepo.userLogin(
        email: HiveService().getData<String>(AppConfig.userEmail),
        reference: '',
        firstTime: '',
      );
      homeCtrl.activeHashRate.value = AppConfig.appDataSet?.startHashRate ?? 9.7;
      homeCtrl.totalMineBtc.value = double.parse(userProfileModel.totalBtcDirect.toString());
      homeCtrl.miningBtc.value = double.parse(userProfileModel.totalBtcDirect.toString());
      homeCtrl.totalReferralBtc.value = double.parse(userProfileModel.totalBtcRefrence.toString());
      homeCtrl.userActiveBotList.addAll(userProfileModel.subscription ?? []);
      AppConfig.mingTimer = userProfileModel.mingTimer ?? 1800;
      AppConfig.factorFast = userProfileModel.factorFast ?? 0.00000000001;
      AppConfig.factorRegular = userProfileModel.factorRegular ?? 0.000000000001;
      AppConfig.factorMedium = userProfileModel.factorMedium ?? 0.0000000000001;
      AppConfig.factorSlow = userProfileModel.factorSlow ?? 0.00000000000001;
      AppConfig.factorUltraSlow = userProfileModel.factorUltraSlow ?? 0.000000000000001;
      AppConfig.miningIntervals = userProfileModel.miningIntervals ?? 60;
      AppConfig.userProfileId = userProfileModel.profileId ?? "";
      AppConfig.referralCode = userProfileModel.profileRefrenceCode ?? "";
    }

    await Future.delayed(const Duration(seconds: 1));
    HiveService().saveData(AppConfig.userEmail, "apptedting51@gmail.com");

    if (isLoggedIn == true) {
      StartTimeService().resumeMiningFromStorage();
      await HiveService().clearBox('brm_activeBot_box');
      Navigation.pushNamed(Routes.bottom);
    } else {
      Navigation.pushNamed(Routes.bottom);
    }
    InterstitialAdManager().showInterstitialAds();
  }

  Future<void> checkForUpdate() async {
    try {
      AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();
      setState(() {
        _updateInfo = updateInfo;
      });

      if (_updateInfo?.updateAvailability == UpdateAvailability.updateAvailable) {
        if (_updateInfo!.immediateUpdateAllowed) {
          InAppUpdate.performImmediateUpdate();
        } else if (_updateInfo!.flexibleUpdateAllowed) {
          // Flexible update
          InAppUpdate.startFlexibleUpdate().then((_) {
            InAppUpdate.completeFlexibleUpdate();
          });
        }
      }
    } catch (e) {
      return;
    }
  }

  Future<void> checkInternet(BuildContext context) async {
    await SubscriptionService().init();
    final hasConnection = await ConnectionService.instance.checkConnection();
    if (!hasConnection) {
      NoInternetPopup.show(
        context,
        onTryAgain: () async {
          checkInternet(context);
          startingHandle();
        },
      );
      return;
    }
  }
}
