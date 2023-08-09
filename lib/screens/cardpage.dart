import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nauru_mobile_app/components/case_side_card.dart';
import 'package:nauru_mobile_app/components/home_case_card.dart';
import 'package:nauru_mobile_app/constant.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../components/custom_button.dart';
import '../components/home_case_card_ca.dart';
import '../components/home_case_card_dc.dart';
import '../service/api.dart';

class CardPage extends StatefulWidget {
  List Data;
  final bool showAddBtn;

  //CardPage({required this.Data});
  CardPage({Key? key, required this.Data, this.showAddBtn=true}) : super(key: key);

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
    deviceId = await PlatformDeviceId.getDeviceId;
  }

  addToList(id) {
    Map data = {'deviceId': deviceId, 'id': id};
    APIManager()
        .postRequest("https://api.textware.lk/nauru/v1/api/my/case/add", data);
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
      return DynamicHeightGridView(
          itemCount: Value.length,
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          builder: (ctx, index) {
            final now = DateTime.now();
            DateTime expirationDate = DateFormat("yyyy-MM-dd")
                .parse("${Value.elementAt(index)['date']}");
            final bool isExpired = expirationDate.isBefore(now);
            //
            return HomeCaseCardCA(
              showAddBtn: widget.showAddBtn,
                caseNo:
                    "${Value.elementAt(index)['caseNo']!=null?Value.elementAt(index)['caseNo'].replaceAll("\n", " "):""}",
                parties:
                    "${Value.elementAt(index)['parties']!=null?Value.elementAt(index)['parties'].replaceAll("\n", " "):""}",
                counsels:
                    "${Value.elementAt(index)['counsel']!=null?Value.elementAt(index)['counsel'].replaceAll("\n", " "):""}",
                status:
                    "${Value.elementAt(index)['caseStatus']!=null?Value.elementAt(index)['caseStatus'].replaceAll("\n", " "):""}",
                date: "${Value.elementAt(index)['date']}",
              isExpired: isExpired,onClick: (){
              addToList(Value.elementAt(index)['id']);
            },);
          });
    } else if (Value[0]['type'] == "DISTRICTCOURT") {
      return DynamicHeightGridView(
          itemCount: Value.length,
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          builder: (ctx, index) {
            final now = DateTime.now();
            DateTime expirationDate = DateFormat("yyyy-MM-dd")
                .parse("${Value.elementAt(index)['date']}");
            final bool isExpired = expirationDate.isBefore(now);
            //
            print(Value.elementAt(index));
            return HomeCaseCardDC(
                showAddBtn: widget.showAddBtn,
                caseNo: "${Value.elementAt(index)['caseNo']!=null?Value.elementAt(index)['caseNo'].replaceAll("\n", " "):""}",
                title: "${Value.elementAt(index)['title']!=null?Value.elementAt(index)['title'].replaceAll("\n", " "):""}",
                counsels: "${Value.elementAt(index)['counsel']!=null?Value.elementAt(index)['counsel'].replaceAll("\n", " "):""}",
                status: "${Value.elementAt(index)['caseStatus']!=null?Value.elementAt(index)['caseStatus'].replaceAll("\n", " "):""}",
                remark: "${Value.elementAt(index)['remarks']!=null?Value.elementAt(index)['remarks'].replaceAll("\n", " "):""}",
                date: "${Value.elementAt(index)['date']}",
                isExpired: isExpired,onClick: (){
              addToList(Value.elementAt(index)['id']);
            },);
          });
    } else if (Value[0]['type'] == "SUPREMECOURT") {
      return DynamicHeightGridView(
          itemCount: Value.length,
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          builder: (ctx, index) {
            final now = DateTime.now();
            DateTime expirationDate = DateFormat("yyyy-MM-dd")
                .parse("${Value.elementAt(index)['date']}");
            final bool isExpired = expirationDate.isBefore(now);
            //
            return HomeCaseCard(
                showAddBtn: widget.showAddBtn,
                caseNo: "${Value.elementAt(index)['caseNo']!=null?Value.elementAt(index)['caseNo'].replaceAll("\n", " "):""}",
                parties: "${Value.elementAt(index)['parties']!=null?Value.elementAt(index)['parties'].replaceAll("\n", " "):""}",
                pledger: "${Value.elementAt(index)['pleaders']!=null?Value.elementAt(index)['pleaders'].replaceAll("\n", " "):""}",
                status: "${Value.elementAt(index)['statusOfCase']!=null?Value.elementAt(index)['statusOfCase'].replaceAll("\n", " "):""}",
                def: "${Value.elementAt(index)['statusOfDef']!=null?Value.elementAt(index)['statusOfDef'].replaceAll("\n", " "):""}",
                judge: "${Value.elementAt(index)['judgeAssigned']!=null?Value.elementAt(index)['judgeAssigned'].replaceAll("\n", " "):""}",
                date: "${Value.elementAt(index)['date']}",
              isExpired: isExpired,onClick: (){
              addToList(Value.elementAt(index)['id']);
            },);
          });
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
