import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:btccloudmining/ad_modual/reward_interstitial/interstitial.dart';
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
import 'package:btccloudmining/utils/app_navigation/app_navigation.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:btccloudmining/utils/hive_service.dart';
import 'package:btccloudmining/utils/responsiv.dart';
import 'package:btccloudmining/widget/no_internet_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final HomeCtrl homeCtrl = Get.find();
  AppUpdateInfo? _updateInfo;

  int index = 0;

  NativeAd? _nativeAd;
  bool _isAdLoaded = false;
  final List<String> _adUnitIds = ['ca-app-pub-9944690775325954/6344290680', '/21775744923/example/native'];

  @override
  void initState() {
    super.initState();
    loadNative();
    checkInternet(context);
    checkForUpdate();
    waitStart();
  }

  waitStart() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      startingHandle();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: AppColor.cardLayout,
      body: SafeArea(
        child: Column(
          children: [
            100.heightBox,
            SizedBox(
              height: context.responsive.heightPercent(7),
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: textMontserrat(context, color: AppColor.text, fontSize: 18, fontWeight: FontWeight.w600),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Earn Bitcoin with Cloud Mining Technology',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ).px(15),
            ),
            Expanded(child: Image.asset(AppAsset.appLogo, scale: 2.3)),
            _isAdLoaded == true
                ? Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    ),
                  )
                : SizedBox.shrink(),
            20.heightBox,
        
            Text(
              "This action may include ads",
              textAlign: TextAlign.center,
              style: subTextRoboto(context, color: AppColor.text),
            ),
            15.heightBox,
        
            _nativeAd == null
                ? const SizedBox.shrink()
                : AnimatedSize(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  child: SizedBox(
                    height: 285,
                    width: double.infinity,
                    child: AdWidget(ad: _nativeAd!),
                  ),
                ).px(10),
            15.heightBox,
          ],
        ),
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
      homeCtrl.activeHashRate.value = AppConfig.appDataSet?.startHashRate ?? 9.70;
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

    await Future.delayed(const Duration(seconds: 3));

    if (isLoggedIn == true) {
      StartTimeService().resumeMiningFromStorage();
      await HiveService().clearBox('brm_activeBot_box');
      InterstitialAdManager().showInterstitialAds();
      Navigation.pushNamed(Routes.bottom);
    } else {
      InterstitialAdManager().showInterstitialAds();
      Navigation.pushNamed(Routes.introPage);
    }
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

  Future<void> loadNative() async {

    final adUnitId = _adUnitIds[index].trim();

    _isAdLoaded = true;
    if (mounted) setState(() {});
    NativeAd(
      adUnitId: adUnitId,
      factoryId: 'big_native',
      customOptions: {
        'backgroundColor': "#161B22",
        'textColor': '#E6EDF3',
        'subTextColor': '#8B949E',
        'buttonColor': '#F35383',
        'startColor': '#cd7f32',
      },
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          _nativeAd?.dispose();
          _nativeAd = ad as NativeAd;
          _isAdLoaded = false;
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (!mounted) return;

          if (index == 0 && _adUnitIds.length > 1) {
            index++;
            loadNative();
          } else {
            _isAdLoaded = false;
            setState(() {});
          }
        },
      ),
      request: const AdRequest(),
    ).load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }
}
