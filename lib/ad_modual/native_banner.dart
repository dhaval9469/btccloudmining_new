import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeBanner extends StatefulWidget {
  final bool slideFromTop;

  const NativeBanner({super.key, this.slideFromTop = false});

  @override
  State<NativeBanner> createState() => _NativeBannerState();
}

class _NativeBannerState extends State<NativeBanner> with SingleTickerProviderStateMixin {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    if (AppConfig.appDataSet?.googleNativeAdStatus == true) {
      loadAd();
    }
  }

  Future<void> loadAd() async {
    _nativeAd = NativeAd(

      adUnitId: AppConfig.appDataSet?.googleNativeId ?? '',
      factoryId: 'native_banner',
      customOptions: {
        'backgroundColor': '#202123',
        'textColor': '#ffffff',
        'subTextColor': '#d3d3d3',
        'buttonColor': '#01325D',
        'startColor': '#0061A0',
      },
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() => _isAdLoaded = true);
          _animationController.forward();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),

    )..load();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAdLoaded) return const SizedBox.shrink();

    final adWidget = SizedBox(
      height: 60,
      child: AdWidget(ad: _nativeAd!),
    );

    return widget.slideFromTop
        ? FadeTransition(
            opacity: _opacityAnimation,
            child: adWidget,
          )
        : SlideTransition(
            position: _slideAnimation,
            child: adWidget,
          );
  }
}
