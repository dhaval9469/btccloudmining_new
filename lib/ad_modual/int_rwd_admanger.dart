import 'package:btccloudmining/ad_modual/interstitial.dart';
import 'package:btccloudmining/ad_modual/rewarded.dart';
import 'package:btccloudmining/ad_modual/rewarded_interstitial.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class IntOrRwdAdManger {
  static final IntOrRwdAdManger _instance = IntOrRwdAdManger._internal();

  factory IntOrRwdAdManger() => _instance;

  IntOrRwdAdManger._internal();

  final interstitial = InterstitialAdManager();
  final rewardInterstitial = RewardInterstitialAdManager();
  final rewarded = RewardedAdManager();

  void initAds() {
    if (AppConfig.appDataSet?.showInterstitial == true) {
      interstitial.loadAdMobAd();
    }
    if (AppConfig.appDataSet?.googleRewardedIntrestialStatus == true) {
      rewardInterstitial.loadAd();
    }
    if (AppConfig.appDataSet?.googleRewardedStatus == true) {
      rewarded.loadAd();
    }
  }

  void showIntORRwdAdOnGift({
    required VoidCallback onReward,
    required VoidCallback onAdClosed,
  }) {
    if (AppConfig.appDataSet?.gift == 0 && rewardInterstitial.isAdReady) {
      rewardInterstitial.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.gift == 1 && interstitial.isInterstitialAdLoaded) {
      interstitial.showInterstitial(
        onAdClosed: () {
          onReward();
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.gift == 2 && rewarded.isAdReady) {
      rewarded.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else {
      onReward();
      onAdClosed();
    }
  }

  void showIntORRwdAdOnPlanAd({
    required VoidCallback onReward,
    required VoidCallback onAdClosed,
  }) {
    if (AppConfig.appDataSet?.planads == 0 && rewardInterstitial.isAdReady) {
      rewardInterstitial.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.planads == 1 && interstitial.isInterstitialAdLoaded) {
      interstitial.showInterstitial(
        onAdClosed: () {
          onReward();
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.planads == 2 && rewarded.isAdReady) {
      rewarded.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else {
      EasyLoading.showToast("🎬 No ad available right now. Try again shortly!");
    }
  }

  void showIntORRwdAdOnStart({
    required VoidCallback onReward,
    required VoidCallback onAdClosed,
  }) {
    if (AppConfig.appDataSet?.start == 0 && rewardInterstitial.isAdReady) {
      rewardInterstitial.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.start == 1 && interstitial.isInterstitialAdLoaded) {
      interstitial.showInterstitial(
        onAdClosed: () {
          onReward();
          onAdClosed();
        },
      );
      return;
    } else if (AppConfig.appDataSet?.start == 2 && rewarded.isAdReady) {
      rewarded.showAd(
        onUserEarnedReward: onReward,
        onAdClosed: () {
          onAdClosed();
        },
      );
      return;
    } else {
      onReward();
      onAdClosed();
    }
  }
}
