import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdManager {
  static final RewardedAdManager _instance = RewardedAdManager._internal();

  factory RewardedAdManager() => _instance;

  RewardedAdManager._internal();

  RewardedAd? _rewardedAd;
  bool _isShowingRewAd = false;

  bool get isShowingRewAd => _isShowingRewAd;

  int _index = 0;

  final List<String> _adUnitIds = [
    AppConfig.appDataSet?.googleRewardedId ?? '',
    AppConfig.appDataSet?.adxRewardedId ?? '',
  ];

  void loadAd() {
    if (_rewardedAd != null) return;

    final adUnitId = _adUnitIds[_index].trim();

    RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _index = 0;
        },
        onAdFailedToLoad: (error) {
          _rewardedAd = null;
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
    if (_rewardedAd == null) {
      onAdClosed();
      loadAd();
      return;
    }

    _isShowingRewAd = true;

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingRewAd = true;
      },
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _rewardedAd = null;
        _isShowingRewAd = false;
        onAdClosed();
        loadAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _rewardedAd = null;
        _isShowingRewAd = false;
        onAdClosed();
        loadAd();
      },
    );

    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        onUserEarnedReward();
      },
    );
  }
}
