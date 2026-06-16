import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SmallNative extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? sPadding;
  final double? radius;

  const SmallNative({super.key, this.padding, this.radius, this.sPadding});

  @override
  State<SmallNative> createState() => _SmallNativeState();
}

class _SmallNativeState extends State<SmallNative> {
  NativeAd? nativeAd;
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
      load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius ?? 0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: isLoading
            ? SmallNativeShimmer()
            : nativeAd != null
            ? SizedBox(
                key: const ValueKey('ad'),
                height: 110,
                width: double.infinity,
                child: AdWidget(ad: nativeAd!),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  void load() {
    final adUnitId = _adUnitIds[index].trim();

    isLoading = true;
    if (mounted) setState(() {});

    NativeAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          nativeAd?.dispose();
          nativeAd = ad as NativeAd;

          isLoading = false;
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();

          if (!mounted) return;

          if (index == 0 && _adUnitIds.length > 1) {
            index++;
            load();
          } else {
            isLoading = false;
            setState(() {});
          }
        },
      ),
      factoryId: 'small_native',
      customOptions: {
        'backgroundColor': "#161B22",
        'textColor': '#E6EDF3',
        'subTextColor': '#8B949E',
        'buttonColor': '#F35383',
        'startColor': '#cd7f32',
      },
    ).load();
  }
}

// ---------------------------------  SCROLL AD -------------------------------------------------

class SmallNativeS extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const SmallNativeS({super.key, this.padding, this.radius});

  @override
  State<SmallNativeS> createState() => _SmallNativeSState();
}

class _SmallNativeSState extends State<SmallNativeS> with SingleTickerProviderStateMixin {
  NativeAd? _nativeAd;
  bool isFetching = false;
  bool isFailed = false;

  int index = 0;

  final List<String> _adUnitIds = [
    AppConfig.appDataSet?.googleNativeId ?? '',
    AppConfig.appDataSet?.adxNativeId ?? '',
  ];

  Future<void> loadAd() async {
    final adUnitId = _adUnitIds[index].trim();

    isFetching = true;

    if (mounted) {
      setState(() {});
    }

    NativeAd(
      adUnitId: adUnitId,
      factoryId: 'small_native',
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
    if (isFailed) {
      return Padding(padding: widget.padding ?? EdgeInsets.zero, child: const SizedBox.shrink());
    }

    if (AppConfig.appDataSet?.googleNativeAdStatus == false) {
      return Padding(padding: widget.padding ?? EdgeInsets.zero, child: const SizedBox.shrink());
    }

    final bool isReady = _nativeAd != null;

    return VisibilityDetector(
      key: Key('sml-native-ad-${identityHashCode(this)}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.05 && _nativeAd == null && !isFetching) {
          if (AppConfig.appDataSet?.googleNativeAdStatus == true) {
            loadAd();
          }
        }
      },
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: SizedBox(
              height: 110,
              width: double.infinity,
              child: isReady
                  ? OverflowBox(
                      minHeight: 110,
                      maxHeight: 110,
                      alignment: Alignment.topCenter,
                      child: AdWidget(ad: _nativeAd!),
                    )
                  : isFetching
                  ? SmallNativeShimmer()
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------- AD LOADER -------------------------------------------------

class SmallNativeShimmer extends StatelessWidget {
  const SmallNativeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const baseColor = AppColor.baseColor;
    const highlightColor = AppColor.highlightColor;

    return SizedBox(
      width: double.infinity,
      height: 110,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  period: const Duration(milliseconds: 1100),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: baseColor,
                        highlightColor: highlightColor,
                        period: const Duration(milliseconds: 1100),
                        child: Container(
                          height: 18,
                          decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Shimmer.fromColors(
                        baseColor: baseColor,
                        highlightColor: highlightColor,
                        period: const Duration(milliseconds: 1100),
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              period: const Duration(milliseconds: 1100),
              child: Container(
                height: 37,
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
