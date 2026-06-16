import 'package:btccloudmining/theme/config.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdManager {
  // Singleton setup
  static final AppOpenAdManager _instance = AppOpenAdManager._internal();

  factory AppOpenAdManager() => _instance;

  AppOpenAdManager._internal();

  AppOpenAd? _appOpenAd;
  static bool isShowingAd = false;

  /// Whether an ad is available to be shown.
  bool get isAdAvailable => _appOpenAd != null;

  int _index = 0;

  final List<String> _adUnitIds = [
    AppConfig.appDataSet?.googleAppOpenId ?? '',
    AppConfig.appDataSet?.adxAppOpenId ?? '',
  ];

  /// Load an AppOpenAd (regular load)
  Future<void> loadAd() async {
    final adUnitId = _adUnitIds[_index].trim();

    await AppOpenAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          _index = 0;
        },
        onAdFailedToLoad: (error) {
          if (_index == 0 && _adUnitIds.length > 1) {
            _index = 1;
            loadAd();
            return;
          }
        },
      ),
    );
  }

  /// Load and directly show splash ad
  Future<void> loadSplashAds({required String id}) async {
    await AppOpenAd.load(
      adUnitId: id,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          _appOpenAd!.show();
        },
        onAdFailedToLoad: (error) {
          // Handle the error if needed
        },
      ),
    );
  }

  /// Show the ad if available
  void showAdIfAvailable() {
    if (isShowingAd) return;

    if (!isAdAvailable) {
      loadAd();
      return;
    }

    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        isShowingAd = true;
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd();
      },
    );

    _appOpenAd!.show();
  }
}
