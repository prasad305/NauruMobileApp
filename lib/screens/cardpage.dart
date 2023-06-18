import 'package:flutter/material.dart';
import 'package:nauru_mobile_app/components/case_side_card.dart';
import 'package:nauru_mobile_app/constant.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../components/custom_button.dart';
import '../service/api.dart';

class CardPage extends StatefulWidget {
  List Data;

  //CardPage({required this.Data});
  CardPage({Key? key, required this.Data}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState(Data);
}

class _CardPageState extends State<CardPage> {
  List Value;

  _CardPageState(this.Value);

  int i = 0; //List Records Counter
  String? deviceId;

  @override
  initState() {
    super.initState();
    loadDeviceId();
  }

  loadDeviceId() async {
    deviceId  = await PlatformDeviceId.getDeviceId;
  }


  addToList(id){



    Map data = {
      'deviceId':deviceId,
      'id':id
    };
    print("data");
    print(data);
    APIManager().postRequest("https://api.textware.lk/nauru/v1/api/my/case/add", data);
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Case Added'),
            content: const Text('Please Check My Case List'),
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

  Widget build(BuildContext context) {
    print(Value[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          PageHeading(),
          style: const TextStyle(
            fontFamily: "Roboto",
            letterSpacing: 1.0,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 23, 147),
      ),
      body: ShowWidget(),
    );
  }

  ShowWidget() {
    if (Value[0]['type'] == "COURTOFAPPEAL") {
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
                    offset: const Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CaseSideCard(caseNo:"${Value.elementAt(index)['caseNo']}",onClick: (){
                    addToList(Value.elementAt(index)['id']);
                  },),
            Container(
            width: Constant.getWidthPartial(context, 60.0),
            child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Parties : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['parties'].replaceAll("\n", " v ")}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
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
                              const Text(
                                "Counsel : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: 230,
                                //color: Colors.red,
                                child: Text(
                                  "${Value.elementAt(index)['counsel']}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
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
                              const Text(
                                "Status of Cases : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['caseStatus']}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),),
                ],
              ),
            );
          },
        ),
      );
    } else if (Value[0]['type'] == "DISTRICTCOURT") {
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
                  CaseSideCard(caseNo:"${Value.elementAt(index)['caseNo']}",onClick: (){

                    addToList(Value.elementAt(index)['id']);

                  },),
            Container(
            width: Constant.getWidthPartial(context, 60.0),
            child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Case Title : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['parties']}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
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
                              const Text(
                                "Counsel : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['counsel']}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
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
                              const Text(
                                "Case Status : ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: 230,
                                child: Text(
                                  "${Value.elementAt(index)['caseStatus']}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),),
                ],
              ),
            );
          },
        ),
      );
    } else if (Value[0]['type'] == "SUPREMECOURT") {
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
                  CaseSideCard(caseNo: "${Value.elementAt(index)['caseNo']}",onClick: (){

                    addToList(Value.elementAt(index)['id']);

                  },),
                  Container(
                    width: Constant.getWidthPartial(context, 60.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Parties : ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width:
                                      Constant.getWidthPartial(context, 55.0),
                                  child: Text(
                                    "${Value.elementAt(index)['parties']}",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
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
                                const Text(
                                  "Pleaders : ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width:
                                      Constant.getWidthPartial(context, 55.0),
                                  //color: Colors.red,
                                  child: Text(
                                    "${Value.elementAt(index)['pleaders']}",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
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
                                const Text(
                                  "Status of Cases : ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width:
                                      Constant.getWidthPartial(context, 55.0),
                                  child: Text(
                                    "${Value.elementAt(index)['statusOfCases']}",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
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
                                const Text(
                                  "Status of Def : ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width:
                                      Constant.getWidthPartial(context, 55.0),
                                  child: Text(
                                    "${Value.elementAt(index)['statusOfDef']}",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
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
                                const Text(
                                  "Judge Assigned : ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width:
                                      Constant.getWidthPartial(context, 55.0),
                                  child: Text(
                                    "${Value.elementAt(index)['judgeAssigned']}",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
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

  PageHeading() {
    if (Value[0]['type'] == "COURTOFAPPEAL") {
      return "Court of Appeal";
    } else if (Value[0]['type'] == "DISTRICTCOURT") {
      return "District Court";
    } else if (Value[0]['type'] == "SUPREMECOURT") {
      return "Supreme Court";
    }
  }
}
