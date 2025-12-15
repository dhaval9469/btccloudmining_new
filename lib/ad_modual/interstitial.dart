import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const int maxFailedLoadAttempts = 3;

class InterstitialAdManager {
  static final InterstitialAdManager _instance = InterstitialAdManager._internal();

  factory InterstitialAdManager() => _instance;

  InterstitialAdManager._internal();

  InterstitialAd? _adMobInterstitialAd;

  static const AdRequest _request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  bool isInterstitialAdLoaded = false;

  int _numInterstitialLoadAttempts = 0;
  int interstitialAdShow = 0;

  bool _isShowingAd = false;

  bool get isShowingAd => _isShowingAd;

  void loadAdMobAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      // adUnitId: AppConfig.appDataSet?.googleInterstitialId ?? '',
      request: _request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _adMobInterstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          isInterstitialAdLoaded = true;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _numInterstitialLoadAttempts += 1;
          _adMobInterstitialAd = null;
          isInterstitialAdLoaded = false;
          if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
            loadAdMobAd();
          }
        },
      ),
    );
  }

  void showInterstitialAds() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (_adMobInterstitialAd != null) {
        _isShowingAd = true;

        _adMobInterstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            _isShowingAd = false;
            ad.dispose();
            loadAdMobAd();
          },
          onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
            _isShowingAd = false;
            ad.dispose();
            loadAdMobAd();
          },
        );

        _adMobInterstitialAd?.show();
        _adMobInterstitialAd = null;
      } else {
        loadAdMobAd();
      }
    }
  }

  void showInterstitialByCount() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (interstitialAdShow == AppConfig.appDataSet?.interstitialAdCount) {
        interstitialAdShow = 0;

        if (_adMobInterstitialAd != null) {
          _isShowingAd = true;

          _adMobInterstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              _isShowingAd = false;
              ad.dispose();
              loadAdMobAd();
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
              _isShowingAd = false;
              ad.dispose();
              loadAdMobAd();
            },
          );

          _adMobInterstitialAd?.show();
          _adMobInterstitialAd = null;
        } else {
          loadAdMobAd();
        }
      } else {
        interstitialAdShow++;
      }
    }
  }

  void showInterstitial({required VoidCallback onAdClosed}) {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      if (_adMobInterstitialAd != null) {
        _isShowingAd = true;

        _adMobInterstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            _isShowingAd = false;
            ad.dispose();
            loadAdMobAd();

            onAdClosed();
          },
          onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
            _isShowingAd = false;
            ad.dispose();
            loadAdMobAd();

            onAdClosed();
          },
        );

        _adMobInterstitialAd?.show();
        _adMobInterstitialAd = null;
      } else {
        loadAdMobAd();
        onAdClosed();
      }
    }
  }
}
