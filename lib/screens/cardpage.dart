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
          style: TextStyle(
            fontFamily: "Roboto",
            letterSpacing: 1.0,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 1, 32, 96),
      ),
      body: ShowWidget(),
    );
  }

  ShowWidget(){
    if(Value[0]['type'] == "COURTOFAPPEAL"){
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: (40 / 14.5),
            //crossAxisSpacing: 25.0,
            mainAxisSpacing: 0.0,
            children: Value.map((item)=>Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(5),
              child: Stack(
                children: [
                  //use the positioned widget to place
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13)),
                        //color: Colors.red,
                          image: new DecorationImage(
                            fit: BoxFit.fitWidth,
                            colorFilter:
                            ColorFilter.mode(Colors.black.withOpacity(0.14),
                                BlendMode.dstATop),
                            alignment: FractionalOffset.center,
                            image: AssetImage('assets/images/Pic.jpg'),/*NetworkImage('https://mobios.lk/nauru/wp-content/uploads/2023/03/libra.jpg'),*/
                          )
                      ),
                      //height: 10,
                      padding: const EdgeInsets.all(0),
                      height: 132,
                      width: 125,
                    ),
                  ),

                  Positioned(
                    top: 40.0,
                    left: 0.0,
                    child: Container(
                      width: 125,
                      //color: Colors.red,
                      child: Center(
                        child: Text(
                          'Case No: \n${item['caseNo']}',
                          textAlign: TextAlign.center,//Position to Add Text
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 10.0,
                    left: 130.0,
                    child: Text(
                      "Counsel  :", //Position to Add Text
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    left: 205.0,
                    child: Text(
                      "${item['counsel']}", //Position to Add Text
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  Positioned(
                    top: 35,
                    left: 130,
                    child: Text(
                      "Parties : ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 195,
                    child: Container(
                      //color: Colors.orange,
                      width: 150,
                      height: 60,
                      child: Text(
                        "${item['parties']}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 100,
                    left: 130,
                    child: Text(
                      "Status of Cases : ",
                      style: TextStyle(
                          color: Color.fromARGB(255,0,0,0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 255,
                    child: Text(
                      "${item['statusOfCases']}",
                      style: TextStyle(
                        color: Color.fromARGB(255,0,0,0),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 14,
                    top: 8,
                    child: Center(
                      child: Icon(Icons.menu_book_rounded),
                    ),
                  )

                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 4,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
                //shape: Size.fromHeight(10),
              ),
            )).toList(),
          ),
        ),

      );
    }
    else if (Value[0]['type'] == "DISTRICTCOURT"){
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: (40 / 19),
            //crossAxisSpacing: 25.0,
            mainAxisSpacing: 0.0,
            children: Value.map((item)=>Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(5),
              child: Stack(
                children: [
                  //use the positioned widget to place
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13)),
                        //color: Colors.red,
                          image: new DecorationImage(
                            fit: BoxFit.fitWidth,
                            colorFilter:
                            ColorFilter.mode(Colors.black.withOpacity(0.14),
                                BlendMode.dstATop),
                            alignment: FractionalOffset.center,
                            image: AssetImage('assets/images/Pic.jpg'),/*NetworkImage('https://mobios.lk/nauru/wp-content/uploads/2023/03/libra.jpg'),*/
                          )
                      ),
                      padding: const EdgeInsets.all(0),
                      height: 176,
                      width: 110,
                    ),
                  ),

                  Positioned(
                    top: 60.0,
                    left: 0.0,
                    child: Container(
                      //color: Colors.orange,
                      width: 105,
                      child: Center(
                        child: Text(
                          'Case No: \n${item['caseNo']}',
                          textAlign: TextAlign.center,//Position to Add Text
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 15.0,
                    left: 115.0,
                    child: Text(
                      "Case Titele :", //Position to Add Text
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 15.0,
                    left: 210.0,
                    child: Container(
                      width: 140,
                      height: 80,
                      //color: Colors.red,
                      child: Text(
                        "${item['parties']}", //Position to Add Text
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 95,
                    left: 115,
                    child: Text(
                      "Counsels :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 95,
                    left: 195,
                    child: Container(
                      width: 175,
                      height: 40,
                      //color: Colors.orange,
                      child: Text(
                        "${item['counsel']}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 135,
                    left: 114,
                    child: Text(
                      "Case Status : ",
                      style: TextStyle(
                          color: Color.fromARGB(255,0,0,0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 135,
                    left: 215,
                    child: Text(
                      "${item['statusOfCases']}",
                      style: TextStyle(
                          color: Color.fromARGB(255,0,0,0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  Positioned(
                    right: 14,
                    top: 8,
                    child: Center(
                      child: Icon(Icons.menu_book_rounded),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 4,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
                //shape: Size.fromHeight(10),
              ),
            )).toList(),
          ),
        ),

      );
    }
    else if (Value[0]['type'] == "SUPREMECOURT"){
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: (40 / 24),
            //crossAxisSpacing: 25.0,
            mainAxisSpacing: 0.0,
            children: Value.map((item)=>Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(5),
              child: Stack(
                children: [
                  //use the positioned widget to place
                  Positioned(
                    top: 0.0,
                    left: -0.0,
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13)),
                          image: new DecorationImage(
                            fit: BoxFit.fitWidth,
                            colorFilter:
                            ColorFilter.mode(Colors.black.withOpacity(0.14),
                                BlendMode.dstATop),
                            alignment: FractionalOffset.center,
                            image: AssetImage('assets/images/Pic.jpg'),/*NetworkImage('https://mobios.lk/nauru/wp-content/uploads/2023/03/libra.jpg'),*/
                          )
                      ),
                      height: 225,
                      width: 130,
                    ),
                  ),

                  Positioned(
                    top: 85.0,
                    left: -0.0,
                    child: Container(
                      //color: Colors.deepOrange,
                      width: 130,
                      child: Center(
                        child: Text(
                          'Case No: \n${item['caseNo']}',
                          textAlign: TextAlign.center,//Position to Add Text
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 10.0,
                    left: 135.0,
                    child: Text(
                      "Parties :", //Position to Add Text
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    left: 200.0,
                    child: Container(
                      //color: Colors.orange,
                      height: 60,
                      width: 142,
                      child: Text(
                        "${item['parties']}", //Position to Add Text
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 75,
                    left: 135,
                    child: Text(
                      "Pleaders :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 210,
                    child: Container(
                      //color: Colors.orange,
                      width: 165,
                      height: 40,
                      child: Text(
                        "${item['pleaders']}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 115,
                    left: 135,
                    child: Text(
                      "Status of Case :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 115,
                    left: 255,
                    child: Container(
                      //color: Colors.orange,
                      width: 120,
                      height: 40,
                      child: Text(
                        "${item['statusOfCase']}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 155,
                    left: 135,
                    child: Text(
                      "Status of Def :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 155,
                    left: 245,
                    child: Container(
                      height: 20,
                      width: 125,
                      //color: Colors.orange,
                      child: Text(
                        "${item['statusOfDef']}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 180,
                    left: 135,
                    child: Text(
                      "Judge Assigned :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 265,
                    child: Container(
                      //color: Colors.orange,
                      height: 40,
                      width: 110,
                      child: Text(
                        "${item['judgeAssigned']}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  Positioned(
                    right: 14,
                    top: 8,
                    child: Center(
                      child: Icon(Icons.menu_book_rounded),
                    ),
                  )

                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 4,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
                //shape: Size.fromHeight(10),
              ),
            )).toList(),

          ),
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