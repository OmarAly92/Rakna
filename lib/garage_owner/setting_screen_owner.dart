import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';

import '../core/utility/color.dart';

class SettingScreenGarageOwner extends StatefulWidget {
  SettingScreenGarageOwner({Key? key}) : super(key: key);

  @override
  State<SettingScreenGarageOwner> createState() =>
      _SettingScreenGarageOwnerState();
  double bottom = 20;
  Color a = Color(0xff212C42);
}

class _SettingScreenGarageOwnerState extends State<SettingScreenGarageOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height:
                  300,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,

                    /// todo color
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Positioned(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 120.w,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(90.r),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(90.r),

                                      ///todo put avatar image
                                      child: Image.asset(
                                          'assets/images/default-avatar-profile.jpg')),
                                ),
                                Positioned(
                                  top: 85.w,
                                  left: 75.w,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 33.w,
                                      width: 33.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Colors.blue,
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5.w),
                            Text(
                              'User name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp,
                                  color: Colors.white),
                            ),
                            Text(
                              'user@gmail.com',
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.white),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text('Profile',
                      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),

                      SizedBox(
                        height: 20.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: widget.bottom),
                            //   child: InkWell(
                            //     onTap: () {},
                            //     child: SizedBox(
                            //       height: 38.w,
                            //       child: Row(
                            //         children: [
                            //           Icon(
                            //             Icons.person_outline_rounded,
                            //             color: Colors.grey,
                            //             size: 27.r,
                            //           ),
                            //           SizedBox(width: 9.w),
                            //           Text(
                            //             'Edit Profile',
                            //             style: TextStyle(
                            //                 fontSize: 16.5.sp,
                            //                 fontWeight: FontWeight.w500,
                            //                 color: widget.a),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: widget.bottom),
                            //   child: SizedBox(
                            //     height: 38.w,
                            //     child: InkWell(
                            //       onTap: () {},
                            //       child: Row(
                            //         children: [
                            //           Icon(
                            //             Icons.payment_rounded,
                            //             color: Colors.grey,
                            //             size: 27.r,
                            //           ),
                            //           SizedBox(width: 9.w),
                            //           Text(
                            //             'Payment',
                            //             style: TextStyle(
                            //                 fontSize: 16.5.sp,
                            //                 fontWeight: FontWeight.w500,
                            //                 color: widget.a),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(bottom: widget.bottom),
                              child: SizedBox(
                                height: 38.w,
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.notifications_none_outlined,
                                        color: Colors.grey,
                                        size: 27.r,
                                      ),
                                      SizedBox(width: 9.w),
                                      Text(
                                        'Notification',
                                        style: TextStyle(
                                            fontSize: 16.5.sp,
                                            fontWeight: FontWeight.w500,
                                            color: widget.a),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: widget.bottom),
                              child: SizedBox(
                                height: 38.w,
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.security,
                                        color: Colors.grey,
                                        size: 27.r,
                                      ),
                                      SizedBox(width: 9.w),
                                      Text(
                                        'Security',
                                        style: TextStyle(
                                            fontSize: 16.5.sp,
                                            fontWeight: FontWeight.w500,
                                            color: widget.a),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: widget.bottom),
                              child: SizedBox(
                                height: 38.w,
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.help_center_outlined,
                                        color: Colors.grey,
                                        size: 27.r,
                                      ),
                                      SizedBox(width: 9.w),
                                      Text(
                                        'Help',
                                        style: TextStyle(
                                            fontSize: 16.5.sp,
                                            fontWeight: FontWeight.w500,
                                            color: widget.a),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: widget.bottom),
                            //   child: SizedBox(
                            //     height: 38.w,
                            //     child: InkWell(
                            //       onTap: () {},
                            //       child: Row(
                            //         children: [
                            //           Icon(
                            //             Icons.remove_red_eye_outlined,
                            //             color: Colors.grey,
                            //             size: 27.r,
                            //           ),
                            //           SizedBox(width: 9.w),
                            //           Text(
                            //             'Dark Theme',
                            //             style: TextStyle(
                            //                 fontSize: 16.5.sp,
                            //                 fontWeight: FontWeight.w500,
                            //                 color: widget.a),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(bottom: widget.bottom),
                              child: SizedBox(
                                height: 38.w,
                                child: InkWell(
                                  onTap: () {},
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignIn(),
                                          ));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: Colors.red,
                                          size: 27.r,
                                        ),
                                        SizedBox(width: 9.w),
                                        Text(
                                          'Logout',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16.5.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
