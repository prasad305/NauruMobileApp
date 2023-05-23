import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool selected;
  final dynamic onClick;

  const CustomButton({
    Key? key,
    required this.title,
    required this.selected, this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 100 * 27.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: selected
              ? [Color(0xFFFEB703), Color(0xFFEFB208)]
              : [Color(0xFF006DE4), Color(0xFF055DBD)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, elevation: 0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 14.0,
            color: selected ? Color(0xFF012557) : Colors.white,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
