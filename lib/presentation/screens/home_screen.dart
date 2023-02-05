import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';

import '../../utility/category.dart';
import '../../utility/color.dart';
import '../components/appbar.dart';
import '../components/category_card.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children:  [
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
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore nearby parking",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingSelection(),));
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
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: 300,
                  child: CategoryCard(
                    category: Category(
                        parkingName: 'Parking name',
                        parkingLocation: 'Parking location',
                        parkImage: 'assets/images/park1.jpg',
                        parkPrice: '10/Hours'), widthBookmark: width * .053, widthPrice: width * .17,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    width: 300,
                    child: CategoryCard(
                      category: Category(
                          parkingName: 'Parking name',
                          parkingLocation: 'Parking location',
                          parkImage: 'assets/images/park1.jpg',
                          parkPrice: '10/Hours'), widthBookmark: width * .053, widthPrice: width * .17,
                    ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}



