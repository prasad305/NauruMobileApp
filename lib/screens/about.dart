import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("About",
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

            /*mainAxisSize: MainAxisSize.max,*/
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
                      child: Text("Mission and Values",
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
              SizedBox(height:20,),
              Container(
                height: 15,
                width: double.infinity,
                margin: EdgeInsets.only(left:8,right: 8),
                color: Color.fromARGB(255, 255, 213, 0),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Text("OUR ROLE",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      color: Color.fromARGB(205,228,246,255),
                      child: Text("The role of the Judiciary is to uphold the “rule of law” by resolving disputes between the Legislature, the Executive and the citizens of the Republic.",
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
                height: 15,
                width: double.infinity,
                margin: EdgeInsets.only(left:8,right: 8),
                color: Color.fromARGB(255, 255, 213, 0),
              ),
              SizedBox(height:15,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Text("OUR MISSION",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      color: Color.fromARGB(205,228,246,255),
                      child: Text("Delivery of Justice for one and all along and imparting prudent work environment with commitment, efficiency, punctuality, which is easily accessible to the Nauruan citizens and stakeholders.",
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
                height: 15,
                width: double.infinity,
                margin: EdgeInsets.only(left:8,right: 8),
                color: Color.fromARGB(255, 255, 213, 0),
              ),
              SizedBox(height:15,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Text("RULES OF LAWS",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      color: Color.fromARGB(205,228,246,255),
                      child: Text("We abide by law and we believe in justice, which is not only done but seen to be done.",
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
              SizedBox(height: 10,),
              Container(
                height: 15,
                width: double.infinity,
                margin: EdgeInsets.only(left:8,right: 8),
                color: Color.fromARGB(255, 255, 213, 0),
              ),
              SizedBox(height:15,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Text("PROFESSIONAL WORK ETHICS",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      color: Color.fromARGB(205,228,246,255),
                      child: Text("We bring professionalism in work place and follow high ethical standard.",
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
              SizedBox(height: 10,),
              Container(
                height: 15,
                width: double.infinity,
                margin: EdgeInsets.only(left:8,right: 8),
                color: Color.fromARGB(255, 255, 213, 0),
              ),
              SizedBox(height:15,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Text("INNOVATIVE & PRACTICAL",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      color: Color.fromARGB(205,228,246,255),
                      child: Text("We are trendsetter and lead by example by adopting innovative and practical tools in our delivery system.",
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
              SizedBox(height: 10,),
              Container(
                height: 15,
                width: double.infinity,
                margin: EdgeInsets.only(left:8,right: 8),
                color: Color.fromARGB(255, 255, 213, 0),
              ),
              SizedBox(height:15,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Text("LEADERSHIP & SERVICE",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      color: Color.fromARGB(205,228,246,255),
                      child: Text("We lead by understanding and meeting the needs of those to whom we provide service.",
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
              SizedBox(height: 10,),
              Container(
                height: 15,
                width: double.infinity,
                margin: EdgeInsets.only(left:8,right: 8),
                color: Color.fromARGB(255, 255, 213, 0),
              ),
              SizedBox(height:15,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Text("PUBLIC CONFIDENCE & TRUST",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      color: Color.fromARGB(205,228,246,255),
                      child: Text("We value the trust place in us by the Public and at all times act in a manner that will maintain their confidence.",
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
              SizedBox(height: 20,),
            ],
          ),
        ),

      )
    );
  }

}