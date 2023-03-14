import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';

import '../../utility/category.dart';
import '../../utility/color.dart';
import '../../utility/dummy_parking_data.dart';
import '../components/appbar.dart';
import '../components/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppBarCustom(),
            Body(),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double height = MediaQuery.of(context).size.height;
    late double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore nearby parking",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ParkingSelection(),
                          ));
                    },
                    child: Text(
                      "See All",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: kPrimaryColor),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  2,
                      (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SizedBox(
                      // width: 300,
                      child: CategoryCard(
                        category: Category(
                          parkingName: Dummy().dummy[index].parkName,
                          parkingLocation: Dummy().dummy[index].parkLocation,
                          parkImage: Dummy().dummy[index].parkImage,
                          parkPrice: '10/Hours',
                        ),
                        widthBookmark: 60.w,
                        widthPrice: 75.w,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Previous parking",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(context, CupertinoModalPopupRoute(builder: (context) => ParkingSelection()));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ParkingSelection(),
                          ));
                    },
                    child: Text(
                      "See All",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SizedBox(
                      // width: 300,
                      child: CategoryCard(
                        category: Category(
                          parkingName: Dummy().dummy[index].parkName,
                          parkingLocation: Dummy().dummy[index].parkLocation,
                          parkImage: Dummy().dummy[index].parkImage,
                          parkPrice: '10/Hours',
                        ),
                        widthBookmark: 60.w,
                        widthPrice: 75.w,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
