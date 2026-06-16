import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class InitializationHelper {
  Future<FormError?> initialize() async {
    final completer = Completer<FormError?>();

    final params = ConsentRequestParameters(tagForUnderAgeOfConsent: false);
    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () async {
        final isFormAvailable = await ConsentInformation.instance.isConsentFormAvailable();

        if (isFormAvailable) {
          final error = await _loadConsentForm();
          completer.complete(error);
        } else {
          await _initialize();
          completer.complete();
        }
      },
      (error) {
        completer.complete(error);
      },
    );

    return completer.future;
  }

  Future<FormError?> _loadConsentForm() async {
    final completer = Completer<FormError?>();

    ConsentForm.loadConsentForm(
      (consentForm) async {
        final status = await ConsentInformation.instance.getConsentStatus();

        if (status == ConsentStatus.required) {
          consentForm.show((formError) async {
            if (formError != null) {
              completer.complete(formError);
            } else {
              final updatedStatus = await ConsentInformation.instance.getConsentStatus();

              if (updatedStatus == ConsentStatus.obtained ||
                  updatedStatus == ConsentStatus.notRequired) {
                await _initialize();
                completer.complete();
              } else {
                final retryError = await _loadConsentForm();
                completer.complete(retryError);
              }
            }
          });
        } else {
          await _initialize();
          completer.complete();
        }
      },
      (formError) {
        completer.complete(formError);
      },
    );

    return completer.future;
  }

  Future<void> _initialize() async {
    MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(
        testDeviceIds: [
          '1349036EC2C027766AF9F02B2EC7B50D',
          '7BF4930313C659FBAAC6DF00F27812F7',
          '5225B41FEA978316BBC519D23A232B84',
          '083B6CE67E2FDC426B7EDD008A7220A8',
        ],
      ),
    );
    await MobileAds.instance.initialize();
  }
}
