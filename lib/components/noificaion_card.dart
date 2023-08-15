import 'package:flutter/material.dart';

import '../screens/cardpage.dart';
import '../service/api.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final int id;
  final dynamic data;
  final Function reloadAll;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.body, this.data, required this.id, required this.reloadAll,
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
                const Spacer(),
                IconButton(
                  onPressed: (){
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Delete',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 23, 147),
                                fontFamily: "Roboto",
                                fontSize: 18.0,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: const Text("Do You Want to delete notification?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 23, 147),
                                fontFamily: "Roboto",
                                fontSize: 14.0,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('Delete',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 23, 147),
                                    fontFamily: "Roboto",
                                    fontSize: 14.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                onPressed: () async {

                                  Map data = {
                                    'id':id
                                  };
                                  APIManager().postRequest("https://api.textware.lk/nauru/v1/api/notify/delete", data).then((value) =>
                                  {
                                    reloadAll()
                                  }
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('Cancel',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 23, 147),
                                    fontFamily: "Roboto",
                                    fontSize: 14.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        }
                    );
                  },
                  icon: Image.asset("assets/images/bin.png",scale: 3.5),
                )
              ],
            ),
          )),
    );
  }
}
