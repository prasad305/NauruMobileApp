import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

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


  void _ShowDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2050)
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
      /*appBar: AppBar(
        title: Text("Checking App",
          style: TextStyle(
            fontFamily: "Roboto",
            letterSpacing: 1.0,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),*/
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 100.0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 15.0),
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
              Text(
                'Select Name',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: "Roboto",
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.0,), //Spacer
              DropdownList(
                onChanged: (String value) {
                  // 3. read the selected value here and make cool things
                  print(value);
                  SelectedValueHolder = value;
                },
              ), //Dropdown List
              SizedBox(height: 30.0,), //Spacer

              //Second Selection Date Picker
              Text(
                'Select Date',
                style: TextStyle(
                  color: Colors.blueAccent,
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
                    *//*SizedBox(
                      child: IconButton(
                        onPressed: _ShowDatePicker,
                        icon: Icon(Icons.calendar_month_rounded, size: 60.00,),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                          backgroundColor: Colors.blueAccent,
                        ),
                      ),
                    ),*//*
                    *//*Padding(
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
              SizedBox(height: 15.0,),
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
              SizedBox(height: 30.0,), //Spacer



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
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,),),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50), backgroundColor: Colors.blueAccent),
              ),
              SizedBox(height: 10.0,),

              //Clear Button
              ElevatedButton(
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
              ),
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

                    *//*
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
    );
  }

  String error = ""; //String

  //Clear All
  void ClearAll(){
    _textEditingController.clear();
  }

  //API Handler
  void ApiCaller() async{
    String Date = _textEditingController.text.trim();
    if(!(Date.isEmpty) && (SelectedValueHolder != "- Select Person -" && SelectedValueHolder != "")){
      //print(DropdownList);
      print(Date);
      print(SelectedValueHolder);

      const url = "https://randomuser.me/api/?results=10";
      final uri = Uri.parse(url);
      final response = await http.get(uri); //http.post(uri, {'select':SelectedValueHolder,'date':Date}) -> Replace Here
      try{
        if(response.statusCode == 200){ //Check Response is success
          final body = response.body;
          final json = jsonDecode(body);
          setState(() {
            data = json["results"];
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
          //CupertinoAlertDialog();
          //print("Request not Success");
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
              });

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
const List<String> list = <String>['- Select Person -','One', 'Two', 'Three', 'Four']; //DropDown Contain List
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
        border: Border.all(color: Colors.blueAccent, width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 60,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down,size: 20.0, color: Colors.blueAccent,),
          elevation: 16,
          style: const TextStyle(fontSize: 18.0,
            color: Colors.blueAccent,
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

