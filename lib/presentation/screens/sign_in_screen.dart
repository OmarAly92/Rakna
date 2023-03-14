import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';
import 'package:rakna/presentation/screens/old1H.dart';
import 'package:rakna/presentation/screens/sign_up_screen.dart';

import '../../utility/color.dart';
import 'navigation_bar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late double height, width;
  Color color = const Color.fromRGBO(2, 32, 42, .82);
  // Color colors = Colors.blue.shade900.withOpacity(.82);
  @override
  Widget build(BuildContext context) {
    bool eye = true;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * .5,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50))),
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(50)),
                  child: Image.asset(
                    'assets/images/garage.png',
                    fit: BoxFit.cover,
                  )),
            ),
            Column(
              children: [
                Container(
                  width: width,
                  height: height * .5,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 170.h
                        ),
                        child: Container(
                          height: 95.h,
                          width: 105.w,
                          decoration: BoxDecoration(
                              color: Colors.yellow.shade700,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(200))),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Image.asset(
                                  'assets/images/rakna_logo.jpg')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 75.w, right: 75.w),
                        child:  Text(
                          'Welcome Back!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.8.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color,
                  ),
                  child: Container(
                    height: height * .5,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50),),),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(
                              right: 22.w, left: 22.w, top: 35.h),
                          child: TextFormField(
                            decoration:  InputDecoration(
                              labelText: "Email Address",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                              right: 22.w, left: 22.w, top: 35.h),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon:
                                  IconButton(
                                    icon: Icon(eye == true ?Icons.visibility:Icons.visibility_off),
                                    onPressed: () {
                                    eye = !eye;
                                    setState(() {});
                                  },
                                  ),
                              border: UnderlineInputBorder(),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 230.w, top: 10.h),
                          child: TextButton(
                            onPressed: () {},
                            child:   Text(
                              'Forgot Password?',
                              style: TextStyle(color: kPrimaryColor,
                              fontSize: 12.5.sp),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: LogButton(
                            text: 'Sign in',
                            backgroundColor: kPrimaryColor,
                            textColor: Colors.white,
                            radius: 15.r,
                            width: 305.w,
                            high: 50.h,
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationBarScreen(),));
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 72.w, right: 72.w, top: 10.h),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: Row(
                              children:  [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(color: Colors.black,fontSize: 12.5.sp),
                                ),
                                Text(
                                  ' SIGN UP',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.5.sp
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
