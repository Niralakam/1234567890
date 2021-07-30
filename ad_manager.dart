import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:native_flutter_admob/native_flutter_admob.dart';

class AdManager {
  static bool isShowAdd = false;
  static int maxAdd = 2;
  static String appId = "ca-app-pub-7514882435759238~6801125185";
  static String bannerAdUnitId = "ca-app-pub-7514882435759238/1623101490";
  static String interstitialAdUnitId = "ca-app-pub-7514882435759238/6569140566";
  static String nativeAdUnitId = "ca-app-pub-7514882435759238/6444074878";
  // static String appId = 'ca-app-pub-3940256099942544/6300978111';
  // static String bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  // static String interstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
  static DateTime previewsDateTime = DateTime.now();

  static AdmobInterstitial interstitialAd;
  static NativeAdmob nativeAdmob;
  static getNativeAdmob(withPadding) {
    if (isShowAdd == true) {
      if (withPadding) {
        return Padding(
          padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLRB,
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: AppTheme.decoration,
            child: Center(
              child: NativeAdmobBannerView(
                adUnitID: nativeAdUnitId,
                style: BannerStyle.dark,
                showMedia: false,
                contentPadding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              ),
            ),
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.all(0),
          decoration: AppTheme.decoration,
          child: Center(
            child: NativeAdmobBannerView(
              adUnitID: nativeAdUnitId,
              style: BannerStyle.dark,
              showMedia: false,
              contentPadding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            ),
          ),
        );
      }
    } else {
      return AppTheme.sizedBoxEmpty;
    }
  }

  static getBanner(withPadding) {
    if (isShowAdd == true) {
      if (withPadding) {
        return Padding(
          padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLR,
          child: Container(
            height: 65,
            padding: EdgeInsets.all(0),
            decoration: AppTheme.decoration,
            child: Center(
              child: AdmobBanner(
                adUnitId: bannerAdUnitId,
                adSize: AdmobBannerSize.FULL_BANNER,
                listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
                onBannerCreated: (AdmobBannerController controller) {},
              ),
            ),
          ),
        );
      } else {
        return Container(
          height: 65,
          padding: EdgeInsets.all(0),
          decoration: AppTheme.decoration,
          child: Center(
            child: AdmobBanner(
              adUnitId: bannerAdUnitId,
              adSize: AdmobBannerSize.FULL_BANNER,
              listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
              onBannerCreated: (AdmobBannerController controller) {},
            ),
          ),
        );
      }
    } else {
      return AppTheme.sizedBoxEmpty;
    }
  }

  static isShowAdsBanner(index) {
    return (index == 0 || index % 2 == 0) ? true : false;
  }

  static getBannerBasedOnIndex(index) {
    if (isShowAdd == true) {
      if (isShowAdsBanner(index)) {
        return getBanner(true);
      } else {
        return AppTheme.sizedBoxEmpty;
      }
    } else {
      return AppTheme.sizedBoxEmpty;
    }
  }

  static loadInterstitialAd() async {
    if (isShowAdd == true) {
      if (nativeAdmob == null) {
        nativeAdmob = NativeAdmob();
        nativeAdmob.initialize(appID: appId);
      }
      if (interstitialAd == null) {
        interstitialAd = AdmobInterstitial(
          adUnitId: interstitialAdUnitId,
          listener: (AdmobAdEvent event, Map<String, dynamic> args) {
            if (event == AdmobAdEvent.closed) {
              interstitialAd.load();
            }
          },
        );
      }
      interstitialAd.load();
      await interstitialAd.isLoaded;
      DateTime currentDatetime = DateTime.now();
      var different = currentDatetime.difference(previewsDateTime).inSeconds;
      if (different >= 25) {
        interstitialAd.show();
        previewsDateTime = DateTime.now();
      }
    }
  }
}
