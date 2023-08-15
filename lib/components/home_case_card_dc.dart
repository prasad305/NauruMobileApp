import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCaseCardDC extends StatelessWidget {
  final String caseNo;
  final String title;
  final String counsels;
  final String status;
  final String remark;
  final String date;
  final dynamic onClick;
  final bool isExpired;
  final bool showAddBtn;

  const HomeCaseCardDC({
    Key? key,
    required this.caseNo,
    this.onClick,
    required this.status,
    required this.date,
    required this.isExpired,
    required this.title,
    required this.counsels,
    required this.remark, this.showAddBtn=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
      padding: const EdgeInsets.all(5),
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xFFC5E4FF),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(children: [
                    const Text("Case No : ",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold)),
                    Flexible(
                        child: Text(caseNo,
                            style: const TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold)))
                  ]),
                )),
            const SizedBox(
              width: 10,
            ),
            Text(
              date,
              style: TextStyle(
                  color: isExpired
                      ? Color.fromARGB(255, 255, 103, 0)
                      : Color.fromARGB(255, 72, 137, 0),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            )
          ],
        ),
        SizedBox(height: 10),
        Row(children: [
          const Text(
            "Case Title : ",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 100),
                fontSize: 15.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                  color: Color.fromARGB(255, 61, 65, 198),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
        ]),
        SizedBox(height: 10),
        Row(children: [
          const Text(
            "Counsels : ",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 100),
                fontSize: 15.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
          Flexible(
            child: Text(
              counsels,
              style: const TextStyle(
                  color: Color.fromARGB(255, 61, 65, 198),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
        ]),
        SizedBox(height: 10),
        Row(children: [
          const Text(
            "Status Of Case : ",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 100),
                fontSize: 15.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
          Flexible(
            child: Text(
              status,
              style: TextStyle(
                  color: Color.fromARGB(255, 61, 65, 198),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          const Text(
            "Remarks : ",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 100),
                fontSize: 15.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
          Flexible(
            child: Text(
              remark,
              style: const TextStyle(
                  color: Color.fromARGB(255, 61, 65, 198),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 210,
            child: const Row(
              children: [
                Text(
                  " ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 100),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
                Flexible(
                  child: Text(
                    "",
                    style: TextStyle(
                        color: Color.fromARGB(255, 61, 65, 198),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          showAddBtn ? SizedBox(
            width:  MediaQuery.of(context).size.height * 0.095,
            height: MediaQuery.of(context).size.height * 0.040,
            child: ElevatedButton(
              onPressed: onClick,

              child: const Padding(
                padding: EdgeInsets.all(1.0),
                child:  Text(
                  "Add To My List",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 11.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 23, 39, 125)),
            ),
          ):SizedBox(width: 1,)
          // CustomButtonV2(
          //   title: "Add to My List",
          //   selected: false,
          //   onClick: onClick,
          //   width: Constant.getWidthPartial(context, 35.0),
          // ),
        ])
      ]),
    );
  }
}
