import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const int maxFailedLoadAttempts = 3;

class InterstitialAdManager {
  static final InterstitialAdManager _instance = InterstitialAdManager._internal();

  factory InterstitialAdManager() => _instance;

  InterstitialAdManager._internal();

  InterstitialAd? _interstitialAd;

  int loadAttempts = 0;
  int interstitialAdShow = 0;
  int interstitialAdBackShow = 0;

  bool _isShowingIntAd = false;

  bool get isShowingIntAd => _isShowingIntAd;

  int _index = 0;

  final List<String> _adUnitIds = [
    AppConfig.appDataSet?.googleInterstitialId ?? '',
    AppConfig.appDataSet?.adxInterstitialId ?? '',
  ];

  void loadAdMobAd() {
    if (_interstitialAd != null) {
      return;
    }

    final adUnitId = _adUnitIds[_index].trim();

    InterstitialAd.load(
      adUnitId: adUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _index = 0;
          loadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          loadAttempts++;

          if (_index == 0 && _adUnitIds.length > 1) {
            _index = 1;
            loadAdMobAd();
            return;
          }

          if (loadAttempts <= maxFailedLoadAttempts) {
            loadAdMobAd();
          }
        },
      ),
    );
  }

  void showInterstitialAds() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (_interstitialAd != null) {
        _isShowingIntAd = true;

        _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            ad.dispose();
            _isShowingIntAd = false;
            loadAdMobAd();
          },
          onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
            ad.dispose();
            _isShowingIntAd = false;
            loadAdMobAd();
          },
        );

        _interstitialAd?.show();
        _interstitialAd = null;
      } else {
        loadAdMobAd();
      }
    }
  }

  void showInterstitialByCount() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (interstitialAdShow == AppConfig.appDataSet?.interstitialAdCount) {
        interstitialAdShow = 0;

        if (_interstitialAd != null) {
          _isShowingIntAd = true;

          _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
              _isShowingIntAd = false;
              loadAdMobAd();
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
              ad.dispose();
              _isShowingIntAd = false;
              loadAdMobAd();
            },
          );

          _interstitialAd?.show();
          _interstitialAd = null;
        } else {
          loadAdMobAd();
        }
      } else {
        interstitialAdShow++;
      }
    }
  }

  void showInterstitialByBackCount() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (interstitialAdBackShow == AppConfig.appDataSet?.interstitialBackAdCount) {
        interstitialAdBackShow = 0;

        if (_interstitialAd != null) {
          _isShowingIntAd = true;

          _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
              _isShowingIntAd = false;
              loadAdMobAd();
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
              ad.dispose();
              _isShowingIntAd = false;
              loadAdMobAd();
            },
          );

          _interstitialAd?.show();
          _interstitialAd = null;
        } else {
          loadAdMobAd();
        }
      } else {
        interstitialAdBackShow++;
      }
    }
  }

  void showInterstitial({required VoidCallback onAdClosed}) {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (_interstitialAd != null) {
        _isShowingIntAd = true;

        _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            ad.dispose();
            _isShowingIntAd = false;
            loadAdMobAd();

            onAdClosed();
          },
          onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
            ad.dispose();
            _isShowingIntAd = false;
            loadAdMobAd();

            onAdClosed();
          },
        );

        _interstitialAd?.show();
        _interstitialAd = null;
      } else {
        loadAdMobAd();
        onAdClosed();
      }
    }
  }
}
