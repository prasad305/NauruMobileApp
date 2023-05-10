import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('idList');
    final counter = prefs.getString('notification') ?? "null";

    print("counter");
    print(counter);

    if (counter != "null") {
      // Map m = new ObjectMapper().convertValue(json, Map.class);
      for (var item in jsonDecode(counter)) {
        setState(() {
          notificationList.add(item['caseNo']);
          setState(() {
            body.add(NotificationCard(title: item['caseNo']));
          });

        });
      }
    } else {
      setState(() {
        body.add(Text("Notifications is empty"));
      });

    }
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
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 1, 32, 96),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
        child: Container(
          child: Center(
              child: Column(
            children: body,
          )),
        ),
      ),
    );
  }
}
