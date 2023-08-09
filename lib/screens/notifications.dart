import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:nauru_mobile_app/service/api.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/noificaion_card.dart';
import '../data/state_servies.dart';

class Notifiation extends StatefulWidget {
  //CardPage({required this.Data});
  Notifiation({
    Key? key,
  }) : super(key: key);

  @override
  _NotifiationState createState() => _NotifiationState();
}

class _NotifiationState extends State<Notifiation> {
  List<String> notificationList = []; //Select Item Holder

  late List<Widget> body = [];

  @override
  initState() {
    super.initState();
    loadUserData();
  }

  loadUserData() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;

    Map data = {
      "deviceId": deviceId,
      "date": DateTime.now().toString().split(" ")[0],
    };
    APIManager()
        .postRequest(
            "https://api.textware.lk/nauru/v1/api/my/notification", data)
        .then((value) {
      if (value['notificationLogList'].length != 0) {
        for (var item in value['notificationLogList']) {
          List<dynamic> data = [];
          data.add(item["caseId"]);
          setState(() {
            setState(() {
              body.add(
                  NotificationCard(title: item['title'], body: item['body'],data: data));
            });
          });
        }
      } else {
        setState(() {
          // body.add(const Text("empty"));
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "Notification",
          style: TextStyle(
            fontFamily: "Roboto",
            letterSpacing: 1.0,
            fontSize: 18.0,
            color: Color(0xfffeb703),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 23, 147),
      ),
      body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            child: Container(
              child: Center(
                  child: Column(
                children: body,
              )),
            ),
          )),
    );
  }
}
