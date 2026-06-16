import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ShowBanner extends StatefulWidget {
  final EdgeInsetsGeometry? padding;

  const ShowBanner({super.key, this.padding});

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

  int index = 0;

  final List<String> _adUnitIds = [
    AppConfig.appDataSet?.googleBannerId ?? '',
    AppConfig.appDataSet?.adxBannerId ?? '',
  ];

  Future<void> loadAd() async {
    final adUnitId = _adUnitIds[index].trim();

    _isAdLoaded = true;
    if (mounted) setState(() {});

    BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize(width: MediaQuery.of(context).size.width.toInt(), height: 50),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          bannerAd?.dispose();
          bannerAd = ad as BannerAd?;

          _isAdLoaded = false;
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();

          if (!mounted) return;

          if (index == 0 && _adUnitIds.length > 1) {
            index++;
            loadAd();
          } else {
            _isAdLoaded = false;
            setState(() {});
          }
        },
      ),
    ).load();
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
