import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rakna/presentation/screens/book_screen.dart';
import 'package:rakna/presentation/screens/dashboard.dart';
import 'package:rakna/presentation/screens/home_screen.dart';
import 'package:rakna/presentation/screens/onboarding_screen.dart';
import 'package:rakna/presentation/screens/parking_details.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';
import 'package:rakna/presentation/screens/setting_screen.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';
import 'package:rakna/presentation/screens/sign_up_screen.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';
import 'package:rakna/presentation/screens/splash_screen.dart';

void main() {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
