import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

class BigNative extends StatefulWidget {
  const BigNative({super.key});

  @override
  State<BigNative> createState() => _BigNativeState();
}

class _BigNativeState extends State<BigNative> {
  NativeAd? nativeAd;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isLoading
          ? NativeBigShimmer()
          : nativeAd != null
          ? ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 450, minHeight: 277, maxHeight: 277, maxWidth: 450),
              key: const ValueKey('bigAad'),
              child: Center(child: AdWidget(ad: nativeAd!)),
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
      factoryId: 'big_native',
      customOptions: {
        'backgroundColor': "#222834",
        'textColor': '#FFFFFF',
        'subTextColor': '#B3B3B3',
        'buttonColor': '#0061A0',
        'startColor': '#4B4CED',
        // 'startColor': '#2286FE'
      },
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isLoading = false;
          nativeAd = ad as NativeAd?;
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          isLoading = false;
          ad.dispose();
          setState(() {});
        },
      ),
    ).load();
  }
}

class NativeBigShimmer extends StatelessWidget {
  const NativeBigShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.black12;
    final highlightColor = Colors.white10;
    return Container(
      height: 277,
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xff222834)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              ),
            ),
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
                height: 33,
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
