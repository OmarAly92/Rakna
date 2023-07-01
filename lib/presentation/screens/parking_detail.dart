
import 'package:cached_memory_image/cached_image_base64_manager.dart';
import 'package:cached_memory_image/cached_image_manager.dart';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';
import '../../core/utility/error_img.dart';

class ParkingDetail extends StatefulWidget {
  const ParkingDetail({
    Key? key,
    required this.parkId,
    required this.parkName,
    required this.parkLocation,
    required this.parkPrice,
    required this.parkImage, required this.latitude, required this.longitude,
  }) : super(key: key);
  final String parkName;
  final String parkLocation;
  final num parkPrice;
  final String parkImage;
  final int parkId;
  final double latitude;
  final double longitude;

  @override
  State<ParkingDetail> createState() => _ParkingDetailState();
}

class _ParkingDetailState extends State<ParkingDetail> with TickerProviderStateMixin{
  final CachedImageManager _cachedImageManager =
      CachedImageBase64Manager.instance();

  late bool bookMark = true;


  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CachedMemoryImage(
              uniqueKey: 'app://image/1',
              errorWidget: const Text('Error'),
              base64:
                  widget.parkImage == 'string' ? errorImg : widget.parkImage,fit: BoxFit.cover,
              placeholder: const CircularProgressIndicator(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text(
                widget.parkName,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: RatingBar.builder(
                    itemSize: 20.r,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber.shade500,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                Text('(1,098)',
                    style: TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding:
                EdgeInsets.only(left: 15.w, top: 7.h, bottom: 7.h),
                child: Row(
                  children: [
                    Text(
                      'Open ',
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.green),
                    ),
                    Text(
                      '- 24 hours',
                      style: TextStyle(
                          fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(right: 15.w,top: 15.w,bottom: 0.w,left: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Column(
                  //   children: [
                  //     Container(
                  //       width: 55,
                  //       height: 55,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(50.r),
                  //         color: Colors.blue,
                  //       ),
                  //       child: Center(
                  //           child: Icon(
                  //             CupertinoIcons.calendar_badge_plus,
                  //             color: Colors.white,
                  //             size: 30.r,
                  //           )),
                  //     ),
                  //     SizedBox(height: 5.h),
                  //     Text('Book',
                  //         style: TextStyle(
                  //             color: CupertinoColors.systemGrey2)),
                  //   ],
                  // ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () =>

                            MapsLauncher.launchCoordinates(widget.latitude, widget.longitude),


                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: Colors.blue,
                          ),
                          child: Center(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 30.r,
                              )),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text('Directions',
                          style: TextStyle(
                              color: CupertinoColors.systemGrey2)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.bookmark_outlined,

                            color: Colors.white,
                            size: 30.r,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text('Save',
                          style: TextStyle(
                              color: CupertinoColors.systemGrey2)),
                    ],
                  ),
                ],
              ),
            ),
          ),





          SliverToBoxAdapter(
            child:Container(
              margin:
              EdgeInsets.fromLTRB(13.w, 19.w, 13.w, 0),
              padding: EdgeInsets.all(5.w),
              // height: 100.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffEDECEA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: 10.h),
                    child: Text('Overview',style: TextStyle(fontSize: 20.sp),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius:
                                BorderRadius.circular(20)),
                            child: Center(
                              child: Icon(
                                Icons.location_on,
                                size: 24,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Cairo , Nasr City',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.grey.shade400,
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius:
                                BorderRadius.circular(20)),
                            child: Icon(
                              Icons.phone,
                              size: 24,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Phone : 01014588890',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.grey.shade400,
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Container(
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: Colors.grey.shade200,
                  //               borderRadius:
                  //               BorderRadius.circular(20)),
                  //           child: Icon(
                  //             CupertinoIcons.search,
                  //             size: 24,
                  //             color: Colors.grey,
                  //           ),
                  //         ),
                  //         SizedBox(width: 10.w),
                  //         Text(
                  //           'Rakna.com',
                  //           style: TextStyle(fontSize: 15.sp),
                  //         ),
                  //       ],
                  //     ),
                  //     Icon(
                  //       Icons.navigate_next,
                  //       color: Colors.grey.shade400,
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),)
          ),





          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height:23.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.07),
                            offset: Offset(0, -3),
                            blurRadius: 12)
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: GoogleFonts.ptSans(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text('${widget.parkPrice} E£',
                                  style: GoogleFonts.ptSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black))
                            ],
                          )),
                      Material(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SlotSelection(
                                      parkId: widget.parkId,
                                      parkPrice: widget.parkPrice, parkName: widget.parkName, parkLocation: widget.parkLocation, latitude: widget.latitude, longitude: widget.longitude),
                                ));
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: (BoxDecoration(
                              color: Color(0xff067fd0),
                              borderRadius: BorderRadius.circular(5),
                            )),
                            child: Text(
                              'Book Now',
                              style: GoogleFonts.ptSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
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


