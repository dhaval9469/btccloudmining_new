
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdManager {
  static final RewardedAdManager _instance = RewardedAdManager._internal();

  factory RewardedAdManager() => _instance;

  RewardedAdManager._internal();

  RewardedInterstitialAd? _rewardedAd;
  bool _isAdLoading = false;
  bool _isShowingAd = false;

  bool get isAdReady => _rewardedAd != null;

  bool get isShowingAd => _isShowingAd;

  void loadAd() {
    if (_isAdLoading || _rewardedAd != null) return;

    _isAdLoading = true;
    RewardedInterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5354046379',
      // adUnitId: AppConfig.appDataSet?.googleRewardedIntrestialId ?? '',
      request: const AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isAdLoading = false;
          _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              _isShowingAd = false;

              ad.dispose();
              _rewardedAd = null;
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              _isShowingAd = false;
              ad.dispose();
              _rewardedAd = null;
              _isAdLoading = false;
            },
            onAdShowedFullScreenContent: (ad) {
              _isShowingAd = true;
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isAdLoading = false;
          _rewardedAd = null;
        },
      ),
    );
  }

  void showAd({
    required VoidCallback onUserEarnedReward,
    required VoidCallback onAdClosed,
  }) {
    if (_rewardedAd == null) {
      onAdClosed();
      loadAd();
      return;
    }
    _isShowingAd = true;

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        ad.dispose();
        _rewardedAd = null;
        _isAdLoading = false;
        loadAd();
        onAdClosed();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        ad.dispose();
        _rewardedAd = null;
        _isAdLoading = false;
        loadAd();
        onAdClosed();
      },
    );

    _rewardedAd!.show(
      onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        onUserEarnedReward();
      },
    );
  }
}
