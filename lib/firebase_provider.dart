import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'notify.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  print("Handling a background message");
  RemoteNotification notification = event.notification!;
  print("message");
  print(event);

  print(notification.body);
  print(notification.title);

  if (notification != null && event.notification?.android != null) {
    print("notification");
    print(notification.body);
    print(notification.title);

    var dataset = event.data["Data"];


  }
}

class NotificationListenerProvider {
  // final _firebaseMessaging = FirebaseMessaging.instance.getInitialMessage();

  void getMessage(BuildContext context) {
    print("dkfjkdfjkdfjdfdfd :::::::::::::::::::::::::::");

    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {

      RemoteNotification notification = event.notification!;
      print(":::::::::::::::::::::::::::: $notification");

      // AppleNotification apple = event.notification!.apple!;
      // AndroidNotification androidNotification = event.notification!.android!;

      if (notification != null && event.notification?.android != null) {
        print("notification");
        print(notification.body);
        print(notification.title);

        var dataset = event.data["Data"];

        // print(json.decode(values.toString())["ss"]);


        ///Show local notification

          sendNotification(title: notification.title!, body: notification.body);


        final type = json.decode(dataset)["Type"];
        print("type");
        print(type);


      }

      if (notification != null && event.notification?.apple != null) {
        AppleNotification appleNotification = event.notification!.apple!;

        print(event.data.values);

        if (notification != null && appleNotification != null) {
          ///Show local notification
          // notification.
          sendNotification(title: notification.title!, body: notification.body);
        }
      }
    });
  }
}
