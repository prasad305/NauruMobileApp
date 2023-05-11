import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>{
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact",
            style: const TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.0,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 192, 0)
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 1, 32, 96),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              children: [
                Container(
                  //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  color: Color.fromARGB(255, 255, 192, 0),
                  height: 45,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Contact",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:15,),
                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: Text("If you have any questions or concerns about the Nauru Judiciary, please don’t hesitate to contact us. You can reach us by phone, email, or by visiting us in person. We also welcome feedback from court users about their experiences with the judiciary.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: Row(
                          children: [
                            Text("Email: ",
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                letterSpacing: 1.0,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("info@naurujudiciary.gov.nr",
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                letterSpacing: 1.0,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: Row(
                          children: [
                            Text("Telephone: ",
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                letterSpacing: 1.0,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("",
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                letterSpacing: 1.0,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Postal Address: ",
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                letterSpacing: 1.0,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: 220,
                              child: Text("Nauru Courts, Yaren District, Nauru",
                                style: const TextStyle(
                                  fontFamily: "Roboto",
                                  letterSpacing: 1.0,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

}