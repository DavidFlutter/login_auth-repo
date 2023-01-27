import 'package:flutter/material.dart';

class TextInputArea extends StatelessWidget {
  var labelText;
  var isPass;

  TextInputArea({
    this.labelText = "",
    this.isPass = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      child: TextField(
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
