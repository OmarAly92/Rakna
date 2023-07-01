import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';
import 'package:rakna/presentation/screens/parking_timer.dart';
import 'package:rakna/presentation/screens/reservation_ticket_screen.dart';

import '../../data/model/park_state_model.dart';

class BookingState extends StatefulWidget {
  const BookingState({Key? key}) : super(key: key);

  @override
  State<BookingState> createState() => _BookingStateState();
}

class _BookingStateState extends State<BookingState>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
                unselectedLabelColor: Colors.black,
                controller: tabController,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 23.w),
                tabs: [
                  SizedBox(
                      height: 50.h,
                      child: Center(
                          child: Text(
                        'Ongoing',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ))),
                  SizedBox(
                      height: 50.h,
                      child: Center(
                          child: Text('Completed',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.black)))),
                  SizedBox(
                      height: 50.h,
                      child: Center(
                          child: Text('Canceled',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.black)))),
                ]),
            Expanded(
                child: TabBarView(controller: tabController, children: [
              Ongoing(),
              Completed(),
              Canceled(),
            ])),
          ],
        ),
      ),
    );
  }
}

class Ongoing extends StatefulWidget {
  const Ongoing({Key? key}) : super(key: key);

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<ParkStateModel>>(
              future: ParkingRemoteDataSource().parkSateApis(),
              builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child:  CircularProgressIndicator());
              }else if(snapshot.hasData){
                return Column(
                  children: List.generate(snapshot.data!.length, (index) =>
                    Container(
                      margin: EdgeInsets.fromLTRB(19.w, 10.w, 19.w, 15.h),
                      padding: EdgeInsets.all(18.w),
                      // height: 100.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffEDECEA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 70.w,
                                height: 60.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(19.r),
                                  child: Image.asset('assets/images/garage.png',
                                      height: 200.h, width: 200.w, fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                width: 150.w,

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 2.5.h),
                                      width: 160.w,
                                      child: Text(
                                        snapshot.data![index].parkName,
                                        textScaleFactor: 1.45,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(.7),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 2.5.h),
                                      width: 180,
                                      child: Text(
                                        snapshot.data![index].location,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2.5.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('E£${ snapshot.data![index].parkPrice}',
                                              style: TextStyle(fontSize: 14.sp)),
                                          Text(' / ${ snapshot.data![index].reservationDuration} Hours',
                                              style: TextStyle(fontSize: 9.sp)),
                                          Container(
                                            margin: EdgeInsets.only(left: 10.w),
                                            height: 18.h,
                                            width: 55.w,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.circular(5.r)),
                                            child: Center(
                                              child: Text(
                                                'Now Active',
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 9.sp),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Text(''),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          const Divider(color: Colors.grey),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              LogButton(
                                  borderColor: Colors.blue,
                                  widget: const Text(
                                    'View Timer',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  backgroundColor: Colors.white,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    if(snapshot.data![index].isCash == true){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingTimer(slotId: snapshot.data![index]., hourSelected: snapshot.data![index].reservationDuration, parkSlotName: snapshot.data![index].parkSlotName, randomNumber: snapshot.data![index]., parkName: snapshot.data![index].parkName, parkLocation: snapshot.data![index].location, reservationDate: snapshot.data![index].startHour, startDateFormat: snapshot.data![index].startHour, endDateFormat: snapshot.data![index].endHour, latitude: snapshot.data![index]., longitude: snapshot.data![index]., combinedEndDateFormat: DateTime.parse(snapshot.data![index].endHour))));
                                    }
                                  },
                                  radius: 20.r,
                                  width: 275.w,
                                  height: 35.h),
                              // LogButton(
                              //     borderColor: Colors.transparent,
                              //     widget: const Text('View Ticket'),
                              //     backgroundColor: Colors.blue,
                              //     textColor: Colors.white,
                              //     onPressed: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) => ReservationTicket()));
                              //     },
                              //     radius: 20.r,
                              //     width: 120.w,
                              //     height: 35.h),
                            ],
                          ),
                          SizedBox(height: 5,)
                        ],
                      )
                    ),
                  )
                );
              }else{
                return Center(child: Text('error'));
              }
            },)
          ],
        ),
      ),
    );
  }
}

class Completed extends StatefulWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

      FutureBuilder<List<ParkStateModel>>(
        future: ParkingRemoteDataSource().parkSateApis(),
        builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child:  CircularProgressIndicator());
      }else if(snapshot.hasData){
        return  Column(
            children: List.generate(snapshot.data!.length, (index) => Container(
          margin: EdgeInsets.fromLTRB(19.w, 19.w, 19.w, 0),
          padding: EdgeInsets.all(18.w),
          // height: 100.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffEDECEA),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70.w,
                    height: 60.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(19.r),
                      child: Image.asset('assets/images/garage.png',
                          height: 200, width: 200, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: 150.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5.h),
                          width: 160.w,
                          child: Text(
                            snapshot.data![index].parkName,
                            textScaleFactor: 1.45,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(.7),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5.h),
                          width: 180,
                          child: Text(
                            snapshot.data![index].location,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(.8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(snapshot.data![index].parkPrice.toString(),
                                  style: TextStyle(fontSize: 14.sp)),
                              Text(' / ${snapshot.data![index].reservationDuration} Hours',
                                  style: TextStyle(fontSize: 9.sp)),
                              Container(
                                margin: EdgeInsets.only(left: 10.w),
                                height: 18.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(
                                        color: CupertinoColors.activeGreen)),
                                child: Center(
                                  child: Text(
                                    'Completed',
                                    style: TextStyle(
                                        color: CupertinoColors.activeGreen,
                                        fontSize: 9.sp),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Text(''),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              const Divider(color: Colors.grey),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LogButton(
                      borderColor: Colors.blue,
                      widget: const Text(
                        'View Ticket',
                        style: TextStyle(color: Colors.blue),
                      ),
                      backgroundColor: Colors.white,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservationTicket()));
                      },
                      radius: 20.r,
                      width: 275.w,
                      height: 35.h),
                ],
              )
            ],
          ),
        ),));
      }else{
    return Center(child: Text('error'));
    }
          },)

        ],
      ),
    );
  }
}

///todo do req in the cancel

class Canceled extends StatefulWidget {///todo do req in the cancel

  const Canceled({Key? key}) : super(key: key);

  @override
  State<Canceled> createState() => _CanceledState();
}

class _CanceledState extends State<Canceled> {///todo do req in the cancel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(19.w, 19.w, 19.w, 0),
            padding: EdgeInsets.all(18.w),
            // height: 100.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffEDECEA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 65.w,
                      height: 56.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19.r),
                        child: Image.asset('assets/images/garage.png',
                            height: 200, width: 200, fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 150.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2.5.h),
                            width: 160.w,
                            child: Text(
                              'Rakna',
                              textScaleFactor: 1.45,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.7),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2.5.h),
                            width: 180,
                            child: Text(
                              'Nasr City',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(.8),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('E£10',
                                    style: TextStyle(fontSize: 14.sp)),
                                Text(' / 1 Hours',
                                    style: TextStyle(fontSize: 9.sp)),
                                Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  height: 18.h,
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.r),
                                      border: Border.all(
                                          color:
                                              CupertinoColors.destructiveRed)),
                                  child: Center(
                                    child: Text(
                                      'Canceled',
                                      style: TextStyle(
                                          color: CupertinoColors.destructiveRed,
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Text(''),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
