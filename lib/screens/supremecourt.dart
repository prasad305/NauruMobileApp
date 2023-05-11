import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SupremeCourtPage extends StatefulWidget {
  SupremeCourtPage({Key? key}) : super(key: key);

  @override
  _SupremeCourtPageState createState() => _SupremeCourtPageState();
}

class _SupremeCourtPageState extends State<SupremeCourtPage>{
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Supreme Court",
            style: const TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.0,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 1, 32, 96),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(

              /*mainAxisSize: MainAxisSize.max,*/
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
                        child: Text("Supreme Court",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        color: Color.fromARGB(205,228,246,255),
                        child: Column(
                          children: [
                            Text("The Supreme Court is established under Article 48 of the Constitution of the Republic of Nauru. Functioning of Supreme Court of Nauru is governed by Supreme Court Act 2018 (the Act), which came into effect from 15th May 2018.",
                              style: const TextStyle(
                                  fontFamily: "Roboto",
                                  letterSpacing: 1.0,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text("The Supreme Court shall have the jurisdiction conferred on it by the Constitution of the Republic of Nauru, any other written law and inherent jurisdiction. It is a superior Court of record.",
                              style: const TextStyle(
                                  fontFamily: "Roboto",
                                  letterSpacing: 1.0,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text("The Supreme Court of Nauru is presided by the Acting Chief Justice Mohammed Shafiullah Khan.",
                              style: const TextStyle(
                                  fontFamily: "Roboto",
                                  letterSpacing: 1.0,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:10,),
                Container(
                  height: 5,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height:10,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:EdgeInsets.fromLTRB(5, 5, 0, 5),
                        child: Text("There Are Various Divisions Of The Supreme Court And They Are:",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                        color: Color.fromARGB(205,228,246,255),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("Civil;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("2. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("Criminal;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("3. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("Commercial;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("4. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("Family;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("5. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("Probate;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("6. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("Appellate;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("7. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("Constitutional and administrative;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("8. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("Miscellaneous;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("9. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("Such other divisions which the Chief Justice may deem appropriate.",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:10,),
                Container(
                  height: 5,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height:15,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:EdgeInsets.fromLTRB(5, 5, 0, 5),
                        child: Text("The Jurisdiction Of The Supreme Court Includes:",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                        color: Color.fromARGB(205,228,246,255),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 320,
                                  child: Text("the jurisdiction vested in it under the Constitution and any other written law that it had prior to the commencement of this Act;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("2. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 320,
                                  child: Text("the jurisdiction conferred on it by this Act or any other written law;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("3. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 320,
                                  child: Text("original and appellate jurisdiction in civil and criminal matters conferred to it by the Constitution, this Act or any written law;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("4. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 320,
                                  child: Text("the powers and jurisdiction as may from time to time be vested in it under the Constitution, this Act or any other written law;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("5. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 320,
                                  child: Text("admiralty jurisdiction;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("6. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 320,
                                  child: Text("the power and authority to appoint and control guardians of infants and their estates;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("7. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 320,
                                  child: Text("probate jurisdiction;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("8. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 320,
                                  child: Text("the jurisdiction for winding up and bankruptcy related proceedings;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text("9. ",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 320,
                                  child: Text("matrimonial, family and adoption related jurisdiction;",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("10. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("appellate jurisdiction under the Constitution, this Act or any other written law; and",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("11. ",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      letterSpacing: 0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3
                                  ),
                                ),
                                Container(
                                  width: 320,
                                  child: Text("inherent jurisdiction.",
                                    style: const TextStyle(
                                        fontFamily: "Roboto",
                                        letterSpacing: 1.0,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        )
    );
  }

}