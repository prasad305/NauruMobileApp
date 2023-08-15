import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:nauru_mobile_app/constant.dart';
import 'package:nauru_mobile_app/data/upcoming_case.dart';
import 'package:nauru_mobile_app/service/api.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../components/circle_loader.dart';
import '../data/state_servies.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key,}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<SearchPage>{

  int i = 0;//List Records Counter
  String? userSelected = "";
  // List<String> userSelectedData = []; //Select Item Holder
  // List<String> typeData = []; //Select Item Holder

  @override
  initState() {
    super.initState();
    loadUserData();
    loadData();
  }
  List<UpcomingCase> allFilterList = [];
  String? deviceId;
  List<UpcomingCase> userCaseList= [];
  loadUserData() async {
    userCaseList = [];
    Timer.run(() {
      CircleLoader.showCustomDialog(context);
    });

    deviceId  = await PlatformDeviceId.getDeviceId;

    Map data = {
      'deviceId':deviceId
    };

    APIManager().postRequest("https://api.textware.lk/nauru/v1/api/my/case", data).then((value) {
      CircleLoader.hideLoader(context);
      if(value['userCaseList'].length==0){
        setState(() {
          userCaseList = [];
        });
      }
      for (var item in value['userCaseList']) {
        setState(() {

          var type = item['caseId']['type'] as String;
          var parties = '';
          if(type=="SUPREMECOURT"){
            type = "Supreme Court";
            parties =item['caseId']['parties'] as String;
          }else if(type =="DISTRICTCOURT"){
            type = "District Court";
            parties =item['caseId']['title'] as String;
          }else{
            type = "Court Of Appeal";
            parties =item['caseId']['parties'] as String;
          }
          userCaseList.add(UpcomingCase(id: item['caseId']['id'] as int,
              title: item['caseId']['caseNo'] as String,
              court: type,
              parties:parties));

        });
      }


    });


  }
  loadData() async {
    StateService.reloadDataObj(allFilterList);
    var now = new DateTime.now().toString();
    Map data = {
      'dateFrom': now.split(" ")[0]
    };
    APIManager().postRequest(Constant.domain+"/nauru/v1/api/case/list", data).then((value) {
      // print("ssssxxsaas"+value);
      if(value['caseNameList'] != 0){
        for (var item in value['caseNameList']) {

          print(item);
          var parties = '';
          if(item['type']=="SUPREMECOURT"){
            parties =item['parties'] as String;
          }else if(item['type'] =="DISTRICTCOURT"){
            parties =item['title'] as String;
          }else{
            parties =item['parties'] as String;
          }

          allFilterList.add(UpcomingCase(id: item['id'] as int, title: item['caseNo'] as String,
              court: item['type'],
              parties: parties+item['caseNo'] as String));
        }
        StateService.reloadDataObj(allFilterList);
      }else{
        StateService.reloadDataObj(allFilterList);
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
                  itemBuilder: (context, UpcomingCase suggestion) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [Text(
                              suggestion.title,
                              maxLines: 1,
                              // style: TextStyle(color: Colors.red),
                              overflow: TextOverflow.ellipsis,
                            ),Text(
                              '('+suggestion.parties+')',
                              maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                            )],) ,
                          ),
                        )
                      ],
                    );
                  },
                  onSuggestionSelected: (UpcomingCase suggestion) {
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
                            content: Text("Do You Want to add ${suggestion.title}?",
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
                                  Map data = {
                                    'deviceId':deviceId,
                                    'id':suggestion.id
                                  };
                                  APIManager().postRequest("https://api.textware.lk/nauru/v1/api/my/case/add", data);
                                  Navigator.of(context).pop();

                                  if(userCaseList.map((item) => item.title).contains(suggestion)){
                                  }else{
                                    setState(() {
                                      // userSelectedData.add(suggestion);
                                      // typeData.add(suggestion);
                                      userCaseList.add(UpcomingCase(id: suggestion.id, title: suggestion.title, court: suggestion.court,parties: ""));
                                      // deleteIdList.add(idList[name.indexOf(suggestion)] as int);
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
        body: userCaseList.isEmpty? Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Container(
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                    "My Case List ("+userCaseList.length.toString()+")",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 0, 0, 100),
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 8.0),
                      itemCount: userCaseList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: const Color.fromARGB(255, 239, 240, 250),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                            child: ListTile(
                              leading:
                                Image.asset(
                                  "assets/images/hammer.png",
                                  scale: 3,
                                ),
                              title :
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text(
                                      userCaseList[index].title,
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 100),
                                        fontFamily: "Roboto",
                                        fontSize: 14.0,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      userCaseList[index].court,
                                      style: const TextStyle(
                                        color: Color.fromARGB(
                                            255, 141, 140, 140),
                                        fontFamily: "Roboto",
                                        fontSize: 14.0,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],)

                              ,

                              trailing: SizedBox(
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
                                          content: Text("Do You Want to delete ${userCaseList[index].title}?",
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
                                              child: const Text('Delete',
                                                style: TextStyle(
                                                  color: Color.fromARGB(255, 0, 23, 147),
                                                  fontFamily: "Roboto",
                                                  fontSize: 14.0,
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              onPressed: () async {

                                                // loadUserData();
                                                Map data = {
                                                  'deviceId':deviceId,
                                                  'id':userCaseList[index].id
                                                };
                                                APIManager().postRequest("https://api.textware.lk/nauru/v1/api/my/case/delete", data).then((value) =>
                                                  {
                                                    loadUserData()
                                                  }
                                                );
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
                                icon: Image.asset("assets/images/bin.png",scale: 3.5),
                              ),)
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