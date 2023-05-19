import 'package:flutter/material.dart';
import 'package:nauru_mobile_app/components/stuffcard.dart';

class StaffPage extends StatefulWidget {
  StaffPage({Key? key}) : super(key: key);

  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage>{
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Staff",
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
                        child: Text("Meet The Team",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 1, 32, 96),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Container(
                        child: Text("WE HAVE A HIGHLY SKILLED AND EFFICIENT TEAM OF PROFESSIONALS WHO HAVE UNDERGONE EXTENSIVE CAPACITY BUILDING AND TRAINING TO ENSURE THEY POSSESS THE NECESSARY KNOWLEDGE AND EXPERTISE TO CARRY OUT THEIR ROLES EFFECTIVELY. THEY HAVE A DEEP UNDERSTANDING OF THE LEGAL SYSTEM AND ARE EMPATHETIC TOWARDS THE NEEDS OF THOSE WHO COME BEFORE THE COURT.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 1, 32, 96),
                            height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Text("Their training and development programs have equipped them with the necessary skills to handle a wide range of cases, from civil disputes to criminal matters, with a high level of professionalism and attention to detail. They are knowledgeable in the laws and regulations that apply to Nauru and stay up to date with any changes that may occur.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 1, 32, 96),
                            height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Text("The Nauru court staff’s commitment to their profession is reflected in their dedication to continuing education and professional development. They are continually seeking opportunities to enhance their skills and knowledge, including attending workshops and training sessions, and collaborating with colleagues in the legal profession.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 1, 32, 96),
                            height: 1.3
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Text("Their skills, empathy, efficiency, knowledge and expertise have enabled them to provide high-quality service to those seeking justice, ensuring that the legal system operates efficiently and effectively to serve the community.",
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            letterSpacing: 1.0,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 1, 32, 96),
                            height: 1.3
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: Text("Our Staff",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      letterSpacing: 1.0,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 32, 96),
                    ),
                  ),
                ),

                StuffCard(title: "IRENE WAIDUBU", img: "IRENEWAIDUBU.jpg", desc: "DEPUTY REGISTRAR SUPREME COURT"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "KARA HALSTEAD", img: "KARAHALSTEAD.jpg", desc: "DISTRICT COURT CLERK"),
                SizedBox(
                  height: 20,
                ),

                StuffCard(title: "RACHEL WAIDABU", img: "RACHELWAIDABU.jpg", desc: "COURT OF APPEAL CLERK"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "JEZZA AGADIO", img: "JEZZAAGADIO.jpg", desc: "DISTRICT COURT CLERK"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "JANSEN AGIR", img: "JANSENAGIR.jpg", desc: "CHIEF PROBATION OFFICER"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "MERHONDA TANNANG", img: "MERHONDATANNANG.jpg", desc: "ADMINISTATIVE AND BUDGET OFFICER"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "SARIAH IKA", img: "SARIAHIKA.jpg", desc: "FAMILY COURT CLERK"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "GAZE ADAM", img: "GAZEADAM.jpg", desc: "LIBRARIAN"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "ODEL GOBURE", img: "ODELGOBURE.jpg", desc: "ASSISTANT DISTRICT COURT CLERK"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "ELGINA BAILEY", img: "ELGINABAILEY.jpg", desc: "ASSISTANT DISTRICT COURT CLERK"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "HEAVENLY PORTE", img: "HEAVENLYPORTE.jpg", desc: "ASSISTANT CLERK (OVERSEAS LEAVE)"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "ROSITA ROKOBULI", img: "ROSITAROKOBULI.jpg", desc: "STUDENT INTERN"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "RAMONA SCOTTY", img: "RAMONASCOTTY.jpg", desc: "STUDENT INTERN"),
                SizedBox(
                  height: 20,
                ),
                StuffCard(title: "ROXIMA AGIGO", img: "ROXIMAAGIGO.jpg", desc: "STUDENT INTERN"),

                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 15,
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 213, 0),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: Text("Research Associates",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      letterSpacing: 1.0,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 32, 96),
                    ),
                  ),
                ),

                StuffCard(title: "Akash A Prasad", img: "AkashAPrasad.jpg", desc: "Court of Appeal"),
                SizedBox(
                  height: 20,
                ),

                StuffCard(title: "Vinay Sharma", img: "Vinay.jpg", desc: "Supreme Court"),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        )
    );
  }

}