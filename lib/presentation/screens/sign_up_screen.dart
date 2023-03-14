import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';

import '../../utility/color.dart';
import '../components/LogButton_Widget.dart';
import 'old1H.dart';
import 'navigation_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  // final _formKey = GlobalKey<FormState>();
  // final TextEditingController _controllerEmail = TextEditingController();
  // final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    Color color =  Colors.blue.shade800;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 105.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(top: 35.h, left: 12.w),
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 1.h,right: 5.w),
                          child: InkWell(
                            onTap: () {},
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:  Icon(
                                CupertinoIcons.arrow_left_circle_fill,
                                color: Colors.white,
                                size: 40.r,
                              ),
                            ),
                          ),
                        ),
                         Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color,
                  ),
                  child: Container(
                    height: height * .9,
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50.r))),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(
                              right: 22.w, left: 22.w, top: 30.h,
                          ),
                          child: TextFormField(
                            decoration:  InputDecoration(
                              labelText: "Email Address",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                            right: 22.w, left: 22.w, top: 30.h,
                          ),
                          child: TextFormField(
                            decoration:  InputDecoration(
                                // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: "Phone Number",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 13.sp,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                            right: 22.w, left: 22.w, top: 30.h,
                          ),
                          child: TextFormField(
                            decoration:  InputDecoration(
                                // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: "Age",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 13.sp,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                            right: 22.w, left: 22.w, top: 30.h,
                          ),
                          child: TextFormField(
                            decoration:  InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 13.sp,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                            right: 22.w, left: 22.w, top: 30.h,
                          ),
                          child: TextFormField(
                            decoration:  InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontSize: 13.sp,
                                ),
                                border: UnderlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(bottom: 8.h, top: 50.h),
                          child: LogButton(
                            text: 'Sign up',
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
                              left: 65.w, right: 65.w, top: 10.h),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn()));
                            },
                            child: Row(
                              children:  [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  ' SIGN IN',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
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
