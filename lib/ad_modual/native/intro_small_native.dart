import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class IntoSmallNative extends StatefulWidget {
  const IntoSmallNative({super.key});

  @override
  State<IntoSmallNative> createState() => _SmallNativeState();
}

class _SmallNativeState extends State<IntoSmallNative> with SingleTickerProviderStateMixin {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();

    if (AppConfig.appDataSet?.googleNativeAdStatus == true) {
      loadAd();
    }
  }

  Future<void> loadAd() async {

    _nativeAd = NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      // adUnitId: AppConfig.appDataSet?.googleNativeId ?? '',
      factoryId: 'small_native',
      customOptions: {
        'backgroundColor': "#15212D",
        'textColor': '#C8FFFFFF',
        'subTextColor': '#96FFFFFF',
        'buttonColor': '#b73237',
        'startColor': '#b73237',
      },
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() => _isAdLoaded = true);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAdLoaded) {
      return Container(
        height: 110,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAsset.watchAd, scale: 10),
            const SizedBox(height: 8),
            Text("Loading ad...", style: TextStyle(color: Colors.grey[400], fontSize: 13)),
          ],
        ),
      );
    }

    return SizedBox(height: 110, child: AdWidget(ad: _nativeAd!));
  }
}
