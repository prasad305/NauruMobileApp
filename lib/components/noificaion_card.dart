import 'package:flutter/material.dart';

import '../screens/cardpage.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final dynamic data;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.body, this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 0, 23, 147),
      elevation: 0,
      child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: GestureDetector(
            onTap: () {
              // Add what you want to do on tap
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const Authenticate()));

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardPage(Data: data,showAddBtn:false),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/hummer.png",
                    scale: 1.5,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      body,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
