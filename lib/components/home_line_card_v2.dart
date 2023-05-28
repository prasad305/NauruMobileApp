import 'package:flutter/material.dart';

import '../screens/webview.dart';

class HomeCardV2 extends StatelessWidget {
  final String title;
  final bool showImg;
  final String url;
  final String img;

  const HomeCardV2({
    Key? key,
    required this.title,
    required this.url,
    this.showImg = true,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 0))
          ]),
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            // Add what you want to do on tap
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => WebViewPage(url: url)));
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: showImg
                      ? Image.asset(
                          "assets/images/" + img,
                          scale: 10,
                        )
                      : null,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
