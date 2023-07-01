import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationTicket extends StatefulWidget {
  const ReservationTicket({Key? key}) : super(key: key);

  @override
  State<ReservationTicket> createState() => _ReservationTicketState();
}

class _ReservationTicketState extends State<ReservationTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Container(
      margin: EdgeInsets.fromLTRB(19.w, 100.h, 19.w, 15.h),
      padding: EdgeInsets.all(18.w),
      // height: 100.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffEDECEA),
        borderRadius: BorderRadius.circular(20),
      ),
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Park Code',style: TextStyle(fontSize: 30),),
            Text('1212',style: TextStyle(fontSize: 60)),
      ])
      ),
          Container(
              margin: EdgeInsets.fromLTRB(19.w, 0.w, 19.w, 150),
              padding: EdgeInsets.all(18.w),
              // height: 100.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffEDECEA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name',style: TextStyle(color: Colors.grey,fontSize: 12.sp)),
                            Text('Omar Aly'),
                          ],
                        ),
                        SizedBox(width: 100.w),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Duration',style: TextStyle(color: Colors.grey,fontSize: 12.sp)),
                            Text('3 Hours'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Parking Location',style: TextStyle(color: Colors.grey,fontSize: 12.sp)),
                            Text('Nasr City'),
                          ],
                        ),
                        SizedBox(width: 75.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date',style: TextStyle(color: Colors.grey,fontSize: 12.sp)),
                            Text('1 - 10 - 2010'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hours',style: TextStyle(color: Colors.grey,fontSize: 12.sp)),
                            Text('09 AM - 13 PM'),
                          ],
                        ),
                        SizedBox(width: 75.w),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone Number',style: TextStyle(color: Colors.grey,fontSize: 12.sp)),
                            Text('01012141258'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 200.w),
                    child: Column(
                      children: [
                        Text('Park Name',style: TextStyle(color: Colors.grey,fontSize: 12.sp)),
                        Text('Makkram'),
                      ],
                    ),
                  ),

                ],
              ))
        ],
      ),
    );
  }
}
