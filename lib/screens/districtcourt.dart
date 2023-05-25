import 'package:flutter/material.dart';

class DistrictCourtPage extends StatefulWidget {
  DistrictCourtPage({Key? key}) : super(key: key);

  @override
  _DistrictCourtPageState createState() => _DistrictCourtPageState();
}

class _DistrictCourtPageState extends State<DistrictCourtPage>{
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("District Court",
            style: const TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.0,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 23, 147),
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
                        child: Text("District Court",
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
                            Text("The District Court is governed by the District Court Act 2018 and is a court of summary jurisdiction. The District Court is subordinate to the Supreme Court and is presided by the Resident Magistrate Mr. Neil Rupasinghe.",
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
                SizedBox(height:15,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:EdgeInsets.fromLTRB(5, 5, 0, 5),
                        child: Text("The Jurisdiction Of The District Court Includes:",
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
                                  child: Text("Jurisdiction vested in it by the Criminal Procedure Act 1972 and any other written law that it had prior to the commencement of this Act;",
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
                                  child: Text("Civil Jurisdiction under Section 17 of the Act;",
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
                                  child: Text("Jurisdiction conferred on it by this Act or any other written law;",
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
                                  child: Text("Power and Jurisdiction as may from time to time be vested in it under this Act or any other written law;",
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
                                  child: Text("Jurisdiction to divide chattels;",
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
                                  child: Text("Jurisdiction in relation to the recovery of land in limited circumstances provided for under this Act; and",
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
                                  child: Text("Jurisdiction to hear and determine interpleader applications;",
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
                                  child: Text("Family related jurisdiction",
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