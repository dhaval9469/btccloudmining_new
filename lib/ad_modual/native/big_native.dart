import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BigNative extends StatefulWidget {
  const BigNative({super.key});

  @override
  State<BigNative> createState() => _BigNativeState();
}

class _BigNativeState extends State<BigNative> with SingleTickerProviderStateMixin {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);

    if (AppConfig.appDataSet?.googleNativeAdStatus == true) {
      loadAd();
    }
  }

  Future<void> loadAd() async {
    _nativeAd = NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      // adUnitId: AppConfig.appDataSet?.googleNativeId ?? '',
      factoryId: 'big_native',
      customOptions: {
        'backgroundColor': "#15212D",
        'textColor': '#C8FFFFFF',
        'subTextColor': '#96FFFFFF',
        'buttonColor': '#b73237',
        'startColor': '#b73237',
      },
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
          _fadeController.forward(); // Start fade-in animation
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
    _nativeAd?.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAdLoaded) return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SizedBox(height: 277, child: AdWidget(ad: _nativeAd!)),
    );
  }
}
