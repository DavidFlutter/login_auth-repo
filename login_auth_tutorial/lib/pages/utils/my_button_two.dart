import 'package:flutter/material.dart';

class MyButtonTwo extends StatelessWidget {
  var inputImage;

  MyButtonTwo(this.inputImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(10),
      height: 70,
      width: 70,
      child: Image.asset(inputImage),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }
}
