import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';

/*class BigNative extends StatefulWidget {
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
    if (AppConfig.appDataSet?.googleNativeAdStatus == true) {
      load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isLoading
          ? NativeBigShimmer()
          : nativeAd != null
          ? ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 450,
                minHeight: 277,
                maxHeight: 277,
                maxWidth: 450,
              ),
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
      adUnitId: AppConfig.appDataSet?.googleNativeId ?? '',
      factoryId: 'big_native',
      customOptions: {
        'backgroundColor': "#161B22",
        'textColor': '#E6EDF3',
        'subTextColor': '#8B949E',
        'buttonColor': '#F35383',
        'startColor': '#8B949E',
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
}*/

class BigNative extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const BigNative({super.key, this.padding, this.radius});

  @override
  State<BigNative> createState() => _BigNativeState();
}

class _BigNativeState extends State<BigNative> with SingleTickerProviderStateMixin {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  int index = 0;

  final List<String> _adUnitIds = [
    AppConfig.appDataSet?.googleNativeId ?? '',
    AppConfig.appDataSet?.adxNativeId ?? '',
  ];

  @override
  void initState() {
    super.initState();
    if (AppConfig.appDataSet?.googleNativeAdStatus == true) {
      loadAd();
    }
  }

  Future<void> loadAd() async {
    final adUnitId = _adUnitIds[index].trim();

    _isAdLoaded = true;
    if (mounted) setState(() {});

    NativeAd(
      adUnitId: adUnitId,
      factoryId: 'big_native',
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
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: _isAdLoaded
            ? BigNativeShimmer()
            : _nativeAd != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius ?? 0),
                child: SizedBox(
                  key: const ValueKey('ad'),
                  height: 285,
                  width: double.infinity,
                  child: Center(child: AdWidget(ad: _nativeAd!)),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

// ----------------------------------------- SCROLL AD  ----------------------------------

class BigNativeS extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? sPadding;
  final double? radius;

  const BigNativeS({super.key, this.padding, this.radius, this.sPadding});

  @override
  State<BigNativeS> createState() => _BigNativeSState();
}

class _BigNativeSState extends State<BigNativeS> with SingleTickerProviderStateMixin {
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
      factoryId: 'big_native',
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
      return Padding(padding: widget.sPadding ?? EdgeInsets.zero, child: const SizedBox.shrink());
    }

    if (AppConfig.appDataSet?.googleNativeAdStatus == false) {
      return Padding(padding: widget.padding ?? EdgeInsets.zero, child: const SizedBox.shrink());
    }
    final bool isReady = _nativeAd != null;

    return VisibilityDetector(
      key: Key('big-native-ad-${identityHashCode(this)}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.05 && _nativeAd == null && !isFetching) {
          if (AppConfig.appDataSet?.googleNativeAdStatus == true) {
            loadAd();
          }
        }
      },
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: SizedBox(
            height: 285,
            width: double.infinity,
            child: isReady
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(widget.radius ?? 0),
                    child: OverflowBox(
                      minHeight: 285,
                      maxHeight: 285,
                      alignment: Alignment.center,
                      child: AdWidget(ad: _nativeAd!),
                    ),
                  )
                : isFetching
                ? BigNativeShimmer()
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------- AD LOADER ----------------------------------

class BigNativeShimmer extends StatelessWidget {
  const BigNativeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const baseColor = AppColor.baseColor;
    const highlightColor = AppColor.highlightColor;

    return SizedBox(
      width: double.infinity,
      height: 285,
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
                height: 150,
                decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  period: const Duration(milliseconds: 1100),
                  child: Container(
                    width: 55,
                    height: 55,
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
                          height: 20,
                          decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Shimmer.fromColors(
                        baseColor: baseColor,
                        highlightColor: highlightColor,
                        period: const Duration(milliseconds: 1100),
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
