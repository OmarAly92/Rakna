import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/garage_owner/sign_in_garage_owner.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';

import '../../team2/notification_screen.dart';

class SettingScreenGarageOwner extends StatefulWidget {
  SettingScreenGarageOwner({Key? key,required this.name,required this.email}) : super(key: key);
 final String name;
 final String email;

  @override
  State<SettingScreenGarageOwner> createState() => _SettingScreenGarageOwnerState();
  double bottom = 20;
}

class _SettingScreenGarageOwnerState extends State<SettingScreenGarageOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Profile',
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              SizedBox(
                height: 20.w,
              ),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 120.w,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(60.r),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(60.r),

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
                                borderRadius: BorderRadius.circular(10.r),
                                color: Color(0xff067fd0),
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
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
                    ),
                    Text('user@gmail.com',style: TextStyle(fontSize: 13.sp),)
                  ],
                ),
              ),
              SizedBox(
                height: 75.w,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 10.w),
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
                    //                 fontWeight: FontWeight.w500),
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
                    //                 fontWeight: FontWeight.w500),
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
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Notifications()));

                          },
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
                                    fontWeight: FontWeight.w500),
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
                    //             Icons.security,
                    //             color: Colors.grey,
                    //             size: 27.r,
                    //           ),
                    //           SizedBox(width: 9.w),
                    //           Text(
                    //             'Security',
                    //             style: TextStyle(
                    //                 fontSize: 16.5.sp,
                    //                 fontWeight: FontWeight.w500),
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
                                Icons.help_center_outlined,
                                color: Colors.grey,
                                size: 27.r,
                              ),
                              SizedBox(width: 9.w),
                              Text(
                                'Help',
                                style: TextStyle(
                                    fontSize: 16.5.sp,
                                    fontWeight: FontWeight.w500),
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
                    //                 fontWeight: FontWeight.w500),
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
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInOwner()));
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
      ),
    );
  }
}
