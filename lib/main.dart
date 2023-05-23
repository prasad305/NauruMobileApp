import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nauru_mobile_app/constant.dart';
import 'package:nauru_mobile_app/service/api.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

//import 'package:nauru_mobile_app/screens/homepage.dart';
import 'components/bottom_navbar.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_channel', 'High Importance Notification',
    description: "This channel is for important notification",
    importance: Importance.max
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
void main() async {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(NauruApp());
}


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

class NauruApp extends StatefulWidget {
  NauruApp({Key? key}) : super(key: key);

  @override
  _NauruAppState createState() => _NauruAppState();
}

class _NauruAppState extends State<NauruApp>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

        var initialzationSettingsAndroid =
            const AndroidInitializationSettings('@mipmap/ic_launcher');
        var initializationSettings =
            InitializationSettings(android: initialzationSettingsAndroid);
        flutterLocalNotificationsPlugin.initialize(initializationSettings);

        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          RemoteNotification? notification = message.notification;
          AndroidNotification? android = message.notification?.android;
          if (notification != null && android != null) {
            flutterLocalNotificationsPlugin.show(
                notification.hashCode,
                notification.title,
                notification.body,
                NotificationDetails(
                  android: AndroidNotificationDetails(
                    channel.id, channel.name,
                    channelDescription: channel.description
                  ),
                ));
          }
        });

        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          RemoteNotification? notification = message.notification;
          AndroidNotification? android = message.notification?.android;
          if (notification != null && android != null) {
            print("app open");
          }
        });

        getToken();
  }

  late String token;
  getToken() async {

    String? deviceId = await PlatformDeviceId.getDeviceId;

    token = (await FirebaseMessaging.instance.getToken())!;
    print(token);


    Map data = {
      "fcm_token": token,
      "unique_id": deviceId,
      "platform": Platform.isAndroid ? "ANDROID":"IOS",
      "created_datetime":"2023-05-23"
    };

    APIManager().postRequest("https://notification.naurujudiciary.gov.nr/fcm/api/v1/registeredDevices/new",data);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomTabBar(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
