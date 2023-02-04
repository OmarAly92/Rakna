import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/book_screen.dart';
import 'package:rakna/presentation/screens/dashboard.dart';
import 'package:rakna/presentation/screens/home_screen.dart';
import 'package:rakna/presentation/screens/navigation_bar.dart';
import 'package:rakna/presentation/screens/onboarding_screen.dart';
import 'package:rakna/presentation/screens/parking_detail2.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';
import 'package:rakna/presentation/screens/setting_screen.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';
import 'package:rakna/presentation/screens/sign_up_screen.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';
import 'package:rakna/presentation/screens/splash_screen.dart';
import 'package:rakna/team2/Payment.dart';
import 'package:rakna/team2/Payment2.dart';
import 'package:rakna/team2/Submit_Screen.dart';

void main() {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
