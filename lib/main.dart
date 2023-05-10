import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

//import 'package:nauru_mobile_app/screens/homepage.dart';
import 'components/bottom_navbar.dart';

const fetchBackground = "fetchBackground";

void main() {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    // The top level function, aka callbackDispatcher
    callbackDispatcher,
  );
  // Periodic task registration
  Workmanager().registerPeriodicTask(
    "1",
    fetchBackground,
    frequency: const Duration(minutes: 59),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
  runApp(const MyApp());
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day,6,0,0);
    // DateTime midnight = new DateTime(now.year, now.month, now.day,1,0,0);

    if (now.hour == 11) {
      List<dynamic> notificationList = [];
      List<int> caseIdList = [];
      final prefs = await SharedPreferences.getInstance();
      final counter = prefs.getString('idList') ?? "null";

      if (counter != "null") {
        for (var item in jsonDecode(counter)) {
          caseIdList.add(item['id'] as int);
        }
      }

      final response = await http.post(
        Uri.parse("https://api.textware.lk/nauru/v1/api/case/check"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'dateFrom': now.toString().split(" ")[0],
          'date': caseIdList.toString()
        }),
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['upcomingCaseList'] != 0) {
          for (var item in json['upcomingCaseList']) {
            notificationList.add(jsonEncode(item));
          }
          prefs.setString("notification", notificationList.toString());
          // initialise the plugin of flutterlocalnotifications.
          FlutterLocalNotificationsPlugin flip =
              new FlutterLocalNotificationsPlugin();

          // app_icon needs to be a added as a drawable
          // resource to the Android head project.
          var android =
              new AndroidInitializationSettings('@mipmap/ic_launcher');
          // var IOS = new IOSInitializationSettings();

          // initialise settings for both Android and iOS device.
          var settings = new InitializationSettings(android: android);
          flip.initialize(settings);
          _showNotificationWithDefaultSound(flip);
        }
      }
    }

    return Future.value(true);
  });
}

Future _showNotificationWithDefaultSound(flip) async {
  // Show a notification after every 15 minute with the first
  // appearance happening a minute after invoking the method
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id', 'your channel name',
      importance: Importance.max, priority: Priority.high);
  // var iOSPlatformChannelSpecifics =  IOSNotificationDetails();

  // initialise channel platform for both Android and iOS device.
  var platformChannelSpecifics =
      new NotificationDetails(android: androidPlatformChannelSpecifics);
  await flip.show(
      0, 'Nauru Court', 'Today Case Alert', platformChannelSpecifics,
      payload: 'Default_Sound');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomTabBar(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
