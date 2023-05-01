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
        title: Text("Cards",
          style: TextStyle(
            fontFamily: "Roboto",
            letterSpacing: 1.0,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: (40 / 20),
            //crossAxisSpacing: 25.0,
            mainAxisSpacing: 0.0,
            children: Value.map((item)=>Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              child: Stack(
                children: [
                  //use the positioned widget to place
                  const Positioned(
                    top: 0.0,
                    left: 4.0,
                    child: Text(
                      "Mary Jane", //Position to Add Text
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                  const Positioned(
                    top: 25,
                    left: 4,
                    child: Text(
                      "Assitant Professor",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  const Positioned(
                    top: 50,
                    left: 4,
                    child: Text(
                      "Department of Computer Science",
                      style: TextStyle(
                          color: Color.fromARGB(255,0,0,0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 8,
                    child: SizedBox(
                      width: 300,
                      child:
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.phone),
                                    Text(
                                      "+91 9048904851",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.email),
                                    Text(item['email'],
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                    ),
                  ),

                  const Positioned(
                    right: 10,
                    top: 4,
                    child: Center(
                      child: Icon(Icons.person_pin),
                    ),
                  )
                ],
              ),

              /*child: Text(item['gender'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  letterSpacing: 1.0,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),*/
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
                //shape: Size.fromHeight(10),
              ),
            )).toList(),

            /*List.generate(Value.length, (index) {
              return Center(
                child:Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.green[600],
                  child: Text(Value[index]['gender']),
                ),
              );
            }),*/
          ),
        ),

      ),
    );
  }
}