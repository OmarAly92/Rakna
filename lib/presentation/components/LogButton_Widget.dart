import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogButton extends StatelessWidget {
  const LogButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.radius, required this.width, required this.high,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double radius;
  final double width;
  final double high;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: high,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16.sp),
        ),
      ),
    );
  }
}
