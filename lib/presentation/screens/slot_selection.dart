import 'package:flutter/material.dart';

import 'add_payment.dart';
import '../../team2/Submit_Screen.dart';
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
  Color color = Color(0xff144272);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * .15,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(20),
                  bottomStart: Radius.circular(20)),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 5),
                          child: Row(
                            children: [
                              Container(
                                width: 90,
                                height: 37,
                                decoration: BoxDecoration(
                                    color: color,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(.21),
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Section A',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.77)),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 5),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Color(0xff1f2248),
                            border: Border.all(color: Colors.blue.shade800),
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                    Text(
                      'Available',
                      style: TextStyle(color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 5),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.yellow.shade800,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                    Text('Selected', style: TextStyle(color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 5),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Color(0xff1f2248),
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                    Text('Booked', style: TextStyle(color: Colors.black))
                  ],
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
                                      ),),
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
                                      )),
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
                                        color: color,
                                      ),
                                      SlotPlace(
                                        name1: 'C2-00$index',
                                        textName: '⏐',
                                        name2: 'C2-0${index + 5}',
                                        color: color,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 11, left: 35),
                                    child: Text('Exit',
                                        style: TextStyle(
                                          color: Colors.black,
                                        )),
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.only(right: 170),
                                      child: Text(
                                        '→',
                                        style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.black,
                                        ),
                                      ),),
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
                        backgroundColor: Color(0xff144272),
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BookTime(),));
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
    );
  }
}
