import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardInterstitialAdManager {
  static final RewardInterstitialAdManager _instance = RewardInterstitialAdManager._internal();

  factory RewardInterstitialAdManager() => _instance;

  RewardInterstitialAdManager._internal();

  RewardedInterstitialAd? _rewardInterstitialAd;

  bool _isShowingAd = false;

  bool get isShowingRewIntAd => _isShowingAd;

  int _index = 0;

  final List<String> _adUnitIds = [
    AppConfig.appDataSet?.googleRewardedIntrestialId ?? '',
    AppConfig.appDataSet?.adxRewardedIntrestialId ?? '',
  ];

  void loadAd() {
    if (_rewardInterstitialAd != null) return;

    final adUnitId = _adUnitIds[_index].trim();

    RewardedInterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardInterstitialAd = ad;
          _index = 0;
        },
        onAdFailedToLoad: (error) {
          _rewardInterstitialAd = null;
          if (_index == 0 && _adUnitIds.length > 1) {
            _index = 1;
            loadAd();
            return;
          }
        },
      ),
    );
  }

  void showAd({required VoidCallback onUserEarnedReward, required VoidCallback onAdClosed}) {
    if (_rewardInterstitialAd == null) {
      onAdClosed();
      loadAd();
      return;
    }
    _isShowingAd = true;

    _rewardInterstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
      },
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _rewardInterstitialAd = null;
        _isShowingAd = false;
        onAdClosed();
        loadAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _rewardInterstitialAd = null;
        _isShowingAd = false;
        onAdClosed();
        loadAd();
      },
    );

    _rewardInterstitialAd!.show(
      onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        onUserEarnedReward();
      },
    );
  }
}
