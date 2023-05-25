import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:nauru_mobile_app/screens/contact.dart';
import 'package:nauru_mobile_app/screens/courtofappeal.dart';
import 'package:nauru_mobile_app/screens/districtcourt.dart';
import 'package:nauru_mobile_app/screens/staffpage.dart';
import 'package:nauru_mobile_app/screens/supremecourt.dart';
import 'package:nauru_mobile_app/screens/webview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import '../components/circle_loader.dart';
import '../components/custom_button.dart';
import '../components/home_line_card.dart';
import '../components/rounded_clickable_icon.dart';
import 'about.dart';
import 'cardpage.dart';
import 'notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController =
      TextEditingController(); //Text of TextField
  List<dynamic> data = []; //ApiPass Body Data Holder
  String  SelectedValueHolder = "DISTRICTCOURT";
  String  title = "Good Morning!";

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var isWebView = false;

  var dcSelected = true;
  var scSelected = false;
  var coaSelected = false;
  late Widget webView;
  var currentUrl = "google.com";
  late WebViewXController webviewController;

  static const yellow = Color(0xfffeb703);
  static const blue = Color.fromARGB(255, 0, 23, 147);

  openUrl(url, path) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WebViewPage(url:"https://"+url+'/'+path)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTitle();
  }


  void _ShowDatePicker(){
    showDatePicker(
        //Color.fromARGB(255, 246, 197, 0)
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2050),
        builder: (context, child) => (Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: blue,
                  onPrimary: Color.fromARGB(255, 255, 255, 255),
                  onSurface: blue,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        blue, // button text color
                  ),
                ),
              ),
              child: child!,
            ))).then((value) {
      setState(() {
        _textEditingController.text = DateFormat('yyyy-MM-dd').format(value!);
      });
    });
  }


  setTitle(){
    var today = DateTime.now();
    var curHr = today.hour;

    if (curHr < 12) {

      setState(() {
        title = 'Good Morning!';
      });

    } else if (curHr < 18) {
      setState(() {
        title = 'Good Afternoon!';
      });
    } else {
      setState(() {
        title = 'Good Evening!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //TextEditingController _textEditingController = TextEditingController(); //Text of TextField
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only( left:0.0,right: 10.0),
              child: Image.asset(
                "assets/images/logo.png",
                scale:4.5,
              ),
            ),
            SizedBox(width: 1,),
            const Text(
              "NAURU JUDICIARY",
              style: TextStyle(
                fontFamily: "Roboto",
                letterSpacing: 1.0,
                fontSize: 18.0,
                color: yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: blue,
        actions: [
          RoundedClickableIcon(
            color: yellow,
            icon: Icons.notifications,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Notifiation()));
            },
            showNotification: false,
          ),
          IconButton(
              icon: const Icon(Icons.menu, color: yellow,),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              })
        ],
      ),
      body:isWebView ? webView : SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          const Text(
            'Ekamowir omo',
            style: TextStyle(
              color: yellow,
              fontFamily: "Roboto",
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            title,
            style: const TextStyle(
              color: blue,
              fontFamily: "Roboto",
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),const SizedBox(height: 15,),


          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 25.0),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //First Selection
                  //Spacer

                  const Text("Check the upcoming cases"),
                  SizedBox(height: 5,),
                  Row(
                    children:  [
                      CustomButton(title: "District Court",selected: dcSelected,onClick: (){

                        setState(() {
                          dcSelected = true;
                          scSelected = false;
                          coaSelected= false;
                          SelectedValueHolder = "DISTRICTCOURT";
                        });

                      },),
                      SizedBox(width: 5,),
                      CustomButton(title: "Supreme Court",selected: scSelected,onClick: (){
                        setState(() {
                          dcSelected = false;
                          scSelected = true;
                          coaSelected= false;
                          SelectedValueHolder = "SUPREMECOURT";
                        });

                      }),
                      SizedBox(width: 5,),
                      CustomButton(title: "Court of Appeal ",selected: coaSelected,onClick: (){
                        setState(() {
                          dcSelected = false;
                          scSelected = false;
                          coaSelected= true;
                          SelectedValueHolder = "COURTOFAPPEAL";
                        });
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ), //Spacer
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: blue,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: _textEditingController.clear,
                                icon: const Icon(
                                  Icons.clear,
                                  color: blue,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xFF006de4)),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    bottomLeft: Radius.circular(6)),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    bottomLeft: Radius.circular(6)),
                                borderSide: BorderSide(
                                    color: blue,
                                    width: 2.0),
                              ),
                              hintText: 'Select the Date',
                              //enabled: false,
                            ),
                            readOnly: true,
                          ),
                        ),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6))),
                          child: IconButton(
                              icon: Icon(
                                Icons.calendar_month_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: _ShowDatePicker),
                        )
                      ],
                    ),
                  ),
                  //SizedBox(height: 10.0,),

                  SizedBox(
                    height: 10.0,
                  ), //Spacer

                  //Submit Button
                  Container(
                    width: MediaQuery.of(context).size.width / 100 * 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [blue, Color.fromARGB(
                            255, 4, 34, 193)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        ApiCaller();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0),
                      child: const Text(
                        'Search',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18.0,
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ), //S
          const Text(
            'GOING TO COURT',
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 18.0,
              color: Colors.black,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
                      padding: const EdgeInsets.all(15),
                      child: Table(//table border
                          children: const [
                        TableRow(children: [
                          HomeCard(
                            img: "c1.png",
                            title: "Court room etiquette",
                            url:
                                "https://naurujudiciary.gov.nr/going-to-court/court-room-etiquette/",
                          ),
                          HomeCard(
                            img: "c2.png",
                            title: "Understanding bail",
                            url:
                                "https://naurujudiciary.gov.nr/going-to-court/understanding-bail",
                          ),
                        ]),
                        TableRow(children: [
                          HomeCard(
                              img: "c3.png",
                              title: "Family disputes",
                              url:
                                  "https://naurujudiciary.gov.nr/going-to-court/family-disputes/"),
                          HomeCard(
                              img: "c4.png",
                              title: "Money claims",
                              url:
                                  "https://naurujudiciary.gov.nr/going-to-court/family-disputes/"),
                        ]),
                        TableRow(children: [
                          HomeCard(
                              img: "c5.png",
                              title: "Domestic and Family violence",
                              url:
                                  "https://naurujudiciary.gov.nr/going-to-court/domestic-and-family-violence/"),
                          HomeCard(
                              img: "c6.png",
                              title: "Land disputes",
                              url:
                                  "https://naurujudiciary.gov.nr/going-to-court/land-disputes/"),
                        ]),
                        TableRow(children: [
                          HomeCard(
                              img: "c7.png",
                              title: "Appealing a decision",
                              url:
                                  "https://naurujudiciary.gov.nr/going-to-court/land-disputes/"),
                          HomeCard(
                              img: "c8.png",
                              title: "Legal advice",
                              url:
                                  "https://naurujudiciary.gov.nr/going-to-court/land-disputes/"),
                        ]),
                        TableRow(children: [
                          HomeCard(
                              img: "c9.png",
                              title: "Practice directions for lawyers",
                              url:
                                  "https://naurujudiciary.gov.nr/going-to-court/land-disputes/"),
                          HomeCard(
                              img: "c1.png",
                              title: "",
                              url:
                              "",showImg: false,),
                        ]),
                      ])),
                ],
      )),
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                  height: 120.0,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: blue,
                    ),
                    child: Text(
                      'NAURU JUDICIARY',
                      style: TextStyle(
                        color: yellow,
                        fontFamily: "Roboto",
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),

              ListTile(
                title: const Text(
                  'About',
                  style: TextStyle(
                    color: blue,
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ),
                  );

                },
              ),
              ExpansionTile(
                iconColor: blue,
                collapsedIconColor: blue,
                childrenPadding: const EdgeInsets.only(left: 20.0),
                expandedCrossAxisAlignment: CrossAxisAlignment.end,
                title: const Text(
                  'The Courts',
                  style: TextStyle(
                    color: blue,
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    title: const Text(
                      'District Court',
                      style: TextStyle(
                        color: blue,
                        fontFamily: "Roboto",
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DistrictCourtPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Supreme Court',
                      style: TextStyle(
                        color: blue,
                        fontFamily: "Roboto",
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SupremeCourtPage(),
                        ),
                      );

                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Court of Appeal',
                      style: TextStyle(
                        color: blue,
                        fontFamily: "Roboto",
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourtOfAppealPage(),
                        ),
                      );

                    },
                  ),
                ],
              ),

              ExpansionTile(
                iconColor: blue,
                collapsedIconColor: blue,
                childrenPadding: EdgeInsets.only(left: 20.0),
                expandedCrossAxisAlignment: CrossAxisAlignment.end,
                title: const Text(
                  'Registry',
                  style: TextStyle(
                    color: blue,
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: <Widget>[
                  // todo reg services
                  // ListTile(
                  //   title: const Text(
                  //     'Registrar',
                  //     style: TextStyle(
                  //       color: blue,
                  //       fontFamily: "Roboto",
                  //       fontSize: 18.0,
                  //       letterSpacing: 1.0,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => RegistryPage(),
                  //       ),
                  //     );
                  //   },
                  // ),
                  ListTile(
                    title: const Text(
                      'Staff',
                      style: TextStyle(
                        color: blue,
                        fontFamily: "Roboto",
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StaffPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              // ListTile(
              //   title: const Text(
              //     'Going To Court',
              //     style: TextStyle(
              //       color: blue,
              //       fontFamily: "Roboto",
              //       fontSize: 18.0,
              //       letterSpacing: 1.0,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   onTap: () {
              //     // Update the state of the app
              //     Navigator.pop(context);
              //     openUrl('naurujudiciary.gov.nr',
              //         'going-to-court/court-room-etiquette/');
              //     // ...
              //     // Then close the drawer
              //   },
              // ),
              // ListTile(
              //   title: const Text(
              //     'Publications',
              //     style: TextStyle(
              //       color: blue,
              //       fontFamily: "Roboto",
              //       fontSize: 18.0,
              //       letterSpacing: 1.0,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   onTap: () {
              //     // Update the state of the app
              //     Navigator.pop(context);
              //     openUrl('naurujudiciary.gov.nr', 'annual-reports/');
              //     // ...
              //   },
              // ),
              ListTile(
                title: const Text(
                  'Contact us',
                  style: TextStyle(
                    color: blue,
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Visit Site',
                  style: TextStyle(
                    color: blue,
                    fontFamily: "Roboto",
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  final Uri url = Uri.parse('https://naurujudiciary.gov.nr/');
                  if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
                  }
                },
              ),
              // const AboutListTile(
              //   // icon: Icon(
              //   //   Icons.info,
              //   //   color: blue,
              //   // ),
              //   child: Text(
              //     'About App',
              //     style: TextStyle(
              //       color: blue,
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

  Future<void> checkAll() async {
    DateTime now = DateTime.now();

    List<dynamic> notificationList = [];
    List<int> caseIdList = [];
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('idList') ?? "null";

    if(counter!="null"){
      for (var item in jsonDecode(counter)) {
        caseIdList.add(item['id'] as int);
      }
    }

    final response = await http.post(Uri.parse("https://api.textware.lk/nauru/v1/api/case/check"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'dateFrom': now.toString().split(" ")[0], 'idList': caseIdList.toString()}),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);


      if (json['upcomingCaseList'] != 0) {
        for (var item in json['upcomingCaseList']) {

          notificationList.add(jsonEncode(item));
        }
        print(notificationList.toString());
        prefs.setString("notification", notificationList.toString());
      }
    }
  }

  void ApiCaller() async {


    String Date = _textEditingController.text.trim();
    if (!(Date.isEmpty) &&
        (SelectedValueHolder != "- Select Court -" &&
            SelectedValueHolder != "")) {

      const url = "https://api.textware.lk/nauru/v1/api/search";
      final uri = Uri.parse(url);

      try {
        CircleLoader.showCustomDialog(context);
        final response = await http.post(
          uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{'type': SelectedValueHolder, 'date': Date}),
        );
        //http.post(uri, {"dateFrom":Date,"idList":SelectedValueHolder})
        if (response.statusCode == 200) {
          CircleLoader.hideLoader(context);
          //Check Response is success
          final body = response.body;
          final json = jsonDecode(body);
          setState(() {
            data = json["upcomingCaseList"];
            print(data);
          });
          if (data.length != 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardPage(Data: data),
              ),
            );
            print("Move to the list page!");
          }else{
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Sorry'),
                    content: const Text("No cases found"),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelMedium,
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
        } else {
          CircleLoader.hideLoader(context);
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Sorry'),
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
      } catch (e) {
        CircleLoader.hideLoader(context);
        error = e.toString();
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Sorry'),
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
            });
      }
    } else {
      //print("Not Selected!");
      showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sorry!'),
              content: const Text('Please Select Date!'),
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
}

//DropDown List
const List<String> list = <String>[
  '- Select Court -',
  'Supreme Court',
  'District Court',
  'Court of Appeal'
]; //DropDown Contain List

class DropdownList extends StatefulWidget {
  //1. required this.onChanged,
  final Function onChanged;

  const DropdownList({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

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
        border: Border.all(color: Color.fromARGB(255, 0, 23, 147), width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 55,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon:  const Icon(
            Icons.arrow_drop_down,
            size: 24.0,
            color: Color.fromARGB(255, 0, 23, 147),
          ),
          elevation: 16,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color.fromARGB(255, 0, 23, 147),
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
