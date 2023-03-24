import 'package:flutter/material.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/success.gif'),
            Text(
              'Your Payment Was Done Successfully',
              textAlign: TextAlign.center,style: TextStyle(fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: LogButton(
                  text: 'OK',
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                  radius: 10.0,
                  width: 300.0,
                  high: 40.0),
            )
          ],
        ),
      ),
    );
  }
}
