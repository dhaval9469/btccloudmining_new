import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer/shimmer.dart';

class NativeBanner extends StatefulWidget {
  final bool isBGTransparent;

  const NativeBanner({super.key, this.isBGTransparent = true});

  @override
  State<NativeBanner> createState() => _NativeBannerState();
}

class _NativeBannerState extends State<NativeBanner> {
  NativeAd? _nativeAd;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAd();
  }

  Future<void> loadAd() async {
    NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      // adUnitId: AppConfig.appDataSet?.googleNativeId ?? '',
      factoryId: 'native_banner',
      customOptions: {
        'backgroundColor': widget.isBGTransparent ? '#242C3B' : "#222834",
        'textColor': '#FFFFFF',
        'subTextColor': '#B3B3B3',
        'buttonColor': '#0061A0',
        'startColor': '#373737',
        // 'startColor': '#2286FE'
      },
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isLoading = false;
          _nativeAd = ad as NativeAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          isLoading = false;
          ad.dispose();
          setState(() {});
        },
      ),
      request: const AdRequest(),
    ).load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isLoading
          ? NativeBannerShimmer(isBGTransparent: widget.isBGTransparent)
          : _nativeAd != null
          ? SizedBox(
              key: const ValueKey('nbAd'),
              height: 65,
              width: double.infinity,
              child: AdWidget(ad: _nativeAd!),
            )
          : const SizedBox.shrink(),
    );
  }
}

class NativeBannerShimmer extends StatelessWidget {
  final bool isBGTransparent;

  const NativeBannerShimmer({super.key, required this.isBGTransparent});

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.black12;
    final highlightColor = Colors.white10;
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(color: isBGTransparent ? Colors.transparent : Color(0xff242C3B)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 48,
                    height: 44,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(width: 10),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 15, width: 180, color: Colors.grey),
                      const SizedBox(height: 6),
                      Container(height: 20, width: 180, color: Colors.grey),
                    ],
                  ),
                ),
                const Spacer(),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 80,
                    height: 26,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
