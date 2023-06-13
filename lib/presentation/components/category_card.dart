import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utility/category.dart';
import '../../core/utility/color.dart';
import '../../core/utility/size.dart';
import '../screens/parking_detail.dart';

class CategoryCard extends StatefulWidget {
  CategoryCard(
      {Key? key,
      required this.category,
      required this.widthBookmark,
      required this.widthPrice})
      : super(key: key);
  final Category category;
  late bool bookmark = true;
  final double widthBookmark;
  final double widthPrice;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.category.nextScreen,///todo page detail
          ),
        );
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
        child: Wrap(
          children: [
            Column(

              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.category.parkImage,
                          height: kCategoryCardImageSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h, bottom: 0, left: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.category.parkingName),

                              Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: InkWell(
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.category.parkingLocation.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: widget.widthPrice,
                              ),
                              Text(
                                widget.category.parkPrice,
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
