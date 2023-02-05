import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.hintText,
      required this.leftPadding,
      required this.rightPadding})
      : super(key: key);

  late double leftPadding;
  late double rightPadding;
  late String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
        top: 20,
        left: leftPadding,
        right: rightPadding,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.grey[290],
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
