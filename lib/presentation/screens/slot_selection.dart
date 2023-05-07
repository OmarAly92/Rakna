import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/controller/get_parking_slots_bloc/parking_slots_bloc.dart';

import '../../core/services/services_locator.dart';
import '../../core/utility/enums.dart';
import 'add_payment.dart';
import 'reservation_parking_place.dart';
import '../components/LogButton_Widget.dart';
import '../components/slot-place.dart';

class SlotSelection extends StatefulWidget {
  const SlotSelection({Key? key}) : super(key: key);

  @override
  State<SlotSelection> createState() => _SlotSelectionState();
}

class _SlotSelectionState extends State<SlotSelection> {
  // 0xff07193e
  int length = 5;
  int onSelectedIndex = -1;
  bool click = false;
  Color primaryColor = Color(0xff007fff);
  Color mainColor = Colors.blue.shade900;
  Color selectedColor = Color(0xff203354);
  late bool tap1 = false;
  late bool tap2 = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ParkingSlotBloc>()..add(GetParkingSlotDataEvent()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.only(bottom: 20.w, left: 3.w, right: 3.w, top: 10.w),
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
                        size: 28.r,
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
                  height: 15.w,
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
                                      color: mainColor,
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
                        padding: EdgeInsets.only(
                            bottom: 5.h, left: 10.w, right: 10.w, top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 0, right: 5.w),
                              child: Container(
                                height: 18.w,
                                width: 18.w,
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            ),
                            Text(
                              'Available',
                              style: TextStyle(color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25.w, right: 5.w),
                              child: Container(
                                height: 18.w,
                                width: 18.w,
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            ),
                            Text('Selected',
                                style: TextStyle(color: Colors.black)),
                            Padding(
                              padding: EdgeInsets.only(left: 25.w, right: 5.w),
                              child: Container(
                                height: 18.w,
                                width: 18.w,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade600,
                                    borderRadius: BorderRadius.circular(2.r)),
                              ),
                            ),
                            Text('Booked',
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      BlocBuilder<ParkingSlotBloc, ParkingSlotState>(
                        builder: (context, state) {
                          switch (state.requestState) {
                            case RequestState.loading:
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            case RequestState.loaded:
                              return Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      // Row(
                                      //   children: [
                                      //     const SizedBox(
                                      //       height: 20,
                                      //       width: 100,
                                      //       child: Divider(
                                      //         color: Colors.black,
                                      //         thickness: .4,
                                      //         endIndent: 10,
                                      //         indent: 10,
                                      //       ),
                                      //     ),
                                      //     Text(
                                      //       'Entry',
                                      //       style: TextStyle(
                                      //           color: Colors.grey.shade600,
                                      //           fontSize: 15,
                                      //           fontWeight: FontWeight.w500),
                                      //     ),
                                      //     const SizedBox(
                                      //       height: 20,
                                      //       width: 190,
                                      //       child: Divider(
                                      //         color: Colors.black,
                                      //         thickness: .4,
                                      //         endIndent: 10,
                                      //         indent: 10,
                                      //       ),
                                      //     ),
                                      //     Text(
                                      //       'Entry',
                                      //       style: TextStyle(
                                      //           color: Colors.grey.shade600,
                                      //           fontSize: 15,
                                      //           fontWeight: FontWeight.w500),
                                      //     ),
                                      //     const SizedBox(
                                      //       height: 20,
                                      //       width: 100,
                                      //       child: Divider(
                                      //         color: Colors.black,
                                      //         thickness: .4,
                                      //         endIndent: 10,
                                      //         indent: 10,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 5),
                                      //   child: Row(
                                      //     children: [
                                      //       Padding(
                                      //         padding:
                                      //             const EdgeInsets.only(right: 213),
                                      //         child: Text(
                                      //           'C1',
                                      //           style: TextStyle(
                                      //               color: Color(0xff144272),
                                      //               fontSize: 15,
                                      //               fontWeight: FontWeight.w500),
                                      //         ),
                                      //       ),
                                      //       Text(
                                      //         'C2',
                                      //         style: TextStyle(
                                      //             color: Color(0xff144272),
                                      //             fontSize: 15,
                                      //             fontWeight: FontWeight.w500),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 425,
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          children: List.generate(
                                            100,
                                            (index) => Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SlotPlace(
                                                  name1: state
                                                      .parkingSlot[index]
                                                      .slotName,
                                                  textName: '⏐',
                                                  onSelectedIndex:
                                                      onSelectedIndex,
                                                  color1: mainColor,
                                                  color2: selectedColor,
                                                  onTap: () {
                                                    onSelectedIndex = index;
                                                    setState(() {});
                                                  },
                                                  index: index,
                                                  isAvailable: state
                                                      .parkingSlot[index]
                                                      .available,
                                                  notAvailableColor:
                                                      Colors.blueGrey.shade600,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     const Padding(
                                      //       padding:
                                      //           EdgeInsets.only(top: 11, left: 35),
                                      //       child: Text('Exit',
                                      //           style: TextStyle(
                                      //             color: Colors.black,
                                      //           )),
                                      //     ),
                                      //     const Padding(
                                      //       padding: EdgeInsets.only(right: 170),
                                      //       child: Text(
                                      //         '→',
                                      //         style: TextStyle(
                                      //           fontSize: 32,
                                      //           color: Colors.black,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     const Padding(
                                      //       padding: EdgeInsets.only(top: 11),
                                      //       child: Text('Exit',
                                      //           style: TextStyle(
                                      //             color: Colors.black,
                                      //           )),
                                      //     ),
                                      //     Text(
                                      //       '→',
                                      //       style: TextStyle(
                                      //         fontSize: 32,
                                      //         color: Colors.black,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            case RequestState.error:
                              return Center(child: Text(state.message));
                          }
                        },
                      ),
                      SizedBox(height: 60.h),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10.h, left: 5.w, right: 5.w),
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
                                        ReservationParkingPlace(
                                      parkId: onSelectedIndex,
                                    ),
                                  ),
                                );
                              },
                              radius: 5.r,
                              width: 300.w,
                              high: 48.w,
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
      ),
    );
  }
}
