import 'package:flutter/material.dart';

import '../../utility/category.dart';
import '../../utility/color.dart';
import '../../utility/size.dart';
import '../screens/parking_detail.dart';

class CategoryCard extends StatefulWidget {
  CategoryCard({
    Key? key,
    required this.category,required this.widthBookmark,required this.widthPrice
  }) : super(key: key);
  final Category category;
  late bool bookmark = true;
  double widthBookmark;
  double widthPrice;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    late double height = MediaQuery.of(context).size.height;
    late double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingDetail1(),));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget.category.parkImage,
                      height: kCategoryCardImageSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 0, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(widget.category.parkingName),
                          SizedBox(
                            width: widget.widthBookmark,//TODO add custom
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  widget.bookmark = !widget.bookmark;
                                });
                              },
                              child: Icon(
                                widget.bookmark == true
                                    ? Icons.bookmark_add_outlined
                                    : Icons.bookmark_added,
                                color: kPrimaryColor,
                              ))
                        ],
                      ),
                      Text(
                        "${widget.category.parkingLocation.toString()}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: height * .07,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: widget.widthPrice),//TODO add custom
                        child: Text(
                          'E£10/Hours',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      )
                    ],
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