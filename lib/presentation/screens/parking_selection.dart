import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utility/category.dart';
import '../../utility/color.dart';
import '../components/appbar.dart';
import '../components/circle_button.dart';
import '../components/search_testfield.dart';
import '../components/category_card.dart';

class ParkingSelection extends StatefulWidget {
  const ParkingSelection({Key? key}) : super(key: key);

  @override
  State<ParkingSelection> createState() => _ParkingSelectionState();
}

class _ParkingSelectionState extends State<ParkingSelection> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MiniAppBarCustom(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nearby Parking",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: CategoryCard(
                            category: Category(
                                parkingName: 'Parking Name',
                                parkingLocation: 'Parking Location',
                                parkImage: 'assets/images/park1.jpg',
                                parkPrice: '10/Hours'),
                                widthBookmark: width * .160,
                                widthPrice: width * .280,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
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
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
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
    );
  }
}
