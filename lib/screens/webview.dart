import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import '../components/circle_loader.dart';
import '../components/home_line_card.dart';
import '../components/rounded_clickable_icon.dart';
import 'cardpage.dart';
import 'notifications.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  List<dynamic> data = []; //ApiPass Body Data Holder
  String SelectedValueHolder = ""; //Dropdown Button Selected Value Holder

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late WebViewXController webviewController;
  late Timer t;
  @override
  void initState() {
    super.initState();
    Timer.run(() {
      CircleLoader.showCustomDialog(context);
    });
    t = Timer(const Duration(seconds: 3), () {
      Timer.run(() {
        CircleLoader.hideLoader(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: const [
            SizedBox(
              width: 1,
            ),
            Text(
              "Nauru Judiciary",
              style: TextStyle(
                fontFamily: "Roboto",
                letterSpacing: 1.0,
                fontSize: 20.0,
                color: Color(0xfffeb703),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF006de4),
      ),
      body: WebViewX(
        onWebViewCreated: (controller) async {
          controller.loadContent(widget.url);
          return controller = controller;
        },
        width: MediaQuery.of(context).size.width / 100 * 100,
        height: MediaQuery.of(context).size.height / 100 * 80,
      ),
    );
  }
}
