import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/domain/usecase/get_parking_slot_usecase.dart';
import 'package:rakna/presentation/controller/get_parking_slots_bloc/parking_slots_bloc.dart';

import '../../core/services/services_locator.dart';
import '../../core/utility/enums.dart';
import 'reservation_parking_place.dart';
import '../components/LogButton_Widget.dart';
import '../components/slot-place.dart';

class SlotSelection extends StatefulWidget {
   SlotSelection({Key? key,required this.parkId,required this.parkPrice}) : super(key: key);
   int parkId;
   num parkPrice;

  @override
  State<SlotSelection> createState() => _SlotSelectionState();
}

class _SlotSelectionState extends State<SlotSelection> {

  int onSelectedIndex = -1;
  // bool click = false;
  Color primaryColor = Color(0xff007fff);
  Color mainColor = Colors.blue;
  Color selectedColor = Colors.orange.shade700;
  Color bookedColor = Color(0xff990000);
  late int slotId;
  late String parkingSlotName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ParkingSlotBloc(GetParkingSlotUseCase(sl()),widget.parkId)..add(GetParkingSlotDataEvent()),
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
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: List.generate(
                      //       1,
                      //       (index) => Padding(
                      //         padding: const EdgeInsets.only(
                      //             left: 3.5, right: 3.5, bottom: 15),
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               height: 50,
                      //                width: 350,
                      //                 decoration: BoxDecoration(
                      //                 color: mainColor,
                      //                 borderRadius: BorderRadius.circular(5),
                      //               ),
                      //               child: Center(
                      //                 child: Text(
                      //                   'Section A',
                      //                   style: TextStyle(color: Colors.white),
                      //                 ),
                      //               ),
                      //             ),
                      //             SizedBox(
                      //               width: 5,
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                                    color: bookedColor,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 195),
                                      child: CircularProgressIndicator(),
                                    ),

                                  ],
                                ),
                              );
                            case RequestState.loaded:


                              return Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 340.h,
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          children: List.generate(
                                            // 30,
                                            state.parkingSlot.length, ///todo uncomment this

                                            (index) => Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SlotPlace(
                                                  name1:
                                                  // 'c200',
                                                  state.parkingSlot[index].parkingSlotName,
                                                  textName: '⏐',
                                                  onSelectedIndex:
                                                      onSelectedIndex,
                                                  color1: mainColor,
                                                  color2: selectedColor,
                                                  onTap: () {
                                                    onSelectedIndex = index;
                                                    setState(() {});
                                                    slotId = state
                                                        .parkingSlot[index]
                                                        .slotId;
                                                    parkingSlotName = state
                                                        .parkingSlot[index]
                                                        .parkingSlotName;
                                                  },
                                                  index: index,
                                                  isAvailable:
                                                  // false
                                                  state.parkingSlot[index].isAvailable
                                                  ,
                                                  notAvailableColor:
                                                  bookedColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            case RequestState.error:
                              return Center(child: Text(state.message));
                          }
                        },
                      ),
                      SizedBox(height: 80.h),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10.h, left: 5.w, right: 5.w),
                        child: Column(
                          children: [
                            LogButton(
                              widget: Text('Book',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),
                              backgroundColor: mainColor,
                              textColor: Colors.white,
                              onPressed: () {
                                print(slotId);
                                print(parkingSlotName);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ReservationParkingPlace(
                                      slotId: slotId,
                                      parkSlotName: parkingSlotName, parkPrice: widget.parkPrice, parkForeignKey: widget.parkId,
                                    ),
                                  ),
                                );
                              },
                              radius: 5.r,
                              width: 300.w,
                              height: 48.w,
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
