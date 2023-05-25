import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  List Data;
  //CardPage({required this.Data});
  CardPage({Key? key,required this.Data}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState(Data);
}

class _CardPageState extends State<CardPage>{
  List Value;
  _CardPageState(this.Value);

  int i = 0;//List Records Counter

  Widget build(BuildContext context){
    print(Value[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(PageHeading(),
          style: const TextStyle(
            fontFamily: "Roboto",
            letterSpacing: 1.0,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 23, 147),
      ),
      body: ShowWidget(),
    );
  }

  ShowWidget(){
    if(Value[0]['type'] == "COURTOFAPPEAL"){
      return SingleChildScrollView(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisExtent: 190,
          ),
          itemCount: Value.length,
          itemBuilder: (_, index) {
            return Container(
              height: 100,
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 4,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              bottomLeft: Radius.circular(12.0),
                            ),
                            child: Image.asset("assets/images/Pic.png",
                              color: Colors.white.withOpacity(0.75),
                              colorBlendMode: BlendMode.modulate,
                              /*height: 120,
                      width: double.infinity,*/
                              //color: Colors.black.withOpacity(0.14),
                              height: double.infinity,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                              child: Container(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Case No : ",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${Value.elementAt(index)['caseNo']}",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Parties : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['parties'].replaceAll("\n", " v ")}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Counsel : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                  width: 230,
                                //color: Colors.red,
                                child: Text(
                                  "${Value.elementAt(index)['counsel']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status of Cases : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['caseStatus']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
    else if (Value[0]['type'] == "DISTRICTCOURT"){
      return SingleChildScrollView(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisExtent: 220,
          ),
          itemCount: Value.length,
          itemBuilder: (_, index) {
            return Container(
              height: 100,
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 4,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              bottomLeft: Radius.circular(12.0),
                            ),
                            child: Image.asset("assets/images/Pic.png",
                              color: Colors.white.withOpacity(0.2),
                              colorBlendMode: BlendMode.modulate,
                              /*height: 120,
                      width: double.infinity,*/
                              //color: Colors.black.withOpacity(0.14),
                              height: double.infinity,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                              child: Container(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Case No : ",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${Value.elementAt(index)['caseNo']}",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Case Title : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['parties']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Counsel : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['counsel']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Case Status : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['caseStatus']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
    else if (Value[0]['type'] == "SUPREMECOURT"){
      return SingleChildScrollView(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisExtent: 280,
          ),
          itemCount: Value.length,
          itemBuilder: (_, index) {
            return Container(
              height: 100,
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 4,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              bottomLeft: Radius.circular(12.0),
                            ),
                            child: Image.asset("assets/images/Pic.png",
                              color: Colors.white.withOpacity(0.13),
                              colorBlendMode: BlendMode.modulate,
                              /*height: 120,
                      width: double.infinity,*/
                              //color: Colors.black.withOpacity(0.14),
                              height: double.infinity,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                              child: Container(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Case No : ",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${Value.elementAt(index)['caseNo']}",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Parties : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['parties']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pleaders : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                //color: Colors.red,
                                child: Text(
                                  "${Value.elementAt(index)['pleaders']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status of Cases : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['statusOfCases']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status of Def : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['statusOfDef']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Judge Assigned : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['judgeAssigned']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }

  PageHeading(){
    if (Value[0]['type'] == "COURTOFAPPEAL"){
      return "Court of Appeal";
    }
    else if (Value[0]['type'] == "DISTRICTCOURT"){
      return "District Court";
    }
    else if (Value[0]['type'] == "SUPREMECOURT"){
      return "Supreme Court";
    }
  }
}