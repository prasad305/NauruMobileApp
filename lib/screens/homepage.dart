import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:nauru_mobile_app/screens/search.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cardpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  TextEditingController _textEditingController = TextEditingController(); //Text of TextField
  List<dynamic> data = []; //ApiPass Body Data Holder
  String SelectedValueHolder = ""; //Dropdown Button Selected Value Holder



   openUrl(url,path) async {
    // final uri = Uri.parse(url);

    final Uri toLaunch =
    Uri(scheme: 'https', host:url, path: path);

    _launchInBrowser(toLaunch);

  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void _ShowDatePicker(){
    showDatePicker(
        //Color.fromARGB(255, 246, 197, 0)
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2050),
        builder: (context, child)=> (
          Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color.fromARGB(255, 1, 32, 96),
                onPrimary: Color.fromARGB(255, 255, 255, 255),
                onSurface: Color.fromARGB(255, 1, 32, 96),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 1, 32, 96), // button text color
                ),
              ),
            ),
            child: child!,
          )
        )
    ).then((value){
      setState(() {
        _textEditingController.text = DateFormat('yyyy-MM-dd').format(value!);
      });
    });
  }

  @override
  Widget build(BuildContext context){
    //TextEditingController _textEditingController = TextEditingController(); //Text of TextField
    return Scaffold(
      appBar: AppBar(
        title: Text("Checking App",
          style: TextStyle(
            fontFamily: "Roboto",
            letterSpacing: 1.0,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 1, 32, 96),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 4,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //First Selection
                  const Text(
                    'Select Name',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 32, 96),
                      fontFamily: "Roboto",
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0,), //Spacer
                  DropdownList(
                    onChanged: (String value) {
                      // 3. read the selected value here and make cool things
                      print(value);
                      SelectedValueHolder = value;
                    },
                  ), //Dropdown List
                  SizedBox(height: 18.0,), //Spacer

                  //Second Selection Date Picker
                  Text(
                    'Select Date',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 32, 96),
                      fontFamily: "Roboto",
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
                    child:
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 1, 32, 96),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),

                            controller: _textEditingController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: _textEditingController.clear,
                                icon: Icon(Icons.clear, color: Color.fromARGB(255, 1, 32, 96),),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 1, 32, 96)),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft: Radius.circular(6)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft: Radius.circular(6)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 1, 32, 96), width: 2.0),
                              ),
                              hintText: 'Selected Date',
                              //enabled: false,
                            ),
                            readOnly: true,
                          ),
                        ),
                        Container(
                          height: 62 ,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 1, 32, 96),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(6),bottomRight: Radius.circular(6))
                          ),
                          child: IconButton(icon: Icon(Icons.calendar_month_rounded, size: 30, color: Colors.white,), onPressed: _ShowDatePicker),

                          /*
                        padding: EdgeInsets.zero,
                          onPressed: _ShowDatePicker,
                          icon: Icon(
                            Icons.calendar_month_rounded,
                            size: 55,
                            color: Colors.blueAccent,
                          ),
                        */
                        )
                      ],
                    ),
                    /*Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SizedBox(
                            width: 280.0,
                            child: TextField(
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.blueAccent,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                              ),
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: _textEditingController.clear,
                                  icon: Icon(Icons.clear),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                                ),
                                hintText: 'Selected Date',
                                //enabled: false,
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: _ShowDatePicker,
                          icon: Icon(
                            Icons.calendar_month_rounded,
                            size: 55,
                            color: Colors.blueAccent,
                          ),
                        ),
                        */
                    /*SizedBox(
                          child: IconButton(
                            onPressed: _ShowDatePicker,
                            icon: Icon(Icons.calendar_month_rounded, size: 60.00,),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(40),
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                        ),*//*
                        */
                    /*Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SizedBox(
                            child: IconButton(
                              onPressed: _ShowDatePicker,
                              icon: Icon(Icons.calendar_month_rounded, size: 60.00,),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                                backgroundColor: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),*//*
                      ],
                    ),*/
                  ),
                  //SizedBox(height: 10.0,),
                  /*ElevatedButton.icon(
                    onPressed: _ShowDatePicker,
                    icon: Icon(Icons.calendar_month_rounded),
                    label: Text(
                      'Choose a Date',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,),),
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50), backgroundColor: Colors.blueAccent),
                  ),*/
                  SizedBox(height: 15.0,), //Spacer

                  //Submit Button
                  ElevatedButton(
                    onPressed: (){
                      ApiCaller();
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 20.0,
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,),),
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50), backgroundColor: Color.fromARGB(255, 1, 32, 96)),
                  ),
                  //SizedBox(height: 10.0,),

                  //Clear Button
                  /*ElevatedButton(
                    onPressed: (){
                      ClearAll();
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,),),
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50), backgroundColor: Colors.redAccent),
                  ),*/
                  /*Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.blueAccent,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: _textEditingController.clear,
                              icon: Icon(Icons.clear),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft: Radius.circular(6)),
                              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                            ),
                            hintText: 'Selected Date',
                            //enabled: false,
                          ),
                          readOnly: true,
                        ),
                      ),
                      Container(
                        height: 62 ,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(6),bottomRight: Radius.circular(6))
                        ),
                        child: IconButton(icon: Icon(Icons.calendar_month_rounded, size: 30, color: Colors.white,), onPressed: _ShowDatePicker),

                        */
                  /*
                        padding: EdgeInsets.zero,
                          onPressed: _ShowDatePicker,
                          icon: Icon(
                            Icons.calendar_month_rounded,
                            size: 55,
                            color: Colors.blueAccent,
                          ),
                        *//*
                      )
                    ],
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
            const SizedBox(
            height: 130.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 1, 32, 96),
                ),
                child: Text(
                  'Nauru App',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: "Roboto",
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
              ListTile(
                title: const Text(
                  'About',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 32, 96),
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                 openUrl('naurujudiciary.gov.nr','about/');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'The Courts',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 32, 96),
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  openUrl('naurujudiciary.gov.nr','district-court/');
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Registry',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 32, 96),
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  openUrl('naurujudiciary.gov.nr','registrar/');
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ), ListTile(
                title: const Text(
                  'Going To Court',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 32, 96),
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  openUrl('naurujudiciary.gov.nr','going-to-court/court-room-etiquette/');
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),ListTile(
                title: const Text(
                  'Publications',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 32, 96),
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  openUrl('naurujudiciary.gov.nr','annual-reports/');
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),ListTile(
                title: const Text(
                  'Contact us',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 32, 96),
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  openUrl('naurujudiciary.gov.nr','contact/');
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              // const AboutListTile(
              //   // icon: Icon(
              //   //   Icons.info,
              //   //   color: Color.fromARGB(255, 1, 32, 96),
              //   // ),
              //   child: Text(
              //     'About App',
              //     style: TextStyle(
              //       color: Color.fromARGB(255, 1, 32, 96),
              //       fontFamily: "Roboto",
              //       fontSize: 18.0,
              //       letterSpacing: 1.0,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   applicationIcon: Icon(
              //     Icons.local_play,
              //   ),
              //   applicationName: 'Nauru Court App',
              //   applicationVersion: '1.0.25',
              //   applicationLegalese: '© 2023 Company',
              // )
            ],
          ),
        ),
      ),
    );
  }

  String error = ""; //String

  //Clear All
  /*void ClearAll(){
    _textEditingController.clear();
  }*/

  //API Handler
  void ApiCaller() async{
    String Date = _textEditingController.text.trim();
    if(!(Date.isEmpty) && (SelectedValueHolder != "- Select Court -" && SelectedValueHolder != "")){
      //print(DropdownList);

      const url = "https://api.textware.lk/nauru/v1/api/search";
      final uri = Uri.parse(url);

      try{
        if(SelectedValueHolder == "Supreme Court"){
          final response = await http.post(
            uri,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'type': "SUPREMECOURT",
              'date':Date
            }),
          );
          //http.post(uri, {"dateFrom":Date,"idList":SelectedValueHolder})
          if(response.statusCode == 200){ //Check Response is success
            final body = response.body;
            final json = jsonDecode(body);
            setState(() {
              data = json["upcomingCaseList"];
              print(data);
            });
            if(data.length != 0){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardPage(Data : data),
                ),
              );
              print("Move to the list page!");
            }
          }
          else{
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Request not Success'),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                }
            );

          }
        }
        else if(SelectedValueHolder == "District Court"){
          final response = await http.post(
            uri,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'type': "DISTRICTCOURT",
              'date': Date
            }),
          );
          //http.post(uri, {"dateFrom":Date,"idList":SelectedValueHolder})
          if(response.statusCode == 200){ //Check Response is success
            final body = response.body;
            final json = jsonDecode(body);
            setState(() {
              data = json["upcomingCaseList"];
              print(data);
            });
            if(data.length != 0){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardPage(Data : data),
                ),
              );
              print("Move to the list page!");
            }
          }
          else{
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Request not Success'),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                }
            );

          }
        }
        else if(SelectedValueHolder == "Court of Appeal"){
          final response = await http.post(
            uri,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'type': "COURTOFAPPEAL",
              'date':Date,
            }),
          );
          //http.post(uri, {"dateFrom":Date,"idList":SelectedValueHolder})
          if(response.statusCode == 200){ //Check Response is success
            final body = response.body;
            final json = jsonDecode(body);
            setState(() {
              data = json["upcomingCaseList"];
              print(data);
            });
            if(data.length != 0){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardPage(Data : data),
                ),
              );
              print("Move to the list page!");
            }
          }
          else{
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Request not Success'),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                }
            );

          }
        }

      }
      catch(e){
        error = e.toString();
        print("Error : " + error);

        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(error),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            }
        );

      }
    }
    else{
      //print("Not Selected!");
      showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Warning'),
              content: const Text('Not Selected!'),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

              ],
            );
          }
      );

    }
  }
}

//DropDown List
const List<String> list = <String>['- Select Court -','Supreme Court', 'District Court', 'Court of Appeal']; //DropDown Contain List
class DropdownList extends StatefulWidget {
  //1. required this.onChanged,
  final Function onChanged;
  const DropdownList({Key? key, required this.onChanged,}): super(key: key);

  @override
  State<DropdownList> createState() => _DropdownButtonExampleState();
}
//List Creater
class _DropdownButtonExampleState extends State<DropdownList> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 1, 32, 96), width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 60,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down,size: 24.0, color: Color.fromARGB(255, 1, 32, 96),),
          elevation: 16,
          style: const TextStyle(fontSize: 18.0,
            color: Color.fromARGB(255, 1, 32, 96),
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
          ),
          isExpanded: true,
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
            // 2. Call, callback passing the selected value
            widget.onChanged(value);
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

