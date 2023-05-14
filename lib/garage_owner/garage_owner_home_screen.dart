import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/garage_owner/parking_details.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';

import '../core/utility/category.dart';
import '../core/utility/color.dart';
import '../presentation/components/category_card.dart';
import '../presentation/components/search_testfield.dart';
import '../presentation/screens/navigation_bar.dart';
import 'category_card_garage_owner.dart';

class GarageOwnerHomeScreen extends StatefulWidget {
  const GarageOwnerHomeScreen({Key? key}) : super(key: key);

  @override
  State<GarageOwnerHomeScreen> createState() => _GarageOwnerHomeScreenState();

}

class _GarageOwnerHomeScreenState extends State<GarageOwnerHomeScreen> {
  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MiniAppBarCustom(),
              Padding(
                padding: const EdgeInsets.only(right: 15,left: 15,top: 30,
                bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Parking',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: CategoryCardOwner(
                            parkingName: 'Parking Name',
                            parkingLocation: 'Parking Location',
                            parkImage:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9FvFe1zRItStF3sa5SoJ6T9LihZcKSEGLdQ&usqp=CAU',
                            parkPrice: '10/Hours',
                            nextScreen: Text('sddsdd'),
                            widthCard: 0.w,
                            bookmark: true,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(color: Colors.grey,spreadRadius: .5,blurRadius: 1.5,offset: Offset(0, .5))
                    ]
                  ),
                  width: 45,
                  height: 45,
                  child: Center(
                    child: InkWell(
                      onTap: () {

                      },
                      child: Icon(
                        CupertinoIcons.add,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Your Parking",
              //         style: Theme.of(context).textTheme.bodyLarge,
              //       ),
              //       SizedBox(height: 10.h),
              //       for (int i = 0; i < 1; i++)
              //         Padding(
              //           padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              //           child: CategoryCard(
              //             category: Category(
              //                 parkingName: 'Parking Name',
              //                 parkingLocation: 'Parking Location',
              //                 parkImage:
              //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9FvFe1zRItStF3sa5SoJ6T9LihZcKSEGLdQ&usqp=CAU',
              //                 parkPrice: '10/Hours',
              //                 nextScreen: Text('sddsdd')),
              //             widthBookmark: 18.w,
              //             widthPrice: 65.w,
              //           ),
              //         ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniAppBarCustom extends StatelessWidget {
  const MiniAppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 18.h, left: 18.h, right: 18.h),
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.7],
            colors: [
              kPrimaryLight,
              kPrimaryColor,
              // Colors.blue.shade500,
              // Colors.blue.shade900,
              // Color(0xff886ff2),
              // Color(0xff144272)
            ],
          ),
        ),
        child: SearchTextField(),
      ),
    );
  }
}
