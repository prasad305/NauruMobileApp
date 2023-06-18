import 'package:flutter/material.dart';

import '../constant.dart';
import 'custom_button.dart';

class CaseSideCard extends StatelessWidget {
  final String caseNo;
  final dynamic onClick;

  const CaseSideCard({
    Key? key,
    required this.caseNo, this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            bottomLeft: Radius.circular(12.0),
          ),
          child: Image.asset(
            "assets/images/Pic.png",
            color: Colors.white.withOpacity(0.13),
            colorBlendMode: BlendMode.modulate,
            height: double.infinity,
            width: Constant.getWidthPartial(context, 30.0),
            fit: BoxFit.cover,
          ),
        ),
        Center(
            child: Container(
          width: Constant.getWidthPartial(context, 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Case No : ",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Text(
                caseNo,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20,),
              CustomButton(title: "Add to My List",selected: false,onClick: onClick,width: Constant.getWidthPartial(context, 25.0),),
            ],
          ),
        ))
      ],
    ));
  }
}
