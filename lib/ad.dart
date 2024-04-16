

// import 'package:ainews/import.dart';
// import "package:firebase_admob/firebase_admob.dart";

// class BannerAdWidget extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// return Container(
// alignment: Alignment.center,
// child: AdWidget(
// ad: AdManager.bannerAdUnitId != null
// ? BannerAd(
// adUnitId: AdManager.bannerAdUnitId,
// size: AdSize.banner,
// )
// : SizedBox(), // Handle case when adUnitId is not set.
// ),
// );
// }
// }


// class InterstitialAdWidget {
// late InterstitialAd _interstitialAd;

// void loadInterstitialAd() {
// _interstitialAd = InterstitialAd(
// adUnitId: AdManager.interstitialAdUnitId,
// targetingInfo: MobileAdTargetingInfo(),
// listener: (MobileAdEvent event) {
// if (event == MobileAdEvent.failedToLoad) {
// _interstitialAd..load();
// } else if (event == MobileAdEvent.closed) {
// _interstitialAd..load();
// }
// },
// );
// _interstitialAd..load();
// }

// void showInterstitialAd() {
// if (_interstitialAd != null) {
// _interstitialAd.show();
// }
// }
// }