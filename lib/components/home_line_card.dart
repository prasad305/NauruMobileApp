import 'package:flutter/material.dart';

import '../screens/webview.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final bool showImg;
  final String url;
  final String img;

  const HomeCard({
    Key? key,
    required this.title,
    required this.url,
    this.showImg = true, required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
        child:  Material(
          color: Colors.transparent,
          child:  InkWell(
            onTap: () {
              // Add what you want to do on tap
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebViewPage(url: url)));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: showImg
                              ? Image.asset(
                                  "assets/images/"+img,
                                  scale: 3.5,
                                )
                              : null,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
