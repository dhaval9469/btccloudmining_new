class AppDataSetModel {
  AppDataSet? appDataSet;

  AppDataSetModel({this.appDataSet});

  AppDataSetModel.fromJson(Map<String, dynamic> json) {
    appDataSet = json['AppDataSet'] != null
        ? AppDataSet.fromJson(json['AppDataSet'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appDataSet != null) {
      data['AppDataSet'] = appDataSet!.toJson();
    }
    return data;
  }
}

class AppDataSet {
  double? withdrawalLimit;
  double? btcPriceInUSD;
  int? interstitialAdCount;
  int? interstitialAdCountBottomNav;
  bool? showInterstitial;
  bool? showInterstitialStartGiftPlan;
  String? googleInterstitialId;
  bool? googleNativeAdStatus;
  String? googleNativeId;
  bool? googleBannerAdStatus;
  bool? googleLargeBannerAdStatus;
  String? googleBannerId;
  bool? googleAppOpenAdStatus;
  String? googleAppOpenId;
  String? googleRewardedIntrestialId;
  bool? googleRewardedIntrestialStatus;
  bool? googleRewardedNewInt;
  int? start;
  int? gift;
  int? planads;
  String? googleAdaptiveId;
  bool? googleAdaptiveStatus;
  String? contactEmail;
  String? contactWhatsapp;
  int? minMiners;
  int? maxMiners;
  double? startHashRate;
  double? dailyRewardHashRate;
  double? dailyRewardHashRateTwo;
  int? dailyRewardTime;
  int? dailyRewardTimeTwo;
  bool? startRewardAdsFirsTime;
  double? referEarn;


  AppDataSet(
      {this.withdrawalLimit,
        this.btcPriceInUSD,
        this.interstitialAdCount,
        this.interstitialAdCountBottomNav,
        this.showInterstitial,
        this.showInterstitialStartGiftPlan,
        this.googleInterstitialId,
        this.googleNativeAdStatus,
        this.googleNativeId,
        this.googleBannerAdStatus,
        this.googleLargeBannerAdStatus,
        this.googleBannerId,
        this.googleAppOpenAdStatus,
        this.googleAppOpenId,
        this.googleRewardedIntrestialId,
        this.googleRewardedIntrestialStatus,
        this.googleRewardedNewInt,
        this.start,
        this.gift,
        this.planads,
        this.googleAdaptiveId,
        this.googleAdaptiveStatus,
        this.contactEmail,
        this.contactWhatsapp,
        this.minMiners,
        this.maxMiners,
        this.startHashRate,
        this.dailyRewardHashRate,
        this.dailyRewardHashRateTwo,
        this.dailyRewardTime,
        this.dailyRewardTimeTwo,
        this.startRewardAdsFirsTime,
        this.referEarn,
      });

  AppDataSet.fromJson(Map<String, dynamic> json) {
    withdrawalLimit = json['withdrawalLimit'];
    btcPriceInUSD = json['BtcPriceInUSD'];
    interstitialAdCount = json['interstitial_ad_count'];
    interstitialAdCountBottomNav = json['interstitial_ad_count_bottom_nav'];
    showInterstitial = json['show_interstitial'];
    showInterstitialStartGiftPlan = json['show_interstitial_start_gift_plan'];
    googleInterstitialId = json['google_interstitial_id'];
    googleNativeAdStatus = json['google_native_ad_status'];
    googleNativeId = json['google_native_id'];
    googleBannerAdStatus = json['google_banner_ad_status'];
    googleLargeBannerAdStatus = json['google_large_banner_ad_status'];
    googleBannerId = json['google_banner_id'];
    googleAppOpenAdStatus = json['google_app_open_ad_status'];
    googleAppOpenId = json['google_app_open_id'];
    googleRewardedIntrestialId = json['google_rewarded_intrestial_id'];
    googleRewardedIntrestialStatus = json['google_rewarded_intrestial_status'];
    googleRewardedNewInt = json['google_rewarded_new_int'];
    start = json['start'];
    gift = json['gift'];
    planads = json['planads'];
    googleAdaptiveId = json['google_adaptive_id'];
    googleAdaptiveStatus = json['google_adaptive_status'];
    contactEmail = json['contact_email'];
    contactWhatsapp = json['contact_whatsapp'];
    minMiners = json['min_miners'];
    maxMiners = json['max_miners'];
    startHashRate = json['startHashRate'];
    dailyRewardHashRate = json['dailyRewardHashRate'];
    dailyRewardHashRateTwo = json['dailyRewardHashRateTwo'];
    dailyRewardTime = json['dailyRewardTime'];
    dailyRewardTimeTwo = json['dailyRewardTimeTwo'];
    startRewardAdsFirsTime = json['start_rewardads_firstime'];
    referEarn = json['refer_earn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['withdrawalLimit'] = withdrawalLimit;
    data['BtcPriceInUSD'] = btcPriceInUSD;
    data['interstitial_ad_count'] = interstitialAdCount;
    data['interstitial_ad_count_bottom_nav'] =
        interstitialAdCountBottomNav;
    data['show_interstitial'] = showInterstitial;
    data['show_interstitial_start_gift_plan'] =
        showInterstitialStartGiftPlan;
    data['google_interstitial_id'] = googleInterstitialId;
    data['google_native_ad_status'] = googleNativeAdStatus;
    data['google_native_id'] = googleNativeId;
    data['google_banner_ad_status'] = googleBannerAdStatus;
    data['google_large_banner_ad_status'] = googleLargeBannerAdStatus;
    data['google_banner_id'] = googleBannerId;
    data['google_app_open_ad_status'] = googleAppOpenAdStatus;
    data['google_app_open_id'] = googleAppOpenId;
    data['google_rewarded_intrestial_id'] = googleRewardedIntrestialId;
    data['google_rewarded_intrestial_status'] =
        googleRewardedIntrestialStatus;
    data['google_rewarded_new_int'] = googleRewardedNewInt;
    data['start'] = start;
    data['gift'] = gift;
    data['planads'] = planads;
    data['google_adaptive_id'] = googleAdaptiveId;
    data['google_adaptive_status'] = googleAdaptiveStatus;
    data['contact_email'] = contactEmail;
    data['contact_whatsapp'] = contactWhatsapp;
    data['min_miners'] = minMiners;
    data['max_miners'] = maxMiners;
    data['startHashRate'] = startHashRate;
    data['dailyRewardHashRate'] = dailyRewardHashRate;
    data['dailyRewardHashRateTwo'] = dailyRewardHashRateTwo;
    data['dailyRewardTime'] = dailyRewardTime;
    data['dailyRewardTimeTwo'] = dailyRewardTimeTwo;
    data['start_rewardads_firstime'] = startRewardAdsFirsTime;
    data['refer_earn'] = referEarn;
    return data;
  }
}
