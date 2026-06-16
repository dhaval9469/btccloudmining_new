import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

class NativeBanner extends StatefulWidget {
  final double? radius;
  final bool isBGTransparent;

  const NativeBanner({super.key, this.isBGTransparent = true, this.radius});

  @override
  State<NativeBanner> createState() => _NativeBannerState();
}

class _NativeBannerState extends State<NativeBanner> {
  NativeAd? _nativeAd;
  bool isLoading = false;

  int index = 0;

  final List<String> _adUnitIds = [
    AppConfig.appDataSet?.googleNativeId ?? '',
    AppConfig.appDataSet?.adxNativeId ?? '',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (AppConfig.appDataSet?.googleNativeAdStatus == true) {
      loadAd();
    }
  }

  Future<void> loadAd() async {
    final adUnitId = _adUnitIds[index].trim();
    isLoading = true;
    if (mounted) setState(() {});

    NativeAd(
      adUnitId: adUnitId,
      factoryId: 'native_banner',
      customOptions: {
        'backgroundColor': "#161B22",
        'textColor': '#E6EDF3',
        'subTextColor': '#8B949E',
        'buttonColor': '#F35383',
        'startColor': '#cd7f32',
      },

      listener: NativeAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          _nativeAd?.dispose();
          _nativeAd = ad as NativeAd;

          isLoading = false;
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          if (!mounted) return;

          if (index == 0 && _adUnitIds.length > 1) {
            index++;
            loadAd();
          } else {
            isLoading = false;
            setState(() {});
          }
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius ?? 0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: isLoading
            ? NativeBannerShimmer()
            : _nativeAd != null
            ? SizedBox(
                key: const ValueKey('nbAd'),
                height: 135,
                width: double.infinity,
                child: AdWidget(ad: _nativeAd!),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class NativeBannerShimmer extends StatelessWidget {
  const NativeBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const baseColor = AppColor.baseColor;
    const highlightColor = AppColor.highlightColor;

    return SizedBox(
      width: double.infinity,
      height: 135,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              period: const Duration(milliseconds: 1100),
              child: Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highlightColor,
                    period: const Duration(milliseconds: 1100),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
                    ),
                  ),

                  const SizedBox(height: 7),

                  Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highlightColor,
                    period: const Duration(milliseconds: 1100),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highlightColor,
                    period: const Duration(milliseconds: 1100),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
