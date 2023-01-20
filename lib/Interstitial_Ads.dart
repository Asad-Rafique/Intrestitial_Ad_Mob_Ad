// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:interstitial_ads/main.dart';

class Interstitial_Ads extends StatefulWidget {
  const Interstitial_Ads({super.key});

  @override
  State<Interstitial_Ads> createState() => _Interstitial_AdsState();
}

class _Interstitial_AdsState extends State<Interstitial_Ads> {

InterstitialAd? interstitialAd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Spacer(),
          ElevatedButton(
              onPressed: () {
                InterstitialAd.load(
                  adUnitId:"ca-app-pub-3940256099942544/1033173712",
                  request: const AdRequest(),
                  adLoadCallback: InterstitialAdLoadCallback(
                    onAdLoaded: (ad) {
                      interstitialAd = ad;
                      ad.show();

                      interstitialAd?.fullScreenContentCallback =
                          FullScreenContentCallback(
                              onAdDismissedFullScreenContent: (ad) {
                        interstitialAd?.dispose();
                        ad.dispose();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>  MyApp(),
                          ),
                        );
                      }, onAdFailedToShowFullScreenContent: (ad, err) {
                        ad.dispose();
                        interstitialAd?.dispose();
                      });
                    },
                    onAdFailedToLoad: (err) {
                      interstitialAd?.dispose();
                    },
                  ),
                );
              },
              child: const Text("Show Interestital Ad")),
          
         const Spacer(),
          ],
        )
        ],
      ),
    );
  }
}