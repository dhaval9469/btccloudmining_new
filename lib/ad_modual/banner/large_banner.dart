import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LargeBanner extends StatefulWidget {
  const LargeBanner({super.key});

  @override
  State<LargeBanner> createState() => _LargeBannerState();
}

class _LargeBannerState extends State<LargeBanner> {
  BannerAd? bannerAd;
  bool isFetching = false;
  bool isFailed = false;

  int index = 0;

  final List<String> _adUnitIds = [
    AppConfig.appDataSet?.googleBannerId ?? '',
    AppConfig.appDataSet?.adxBannerId ?? '',
  ];

  Future<void> loadAd() async {
    final adUnitId = _adUnitIds[index].trim();

    isFetching = true;

    if (mounted) setState(() {});

    BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.mediumRectangle,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          bannerAd?.dispose();
          bannerAd = ad as BannerAd?;
          isFetching = false;
          isFailed = false;
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();

          if (!mounted) return;

          if (index == 0 && _adUnitIds.length > 1) {
            index++;
            loadAd();
          } else {
            isFetching = false;
            isFailed = true;
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
  @override
  Widget build(BuildContext context) {
    if (isFailed) {
      return const SizedBox.shrink();
    }

    final bool isReady = bannerAd != null;

    return VisibilityDetector(
      key: const Key('large-banner-ad'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.05 &&
            bannerAd == null &&
            !isFetching &&
            AppConfig.appDataSet?.googleLargeBannerAdStatus == true) {
          loadAd();
        }
      },
      child: SizedBox(
        height: AppConfig.appDataSet?.googleLargeBannerAdStatus == true ? 250 : 0,
        width: double.infinity,
        child: Center(
          child: isReady
              ? SizedBox(
                  width: bannerAd!.size.width.toDouble(),
                  height: bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: bannerAd!),
                )
              : isFetching
              ? LargeBannerShimmer()
              : const SizedBox(),
        ),
      ),
    );
  }
}

class LargeBannerShimmer extends StatelessWidget {
  const LargeBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const baseColor = AppColor.baseColor;
    const highlightColor = AppColor.highlightColor;

    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              period: const Duration(milliseconds: 1100),
              child: Container(
                height: 180,
                decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              period: const Duration(milliseconds: 1100),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
