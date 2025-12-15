import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:velocity_x/velocity_x.dart';

class LargeBanner extends StatefulWidget {
  const LargeBanner({super.key});

  @override
  State<LargeBanner> createState() => _LargeBannerState();
}

class _LargeBannerState extends State<LargeBanner> {
  BannerAd? bannerAd;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (AppConfig.appDataSet?.googleLargeBannerAdStatus == true) {
      loadAd();
    }
  }

  Future<void> loadAd() async {

    final ad = BannerAd(
      adUnitId: AppConfig.appDataSet?.googleBannerId ?? '',
      request: const AdRequest(),
      size: AdSize.largeBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
          setState(() => isLoading = false);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          setState(() => isLoading = false);
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
    final double adHeight = bannerAd?.size.height.toDouble() ?? 0;
    final double adWidth = bannerAd?.size.width.toDouble() ?? 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      height: isLoading || bannerAd == null ? 0 : adHeight,
      child: ClipRect(
        child: Align(
          alignment: Alignment.topCenter,
          heightFactor: 1.0,
          child: AnimatedOpacity(
            opacity: bannerAd != null && !isLoading ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: bannerAd != null
                ? Center(
                    child: SizedBox(
                      width: adWidth,
                      height: adHeight,
                      child: AdWidget(ad: bannerAd!),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ),
      ),
    ).py(7);
  }
}
