import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ShowBanner extends StatefulWidget {
  const ShowBanner({super.key});

  @override
  State<ShowBanner> createState() => _ShowBannerState();
}

class _ShowBannerState extends State<ShowBanner> {
  BannerAd? bannerAd;
  bool _isAdLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (AppConfig.appDataSet?.googleBannerAdStatus == true) {
      loadAd();
    }
  }

  Future<void> loadAd() async {
    final ad = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/9214589741',
      // adUnitId: AppConfig.appDataSet?.googleBannerId ?? '',
      request: const AdRequest(),
      size: AdSize(width: MediaQuery.of(context).size.width.toInt(), height: 60),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
          setState(() => _isAdLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          setState(() => _isAdLoaded = false);
        },
      ),
    );

    await ad.load();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adHeight = bannerAd?.size.height.toDouble() ?? 0;
    final adWidth = bannerAd?.size.width.toDouble() ?? 0;

    return AnimatedSlide(
      offset: _isAdLoaded ? Offset.zero : const Offset(0, 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
      child: AnimatedOpacity(
        opacity: _isAdLoaded ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          height: _isAdLoaded ? adHeight : 0,
          child: bannerAd != null
              ? SizedBox(
            width: adWidth,
            height: adHeight,
            child: AdWidget(ad: bannerAd!),
          )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
