import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  String title;
  VoidCallback onTap;
  RoundButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueAccent),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 20),
        )),
      ),
      onTap: onTap,
    );
  }
}
