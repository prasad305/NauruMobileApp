import 'package:flutter/material.dart';

class RegistryServicePage extends StatefulWidget {
  RegistryServicePage({Key? key}) : super(key: key);

  @override
  _RegistryServicePageState createState() => _RegistryServicePageState();
}

class _RegistryServicePageState extends State<RegistryServicePage>{
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Registry Services ",
            style: const TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.0,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 192, 0)
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 23, 147),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  color: Color.fromARGB(255, 255, 192, 0),
                  height: 45,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Registry Services",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 23, 147),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),

                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: Text("The Court Registry offers the following services to the public",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      letterSpacing: 1.0,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 23, 147),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height: 20,),
              const Text("Accepting and Filing Court Documents: ",
              style: TextStyle(
                letterSpacing: 1.0,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 23, 147),
              )),
                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: const Text("The Registry accepts and files court documents for cases being heard in the court. This includes applications, pleadings, affidavits, and any other relevant documents required for a particular case.",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 23, 147),
                            height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height: 20,),
                const Text("File Search for Court Files: ",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 23, 147),
                    )),

                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: const Text("The Registry provides file search services to members of the public who require access to court files. The staff at the Registry can help locate the relevant file and provide copies of documents as required.",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 23, 147),
                              height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                //--
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height: 20,),
                const Text("Attestation of Documents by Commissioner for Oaths: ",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 23, 147),
                    )),

                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: const Text("The Registry provides attestation services for documents that require certification by a Commissioner for Oaths. This includes affidavits, declarations, and other legal documents.",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 23, 147),
                              height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                //--


                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height: 20,),
                const Text("Sealing of Court Orders: ",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 23, 147),
                    )),

                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: const Text("The Registry seals court orders and other court documents as required by law.",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 23, 147),
                              height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),


                //--
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height: 20,),
                const Text("Providing Invoices for Fines Levied by Court Payable at Treasury: ",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 23, 147),
                    )),

                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: const Text("The Registry provides invoices for fines levied by the court, which are payable at the Treasury.",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 23, 147),
                              height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                //--
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height: 20,),
                const Text("Providing Clearance for Police Clearance: ",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 23, 147),
                    )),

                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: const Text("The Registry provides clearance to the public if there are any criminal cases in court for police clearance.",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 23, 147),
                              height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                //--
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height: 20,),
                const Text("Library for Legal Research: ",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 23, 147),
                    )),

                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: const Text("The Registry has a library that is open to the public for legal research. The library has a wide range of legal resources, including statutes, case law, and legal texts.",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 23, 147),
                              height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                //--
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height: 20,),
                const Text("Issuing Probate and Letters of Administration: ",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 23, 147),
                    )),

                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: const Text("The Registry issues probate and letters of administration to the executors or administrators of estates.",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 23, 147),
                              height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                //--
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                SizedBox(height: 20,),
                const Text("Referring Parties for Counseling in Family Matters: ",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 23, 147),
                    )),

                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: const Text("The Registry can refer parties to counseling services in family matters where appropriate.",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 23, 147),
                              height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                const Text("Please note that some of these services may require fees. If you have any questions about these services, please contact the Court Registry for more information.",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      letterSpacing: 1.0,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 23, 147),
                      height: 1.3
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