import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;

  const NotificationCard(
      {Key? key,
      required this.title,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: Card(
              elevation: 0,
              child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: GestureDetector(
                    onTap: () {
                      // Add what you want to do on tap
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const Authenticate()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.asset(
                            "assets/images/libra.jpg",
                            scale: 20.0,
                          ),
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
                  ))),
        );
  }
}
