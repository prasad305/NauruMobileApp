import 'package:flutter/material.dart';

class StuffCard extends StatelessWidget {
  final String img;
  final String title;
  final String desc;

  const StuffCard({
    Key? key,
    required this.title,
    required this.img,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/" + img,
              colorBlendMode: BlendMode.modulate,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 2,
      ),
      Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Roboto",
            letterSpacing: 1.0,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 34, 34, 34),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Center(
        child: Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Roboto",
            letterSpacing: 1.0,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 136, 136, 136),
          ),
        ),
      )
    ]);
  }
}
