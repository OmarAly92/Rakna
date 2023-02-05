import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/book_screen.dart';
import 'package:rakna/presentation/screens/dashboard.dart';
import 'package:rakna/presentation/screens/home_screen.dart';
import 'package:rakna/presentation/screens/old1H.dart';
import 'package:rakna/presentation/screens/navigation_bar.dart';
import 'package:rakna/presentation/screens/onboarding_screen.dart';
import 'package:rakna/presentation/screens/parking_detail.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';
import 'package:rakna/presentation/screens/setting_screen.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';
import 'package:rakna/presentation/screens/sign_up_screen.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';
import 'package:rakna/presentation/screens/splash_screen.dart';
import 'package:rakna/team2/Payment.dart';
import 'package:rakna/presentation/screens/add_payment.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: FeaturedScreen(),
    );
  }
}
