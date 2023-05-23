import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CourtOfAppealPage extends StatefulWidget {
  CourtOfAppealPage({Key? key}) : super(key: key);

  @override
  _CourtOfAppealPageState createState() => _CourtOfAppealPageState();
}

class _CourtOfAppealPageState extends State<CourtOfAppealPage>{
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Court of Appeal",
            style: const TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.0,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF006de4),
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
                        child: Text("Court of Appeal",
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
                            Text("The Nauru Court of Appeal is the final appellate court of the Republic. The appellate court is headed by the President of the Nauru Court of Appeal pursuant to Article 54 (4) of the Constitution of the Republic of Nauru.",
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
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        child: Text("JURISDICTION OF THE COURT",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        color: Color.fromARGB(205,228,246,255),
                        child: Text("The Nauru Court of Appeal has power and jurisdiction to hear and determine all appeals, which lie to the Court by virtue of the Constitution of the Republic of Nauru, the Nauru Court of Appeal Act 2018 or any other written law.",
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
                        child: Text("SESSIONS OF THE COURT",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        color: Color.fromARGB(205,228,246,255),
                        child: Column(
                          children: [
                            Text("A session of the Court of Appeal shall be notified in the Gazette and shall be convened at least once a year. The Court may also sit in the Republic from time to time as the President of the Court of Appeal may deem necessary.",
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                letterSpacing: 1.0,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                              ),
                            ),
                            SizedBox(height: 2,),
                            Text("Legislative provisions were also enacted under the Nauru Court of Appeal (Amendment) Act 2020 to accommodate proceedings through audio-visual link.",
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                letterSpacing: 1.0,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                height: 1.3,
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
                        child: Text("COMPOSITION OF THE COURT",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        color: Color.fromARGB(205,228,246,255),
                        child: Column(
                          children: [
                            Text("A sitting of the Court of Appeal is duly constituted if it consists of not less than 3 Justices of Appeal including the President of the Court of Appeal. The Justices of Appeal are appointed by the President of the Republic of Nauru in consultation with Chief Justice.",
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                letterSpacing: 1.0,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                height: 1.3
                              ),
                            ),
                            Text("The existing panel of Justices in the Nauru Court of Appeal are:",
                              style: const TextStyle(
                                  fontFamily: "Roboto",
                                  letterSpacing: 1.0,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
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
                                        child: Text("Justice Filimone Jitoko, former Chief Justice of Nauru;",
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
                                        child: Text("Justice Prasantha de Silva of Sri Lanka;",
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
                                        child: Text("Sir Albert Rocky Palmer of Solomon Islands;",
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
                                        child: Text("Justice Rangajeeva Wimalasena Australia;",
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
                                      const Text("5. ",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            letterSpacing: 1.0,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3
                                        ),
                                      ),
                                      Container(
                                        width: 320,
                                        child: const Text("Jutice Colin Makail of Papua New Guinea; and",
                                          style: TextStyle(
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
                                      const Text("6. ",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            letterSpacing: 1.0,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3
                                        ),
                                      ),
                                      Container(
                                        width: 320,
                                        child: const Text("Sir John Muria of Tuvalu.",
                                          style: TextStyle(
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
                            )
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