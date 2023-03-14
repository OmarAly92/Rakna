import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/components/custom_text_form.dart';
import 'package:rakna/team2/payment_method.dart';
import 'package:table_calendar/table_calendar.dart';
import '../presentation/components/LogButton_Widget.dart';
import '../presentation/screens/add_payment.dart';

class ReservationParkingPlace extends StatefulWidget {
  const ReservationParkingPlace({Key? key}) : super(key: key);

  @override
  State<ReservationParkingPlace> createState() =>
      _ReservationParkingPlaceState();
}

class _ReservationParkingPlaceState extends State<ReservationParkingPlace> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  final TextEditingController _date1 = TextEditingController();

  // final TextEditingController _date2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int hours = 1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 20,
                // ),
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

                Center(
                  child: Container(
                    // width: 380.w,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding:  EdgeInsets.only(
                          left: 13.w, right: 13.w, top: 13.w, bottom: 13.w),
                      child: TableCalendar(
                        locale: 'en_US',
                        rowHeight: 40.r,
                        headerStyle:  HeaderStyle(
                            formatButtonVisible: false,
                            rightChevronVisible: false,
                            leftChevronVisible: false,
                            headerMargin: EdgeInsets.only(left: 5.w)),
                        // daysOfWeekVisible: false,
                        startingDayOfWeek: StartingDayOfWeek.wednesday,
                        calendarStyle: CalendarStyle(
                            selectedDecoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20.r))),
                        headerVisible: true,
                        availableGestures: AvailableGestures.all,
                        selectedDayPredicate: (day) =>
                            isSameDay(day, today),
                        focusedDay: today,
                        firstDay: DateTime.utc(2023, 1, 1),
                        lastDay: DateTime.utc(2030, 3, 14),
                      ),
                    ),
                  ),
                ),
                // Text('${today.toString().split(' ')[0]}'),
                SizedBox(
                  height: 7.h,
                ), //todo hi up
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Start Hour',
                            style: TextStyle(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 50.h,
                            margin: EdgeInsets.only(
                              bottom: 0,
                              top: 7.h,
                              left: 0,
                              right: 0,
                            ),
                            child: TextFormField(
                              controller: _date1,
                              decoration: InputDecoration(
                                hintText: '12:00 AM',
                                fillColor: Colors.grey[290],
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: InkWell(
                                  borderRadius: BorderRadius.circular(10.r),
                                  onTap: () async {
                                    TimeOfDay? pickTime =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                    if (pickTime != null) {
                                      setState(() {
                                        _date1.text = pickTime
                                            .format(context)
                                            .toString();
                                      });
                                    }
                                  },
                                  child: Icon(Icons.access_time_rounded),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Hours',
                            style: TextStyle(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 50.h,
                            margin: EdgeInsets.only(
                              bottom: 0,
                              top: 7.h,
                              left: 0,
                              right: 0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(7.0.r),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          hours -= 1;
                                          print(
                                              '$hours  sadfasdasdsadsadsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                                        });
                                      },
                                      child: Icon(CupertinoIcons.minus)),
                                  Text(
                                    hours.toString(),
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          hours += 1;
                                          print(
                                              '$hours  sadfasdasdsadsadsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                                        });
                                      },
                                      child: Icon(CupertinoIcons.add)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 0,
                    top: 14.h,
                    left: 0,
                    right: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: CustomTextField(
                    hintText: 'Coupon',
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 0,
                    topPadding: 0,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                    bottom: 0,
                    top: 14.h,
                    left: 0,
                    right: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(
                        left: 13.w, right: 13.w, top: 22.w, bottom: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Duration'),
                              Text('3 hours'),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date'),
                              Text('${today.toString().split(' ')[0]}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Hours'),
                              Text('12:00 PM - 15:00 PM'),
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey, thickness: .6),
                        Padding(
                          padding:  EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Amount'),
                              Text('E£30.00'),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Center(
                          child: LogButton(
                            text: 'Next',
                            backgroundColor: Color(0xff067fd0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentMethod(),
                                ),
                              );
                            },
                            radius: 5.r,
                            width: 295.w,
                            high: 43.h,
                          ),
                        ),
                      ],
                    ),
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
