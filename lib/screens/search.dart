import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:nauru_mobile_app/constant.dart';
import 'package:nauru_mobile_app/service/api.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/state_servies.dart';

class SearchPage extends StatefulWidget {
  //CardPage({required this.Data});
  SearchPage({Key? key,}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<SearchPage>{

  int i = 0;//List Records Counter
  String? userSelected = "";
  List<String> userSelectedData = []; //Select Item Holder

  @override
  initState() {
    super.initState();
    loadUserData();
    loadData();
  }

  List<String> name = [];
  List<dynamic> idList = [];
  List<int> deleteIdList = [];
  List<dynamic> caseList = [];
  List<dynamic> selectedCaseList = [];
  String? deviceId;
  loadUserData() async {

    deviceId  = await PlatformDeviceId.getDeviceId;
    userSelectedData = [];
    deleteIdList = [];

    Map data = {
      'deviceId':deviceId
    };
    print("req");
    print(data);

    APIManager().postRequest("https://api.textware.lk/nauru/v1/api/my/case", data).then((value) {
      print("loaded");
      print(value);

      for (var item in value['userCaseList']) {
        print(item);
        setState(() {
          userSelectedData.add(item['caseId']['caseNo'] as String);
          deleteIdList.add(item['caseId']['id'] as int);
        });
      }


    });


  }
  loadData() async {
    StateService.reloadData(name);
    var now = new DateTime.now().toString();
    Map data = {
      'dateFrom': now.split(" ")[0]
    };
    APIManager().postRequest(Constant.domain+"/nauru/v1/api/case/list", data).then((value) {
      if(value['caseNameList'] != 0){
        caseList = value['caseNameList'];
        for (var item in value['caseNameList']) {
          name.add(item['caseNo']);
          idList.add(item['id']);
        }
        print(name);
        print(idList);
        StateService.reloadData(name);
      }else{
        StateService.reloadData(name);
      }
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 0, 23, 147),
          title: Padding(
            padding: const EdgeInsets.only(right: 0.0, top: 0, left: 0.0),
            child: SizedBox(
                height: 45,
                width: double.infinity,
                child: TypeAheadField(
                  noItemsFoundBuilder: (context) => const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text('No Item Found'),
                    ),
                  ),
                  suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                      color: Colors.white,
                      elevation: 10.0,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  debounceDuration: const Duration(milliseconds: 200),
                  textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF006de4)),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                100.0,
                              )),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(color: Color(0xFF006de4))),
                          hintText: "Search",
                          contentPadding:
                          const EdgeInsets.only(top: 4, left: 10),
                          hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 16),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon:
                              const Icon(Icons.search, color: Color(0xFF006de4))),
                          fillColor: Colors.white,
                          filled: true)),
                  suggestionsCallback: (value) {
                    return StateService.getSuggestions(value);
                  },
                  itemBuilder: (context, String suggestion) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              suggestion,
                              maxLines: 1,
                              // style: TextStyle(color: Colors.red),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  onSuggestionSelected: (String suggestion) {
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Add Item',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 23, 147),
                                fontFamily: "Roboto",
                                fontSize: 18.0,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text("Do You Want to add ${suggestion}?",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 23, 147),
                                fontFamily: "Roboto",
                                fontSize: 14.0,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('Add',
                                  style: TextStyle(
                                  color: Color.fromARGB(255, 0, 23, 147),
                                  fontFamily: "Roboto",
                                  fontSize: 14.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,
                                ),),
                                onPressed: () async {

                                  var elementAt = caseList.elementAt(name.indexOf(suggestion));
                                  print("elementAt");
                                  print(elementAt);
                                  print(idList[name.indexOf(suggestion)]);

                                  Map data = {
                                    'deviceId':deviceId,
                                    'id':idList[name.indexOf(suggestion)]
                                  };
                                  print("data");
                                  print(data);
                                  APIManager().postRequest("https://api.textware.lk/nauru/v1/api/my/case/add", data);
                                  Navigator.of(context).pop();
                                  if(userSelectedData.contains(suggestion)){
                                  }else{
                                    setState(() {
                                      userSelectedData.add(suggestion);
                                      deleteIdList.add(idList[name.indexOf(suggestion)] as int);
                                    });
                                  }
                                },
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('Cancel',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 23, 147),
                                    fontFamily: "Roboto",
                                    fontSize: 14.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        }
                    );

                  },
                )),
          ),
        ),
        body: userSelectedData.length==0? Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Container(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "List your cases here to get notifications",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]),
                ),
              ),
            )
          : Container(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "My Case List ("+userSelectedData.length.toString()+")",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 14.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 8.0),
                      itemCount: userSelectedData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: const Color.fromARGB(255, 0, 23, 147),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                            child: ListTile(
                              leading:
                                Image.asset(
                                  "assets/images/hummer.png",
                                  scale: 1.5,
                                ),
                              title : Text(
                                userSelectedData[index],
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: "Roboto",
                                  fontSize: 18.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Container(
                                width: 35,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: IconButton(
                                        onPressed: (){
                                          showDialog<void>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('Delete',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 0, 23, 147),
                                                      fontFamily: "Roboto",
                                                      fontSize: 18.0,
                                                      letterSpacing: 1.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  content: Text("Do You Want to delete ${userSelectedData[index]}?",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 0, 23, 147),
                                                      fontFamily: "Roboto",
                                                      fontSize: 14.0,
                                                      letterSpacing: 1.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      style: TextButton.styleFrom(
                                                        textStyle: Theme.of(context).textTheme.labelLarge,
                                                      ),
                                                      child: const Text('Delete',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 0, 23, 147),
                                                          fontFamily: "Roboto",
                                                          fontSize: 14.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight: FontWeight.bold,
                                                        ),),
                                                      onPressed: () async {


                                                        Map data = {
                                                          'deviceId':deviceId,
                                                          'id':deleteIdList[index]
                                                        };
                                                        APIManager().postRequest("https://api.textware.lk/nauru/v1/api/my/case/delete", data).then((value) => loadUserData());




                                                        print("selectedCaseList");
                                                        print(selectedCaseList);

                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      style: TextButton.styleFrom(
                                                        textStyle: Theme.of(context).textTheme.labelLarge,
                                                      ),
                                                      child: const Text('Cancel',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 0, 23, 147),
                                                          fontFamily: "Roboto",
                                                          fontSize: 14.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              }
                                          );
                                        },
                                        icon: Icon(Icons.delete_forever, size: 30, color: Color(0xfffeb703)),
                                      )
                                    )
                                  ],
                                ),
                              ),
                            ),

                        );
                      }
            ),
                  ),
                ],
              ),),
          ),
        ),
//)
    );
  }
}