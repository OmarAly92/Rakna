import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/data/repository/parking_repository.dart';
import 'package:rakna/domain/repository/base_parking_repository.dart';
import 'package:rakna/presentation/screens/book_screen.dart';
import 'package:rakna/presentation/screens/dashboard.dart';
import 'package:rakna/presentation/screens/hom.dart';
import 'package:rakna/presentation/screens/home_screen.dart';
import 'package:rakna/presentation/screens/old1H.dart';
import 'package:rakna/presentation/screens/navigation_bar.dart';
import 'package:rakna/presentation/screens/onboarding_screen.dart';
import 'package:rakna/presentation/screens/parking_detail.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';
import 'package:rakna/presentation/screens/parking_timer.dart';
import 'package:rakna/presentation/screens/setting_screen.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';
import 'package:rakna/presentation/screens/sign_up_screen.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';
import 'package:rakna/presentation/screens/splash_screen.dart';
import 'package:rakna/presentation/screens/summary_screen.dart';
import 'package:rakna/team2/payment_method.dart';
import 'package:rakna/presentation/screens/add_payment.dart';
import 'package:rakna/presentation/screens/reservation_parking_place.dart';

import 'core/services/services_locator.dart';
import 'domain/usecase/get_parking_usecase.dart';

void main()async {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Poppins',
              textTheme:  TextTheme(
                titleLarge: TextStyle(
                  fontSize: 17.5.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                bodyLarge: TextStyle(
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.w500,
                ),
                bodyMedium: TextStyle(
                  fontSize: 13.5.sp,
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
            home: ReservationParkingPlace(parkId: 1),
          );
        });
  }
}
