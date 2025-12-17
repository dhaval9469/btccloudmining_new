import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

class SmallNative extends StatefulWidget {
  const SmallNative({super.key});

  @override
  State<SmallNative> createState() => _SmallNativeState();
}

class _SmallNativeState extends State<SmallNative> {
  NativeAd? nativeAd;
  bool isLoading = true;
  bool? isDark;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isDark = Theme.of(context).brightness == Brightness.dark;
    load();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isLoading
          ? NativeAdShimmer()
          : nativeAd != null
          ? SizedBox(
              key: const ValueKey('ad'),
              height: 110,
              width: double.infinity,
              child: AdWidget(ad: nativeAd!),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  void load() {
    NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      // adUnitId: AppConfig.appDataSet?.googleNativeId ?? '',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isLoading = false;
          nativeAd = ad as NativeAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          isLoading = false;
          setState(() {});
          ad.dispose();
        },
      ),
      factoryId: 'small_native',
      customOptions: {
        'backgroundColor': "#222834",
        'textColor': '#FFFFFF',
        'subTextColor': '#B3B3B3',
        'buttonColor': '#0061A0',
        'startColor': '#373737',
        // 'startColor': '#2286FE'
      },
    ).load();
  }
}

class NativeAdShimmer extends StatelessWidget {
  const NativeAdShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.black12;
    final highlightColor = Colors.white10;
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xff222834)),
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
                    width: 50,
                    height: 50,
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
                      Container(height: 16, width: 200, color: Colors.grey),
                      const SizedBox(height: 6),
                      Container(height: 20, width: 200, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
