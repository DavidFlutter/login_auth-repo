import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  var buttonText;

  MyButton({this.buttonText = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
