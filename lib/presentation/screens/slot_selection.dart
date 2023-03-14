import 'package:flutter/material.dart';

import '../../utility/color.dart';
import 'add_payment.dart';
import '../../team2/reservation_parking_place.dart';
import '../components/LogButton_Widget.dart';
import '../components/slot-place.dart';


class SlotSelection extends StatefulWidget {
  const SlotSelection({Key? key}) : super(key: key);

  @override
  State<SlotSelection> createState() => _SlotSelectionState();
}

class _SlotSelectionState extends State<SlotSelection> {
  // 0xff07193e
  int length = 7;
  bool click = false;
  Color primaryColor = Color(0xff007fff);
  Color mainColor = Colors.blue.shade900;
  Color selectedColor = Colors.blue.shade900;
  late bool tap1 = false;
  late bool tap2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.only(bottom: 20, left: 0, right: 0, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Reservation',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                              (index) => Padding(
                            padding: const EdgeInsets.only(
                                left: 3.5, right: 3.5, bottom: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 90,
                                  margin: EdgeInsets.only(
                                    bottom: 0,
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Section A',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 5),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  border:
                                  Border.all(color: Colors.blue.shade800),
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ),
                          Text(
                            'Available',
                            style: TextStyle(color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 5),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: selectedColor,
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ),
                          Text('Selected',
                              style: TextStyle(color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 5),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ),
                          Text('Booked', style: TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: SizedBox(
                        height: 520,
                        child: ListView(
                          physics: length > 8
                              ? AlwaysScrollableScrollPhysics()
                              : NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: false,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: .4,
                                          endIndent: 10,
                                          indent: 10,
                                        ),
                                      ),
                                      Text(
                                        'Entry',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                        width: 190,
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: .4,
                                          endIndent: 10,
                                          indent: 10,
                                        ),
                                      ),
                                      Text(
                                        'Entry',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: .4,
                                          endIndent: 10,
                                          indent: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(right: 213),
                                          child: Text(
                                            'C1',
                                            style: TextStyle(
                                                color: Color(0xff144272),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text(
                                          'C2',
                                          style: TextStyle(
                                              color: Color(0xff144272),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: List.generate(
                                      length,
                                          (index) => Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SlotPlace(
                                            name1: 'C1-00$index',
                                            textName: '⏐',
                                            name2: 'C1-0${index + 5}',
                                            color1: mainColor, color2: selectedColor, onTap: () {
                                            tap1 = !tap1;
                                            setState(() {});
                                          }, tap: tap1,
                                          ),
                                          SlotPlace(
                                            name1: 'C2-00$index',
                                            textName: '⏐',
                                            name2: 'C2-0${index + 5}',
                                            color1: mainColor,
                                            color2: selectedColor,
                                             tap: tap2,
                                            onTap: () {
                                              tap2 = !tap2;
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding:
                                        EdgeInsets.only(top: 11, left: 35),
                                        child: Text('Exit',
                                            style: TextStyle(
                                              color: Colors.black,
                                            )),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 170),
                                        child: Text(
                                          '→',
                                          style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 11),
                                        child: Text('Exit',
                                            style: TextStyle(
                                              color: Colors.black,
                                            )),
                                      ),
                                      Text(
                                        '→',
                                        style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 5, right: 5, top: 30),
                      child: Column(
                        children: [
                          LogButton(
                            text: 'Book',
                            backgroundColor: mainColor,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ReservationParkingPlace(),
                                  ));
                            },
                            radius: 5,
                            width: 355,
                            high: 53,
                          ),
                        ],
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


