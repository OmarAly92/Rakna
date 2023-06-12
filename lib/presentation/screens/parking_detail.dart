import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';
import '../../core/utility/color.dart';

class ParkingDetail1 extends StatefulWidget {
   ParkingDetail1({
    Key? key,
     required this.parkId,
     required this.parkName,
    required this.parkLocation,
    required this.parkPrice,
    required this.parkImage,
  }) : super(key: key);
  String parkName;
  String parkLocation;
  num parkPrice;
  String parkImage;
  int parkId;

  @override
  State<ParkingDetail1> createState() => _ParkingDetail1State();
}

class _ParkingDetail1State extends State<ParkingDetail1> {
  late bool bookMark = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Stack(
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.parkImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned(
          //   left: 13,
          //   top: -40 + MediaQuery.of(context).padding.top,
          //   child: ClipOval(
          //     child: Container(
          //       height: 42,
          //       width: 42,
          //       decoration: BoxDecoration(color: Colors.white, boxShadow: [
          //         BoxShadow(
          //             color: Colors.black.withOpacity(0.25),
          //             offset: Offset(0, 4))
          //       ]),
          //       child: Center(
          //         child: InkWell(
          //           onTap: () {
          //             Navigator.pop(context);
          //           },
          //           child: Icon(Icons.arrow_back),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(0, -4),
                        blurRadius: 8)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.parkName,
                            style:TextStyle(fontWeight: FontWeight.bold,fontSize: 35),


                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              bookMark = !bookMark;
                            });
                          },
                          child: Icon(
                            bookMark == true
                                ? Icons.bookmark_add_outlined
                                : Icons.bookmark_added,
                            color: kPrimaryColor,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Text(
                      widget.parkLocation,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ), Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: Row(
                        children: [
                          Text(
                            'Open: ',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                          Text(
                            '24/7',
                            style: TextStyle(fontSize: 16,),
                          ),
                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Row(children: [
                      Icon(
                        Icons.phone,
                        size: 24,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8), // Adjust the spacing between the icon and text
                      Text(
                        'Phone: 01234567890',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],




                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Row(children: [
                      Icon(
                        Icons.location_on,
                        size: 24,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8), // Adjust the spacing between the icon and text
                      Text(
                        'Cairo,Madint Nasr',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],




                    ),
                  ),

                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(top: 20, left: 30, right: 30),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         'IDR:25,000.00',
                  //         style: GoogleFonts.ptSans(
                  //             fontSize: 20, fontWeight: FontWeight.bold),
                  //       ),
                  //       SizedBox(
                  //         width: 10,
                  //       ),
                  //       Text(
                  //         '/ 1kg',
                  //         style: GoogleFonts.ptSans(fontSize: 20),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 15,
                  //     left: 30,
                  //     right: 30,
                  //   ),
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 4, horizontal: 8),
                  //     decoration: BoxDecoration(
                  //         color: Color.fromRGBO(63, 200, 101, 1),
                  //         borderRadius: BorderRadius.circular(5)),
                  //     child: Text(
                  //       'Shipped directly from farmers',
                  //       style: GoogleFonts.ptSans(
                  //           color: Colors.white, fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: height * .195,
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
                                    builder: (context) => SlotSelection(parkId: widget.parkId, parkPrice: widget.parkPrice),

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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
