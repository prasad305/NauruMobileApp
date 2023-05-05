import 'package:flutter/material.dart';
//import 'package:nauru_mobile_app/screens/homepage.dart';
import 'components/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
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

