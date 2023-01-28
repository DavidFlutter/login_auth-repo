import 'package:flutter/material.dart';

class TextInputArea extends StatelessWidget {
  var labelText;
  var isPass;
  var myContoller;

  TextInputArea({
    this.labelText = "",
    this.isPass = false,
    this.myContoller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: TextField(
        controller: myContoller,
        obscureText: isPass,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: labelText,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
    );
  }
}
