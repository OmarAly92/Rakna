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
                padding: const EdgeInsets.only(
                    right: 15, left: 15, top: 30, bottom: 15),
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
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: .5,
                            blurRadius: 1.5,
                            offset: Offset(0, .5))
                      ]),
                  width: 45,
                  height: 45,
                  child: Center(
                    child: InkWell(
                      onTap: () {},
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

class MyCustomUI extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -5).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 120.w, right: 120.w, top: 15.w),
              child: Row(
                children: [
                  Text(
                    'Your Parking',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 60.h,)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // CustomPaint(
                  //   painter: MyPainter(),
                  //   child: Container(height: 0),
                  // ),
                  SizedBox(height: 30.h),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  cards(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: .5,
                                blurRadius: 1.5,
                                offset: Offset(0, .5))
                          ]),
                      width: 45,
                      height: 45,
                      child: Center(
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            CupertinoIcons.add,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cards() {
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0.01, _animation2.value),
        child: InkWell(
          enableFeedback: true,
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => RouteWhereYouGo(),
            //     ));
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.fromLTRB(19.w, 19.w, 19.w, 0),
            padding: EdgeInsets.all(18.w),
            // height: 100.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffEDECEA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(.1),
                  radius: 30.r,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/garage.png',
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 185.w,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Park Name Here ',
                          textScaleFactor: 1.45,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(.7),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          'Park Location',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.navigate_next_outlined)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .1, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .9, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);

    Paint paint_2 = Paint()
      ..color = Color(0xffF57752)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
