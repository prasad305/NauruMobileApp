import 'package:flutter/material.dart';

class RegistryPage extends StatefulWidget {
  RegistryPage({Key? key}) : super(key: key);

  @override
  _RegistryPageState createState() => _RegistryPageState();
}

class _RegistryPageState extends State<RegistryPage>{
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar",
            style: const TextStyle(
              fontFamily: "Roboto",
              letterSpacing: 1.0,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 192, 0)
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF006de4),
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
                        child: Text("Registrar ",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF006de4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: Text("REGISTRAR - RONALD NAVIN PRAKASH",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      letterSpacing: 1.0,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF006de4),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Image.asset("assets/images/Regstrar.jpg",
                        colorBlendMode: BlendMode.modulate,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  color: Color.fromARGB(205,228,246,255),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: Text("Ronald Navin Prakash is an accomplished legal professional with over a decade of experience primarily in Court Administration. He began his career in 2004 as an Assistant Court Officer and subsequently advanced to become a Legal Officer in the Legal Practitioners Unit, after completing his law degree and being admitted to the bar in 2012.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF006de4),
                            height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: Text("With outstanding professional growth, he rose to the position of Deputy Registrar Legal Northern Division and later Deputy Registrar Legal Western, responsible for administrative work involving all Courts in the Western Division of Fiji. In 2017, he joined the Nauru Judiciary as the Registrar of Courts, where he currently exercises various administrative and judicial functions under the Nauru Court of Appeal Act 2018, Nauru Supreme Court Act 2018, and District Court Act 2018 of Nauru. He has successfully undergone numerous trainings on court administration in Singapore, Australia, Fiji, and other countries. He has also proven his negotiation skills as an accredited mediator by the Singapore Mediation Centre.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF006de4),
                            height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: Text("Prakash’s exceptional leadership qualities, administrative skills, and governance expertise have contributed significantly to the smooth operation of the Nauru Judiciary. Throughout his career, he has demonstrated his ability to lead and inspire teams to achieve exceptional outcomes while maintaining fairness, integrity, and impartiality. Prakash is highly skilled in handling conflict situations, applying relevant laws, and managing court functions efficiently. He is an excellent communicator with a proven track record of securing funding from external donor organizations to support the Nauru Judiciary and staff training overseas.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF006de4),
                            height: 1.3
                          ),
                        ),
                      ),
                      Container(
                        child: Text("His governance expertise is also highly commendable, and he has successfully negotiated a Memorandum of Understanding with the Papua New Guinea Judiciary on Judicial Cooperation and Assistance. Prakash regularly liaises with various stakeholders to ensure smooth Court operations in the Republic of Nauru, including the police, correctional department, Director of Public Prosecutions, Public Legal Defenders Office, and the Department of Justice.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF006de4),
                            height: 1.3
                          ),
                        ),
                      ),
                      Container(
                        child: Text("Ronald Navin Prakash’s exceptional leadership qualities, administrative skills, and governance expertise have earned him widespread recognition in the region and admiration in the legal fraternity.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF006de4),
                            height: 1.3
                          ),
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