import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PrayerGarden extends StatefulWidget {
  const PrayerGarden({super.key});

  @override
  State<PrayerGarden> createState() => _PrayerGardenState();
}

class _PrayerGardenState extends State<PrayerGarden> {
  final String PrayerGardenUrl =
      'https://thandrisannidhiministries.org/prayer-garden/';
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              onLoadStart: (controller, url) {
                setState(() {
                  isLoading = true;
                });
              },
              onLoadStop: (controller, url) {
                setState(() {
                  isLoading = false;
                });
              },
              initialUrlRequest: URLRequest(url: Uri.parse(PrayerGardenUrl)),
            ),
            Visibility(
              visible: isLoading,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Color.fromARGB(255, 54, 1, 63),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
