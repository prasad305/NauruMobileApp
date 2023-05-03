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
        backgroundColor: Color.fromARGB(255, 1, 32, 96),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: (40 / 20),
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
                    left: -8.0,
                    child: Container(
                      height: 188,
                      width: 120,
                      child: Center(
                        child: new AspectRatio(
                          aspectRatio: 250 / 450,
                            child: new Container(
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(16)),
                                image: new DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  colorFilter:
                                  ColorFilter.mode(Colors.black.withOpacity(0.2),
                                      BlendMode.dstATop),
                                  alignment: FractionalOffset.topCenter,
                                  image: AssetImage('assets/images/Pic.jpg'),/*NetworkImage('https://mobios.lk/nauru/wp-content/uploads/2023/03/libra.jpg'),*/
                                )
                              ),
                            ),
                          ),
                      /*Card(
                        child: SizedBox(
                          width: 60,
                          height: 200,
                          child: Image.asset(
                            'assets/images/Libs.jpg',
                            *//*height: 200,
                            width: 120,*//*
                            colorBlendMode: BlendMode.darken,
                            //fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),*/
                      ),
                    ),
                  ),

                  Positioned(
                    top: 80.0,
                    left: -0.0,
                    child: Container(
                      width: 105,
                      child: Center(
                        child: Text(
                          '1', //Position to Add Text
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),

                  const Positioned(
                    top: 10.0,
                    left: 115.0,
                    child: Text(
                      "Mary Jane", //Position to Add Text
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                  const Positioned(
                    top: 35,
                    left: 115,
                    child: Text(
                      "Assitant Professor",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  const Positioned(
                    top: 55,
                    left: 114,
                    child: Text(
                      "Department of Computer Science",
                      style: TextStyle(
                          color: Color.fromARGB(255,0,0,0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  Positioned(
                    bottom: 8,
                    left: 114,
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
                    right: 14,
                    top: 8,
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