import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  List<String> userSearchItems = []; //Select Item Holder

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 1, 32, 96),
          title: Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 0, left: 10.0),
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
                            borderSide: BorderSide(color: Color.fromARGB(255, 1, 32, 96)),
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
                              borderSide: BorderSide(color: Color.fromARGB(255, 1, 32, 96))),
                          hintText: "Search",
                          contentPadding:
                          const EdgeInsets.only(top: 4, left: 10),
                          hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 16),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon:
                              const Icon(Icons.search, color: Color.fromARGB(255, 1, 32, 96))),
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
                        ),/*,
                        const Icon(
                          Icons.refresh,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),*/
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
                                color: Color.fromARGB(255, 1, 32, 96),
                                fontFamily: "Roboto",
                                fontSize: 18.0,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text("Do You Want to add ${suggestion}?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 1, 32, 96),
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
                                  color: Color.fromARGB(255, 1, 32, 96),
                                  fontFamily: "Roboto",
                                  fontSize: 14.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,
                                ),),
                                onPressed: () {
                                  setState(() {
                                    userSelected = suggestion;
                                    userSearchItems.add(suggestion);
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('Cancel',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 1, 32, 96),
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
                    /*setState(() {
                      userSelected = suggestion;
                      userSearchItems.add(suggestion);
                    });*/
                  },
                )),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /*Visibility(
                    visible: (userSearchItems.length != 0),
                    child: Stack( children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: Color.fromARGB(255, 1, 32, 96)),
                          borderRadius: BorderRadius.circular(10),
                          *//*boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              blurRadius: 4,
                              offset: Offset(0, 1), // Shadow position
                            ),
                          ],*//*
                        ),
                        padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                        margin: const EdgeInsets.fromLTRB(13.0, 15.0, 13.0, 12.0),
                        //height: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              icon: Icon(Icons.fact_check),
                              onPressed: (){
                                showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Delete',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 1, 32, 96),
                                            fontFamily: "Roboto",
                                            fontSize: 18.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: Text("Check the list?",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 1, 32, 96),
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
                                            child: const Text('Check',
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 1, 32, 96),
                                                fontFamily: "Roboto",
                                                fontSize: 14.0,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: Theme.of(context).textTheme.labelLarge,
                                            ),
                                            child: const Text('Cancel',
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 1, 32, 96),
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
                              label: const Text(
                                'Check',
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 1, 32, 96),
                                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              ),
                            ),
                            ElevatedButton.icon(
                              icon: Icon(Icons.delete),
                              onPressed: (){
                                showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Delete',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 1, 32, 96),
                                            fontFamily: "Roboto",
                                            fontSize: 18.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: Text("Do You Want to delete all list?",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 1, 32, 96),
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
                                                color: Color.fromARGB(255, 1, 32, 96),
                                                fontFamily: "Roboto",
                                                fontSize: 14.0,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            onPressed: () {
                                              setState(() {
                                                userSearchItems.clear();
                                              });

                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: Theme.of(context).textTheme.labelLarge,
                                            ),
                                            child: const Text('Cancel',
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 1, 32, 96),
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
                              label: const Text(
                                'Delete',
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 1, 32, 96),
                                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 8,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 5, left: 2, right: 2),
                          color: Colors.white,
                          child: Text(
                            'List Configurations',
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 32, 96),
                              fontFamily: "Roboto",
                              fontSize: 14.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ], )
                  ),*/
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                      itemCount: userSearchItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Color.fromARGB(255, 1, 32, 96),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            child: ListTile(
                              title : Text(
                                userSearchItems[index],
                                style: TextStyle(
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
                                                      color: Color.fromARGB(255, 1, 32, 96),
                                                      fontFamily: "Roboto",
                                                      fontSize: 18.0,
                                                      letterSpacing: 1.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  content: Text("Do You Want to delete ${userSearchItems[index]}?",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 1, 32, 96),
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
                                                          color: Color.fromARGB(255, 1, 32, 96),
                                                          fontFamily: "Roboto",
                                                          fontSize: 14.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight: FontWeight.bold,
                                                        ),),
                                                      onPressed: () {
                                                        setState(() {
                                                          userSearchItems.removeAt(index);
                                                        });

                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      style: TextButton.styleFrom(
                                                        textStyle: Theme.of(context).textTheme.labelLarge,
                                                      ),
                                                      child: const Text('Cancel',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 1, 32, 96),
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
                                        icon: Icon(Icons.delete, size: 30, color: Colors.white,),
                                      )
                                    )
                                  ],
                                ),
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