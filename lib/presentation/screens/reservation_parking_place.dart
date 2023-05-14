import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/components/custom_text_form.dart';
import 'package:rakna/presentation/screens/payment_method.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time/time.dart';
import '../components/LogButton_Widget.dart';
import 'add_payment.dart';

class ReservationParkingPlace extends StatefulWidget {
  ReservationParkingPlace({Key? key, required this.parkId}) : super(key: key);
  final int parkId;
  int hour = 1;

  @override
  State<ReservationParkingPlace> createState() =>
      _ReservationParkingPlaceState();
}

class _ReservationParkingPlaceState extends State<ReservationParkingPlace> {
   TextEditingController controller = TextEditingController();

  int startHourHours = 0;
  int startHourMinutes = 0;
  String startHour = '';
  String endHour = '';
  late DateTime today =
      DateTime.utc(2023, 1, 1, startHourHours, startHourMinutes);

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  String dateTimeFormat(
      {required int inDays,
      required int inHours,
      required inMinutes,
      required int inSeconds}) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    final String twoDigitDays = twoDigits(inDays.remainder(24));
    final hour = twoDigits(inHours);
    return "${DateTime.now().year}-${(DateTime.now().month).toString().padLeft(2, '0')}-$twoDigitDays ${hour == '00' ? '' : hour + ':'}$twoDigitMinutes:$twoDigitSeconds";
  }

  final TextEditingController _date1 = TextEditingController();
  Duration g = Duration();

  // final TextEditingController _date2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
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
                      padding: EdgeInsets.only(
                          left: 13.w, right: 13.w, top: 13.w, bottom: 13.w),
                      child: TableCalendar(
                        locale: 'en_US',
                        rowHeight: 40.r,
                        headerStyle: HeaderStyle(
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
                        selectedDayPredicate: (day) => isSameDay(day, today),
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
                                    TimeOfDay? pickTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (pickTime != null) {
                                      setState(() {
                                        _date1.text =
                                            pickTime.format(context).toString();
                                        var x = pickTime.period;
                                        startHourHours = pickTime.hour;
                                        startHourMinutes = pickTime.minute;
                                        print("$startHourHours hours");
                                        print('$startHourMinutes minutes');
                                        print(x.name);
                                        // 1900-01-01 00:00
                                        // String sDuration = "${duration.inHours}:${duration.inMinutes.remainder(60)}:${(duration.inSeconds.remainder(60))}";

                                        g = today
                                                .add((Duration(
                                                    hours: startHourHours,
                                                    minutes: startHourMinutes)))
                                                .hour
                                                .minutes +
                                            (today.add(Duration(
                                                    hours: startHourHours,
                                                    minutes: startHourMinutes)))
                                                .minute
                                                .seconds +
                                            Duration(minutes: widget.hour);
                                        print('$g');
                                        print('1900-01-01 00:00');
                                        print((dateTimeFormat(
                                                inDays: 1,
                                                inHours: startHourHours,
                                                inMinutes: startHourMinutes,
                                                inSeconds: 2)
                                            .substring(11)
                                            .substring(0, 5)));
                                        startHour = dateTimeFormat(
                                                inDays: 1,
                                                inHours: startHourHours,
                                                inMinutes: startHourMinutes,
                                                inSeconds: 2)
                                            .substring(11)
                                            .substring(0, 5);
                                        endHour = dateTimeFormat(
                                                inDays: 1,
                                                inHours: startHourHours +
                                                    widget.hour,
                                                inMinutes: startHourMinutes,
                                                inSeconds: 2)
                                            .substring(11)
                                            .substring(0, 5);
                                      });
                                    }
                                  },
                                  child: const Icon(Icons.access_time_rounded),
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
                              padding: EdgeInsets.all(7.0.r),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.hour == 1
                                              ? widget.hour = 1
                                              : widget.hour--;
                                        });
                                      },
                                      child: Icon(CupertinoIcons.minus)),
                                  Text(
                                    '${widget.hour}',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          widget.hour++;
                                        });
                                      },
                                      icon: Icon(CupertinoIcons.add)),
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
                  child: CustomTextField(controller:controller ,///todo check this later
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
                    padding: EdgeInsets.only(
                        left: 13.w, right: 13.w, top: 22.w, bottom: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Duration'),
                              Text('${widget.hour}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date'),
                              Text('${today.toString().split(' ')[0]}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Hours'),
                              Text(
                                  '${dateTimeFormat(inDays: 1, inHours: startHourHours, inMinutes: startHourMinutes, inSeconds: 2).substring(11).substring(0, 5)}  - ${dateTimeFormat(inDays: 1, inHours: startHourHours + widget.hour, inMinutes: startHourMinutes, inSeconds: 2).substring(11).substring(0, 5)}')
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey, thickness: .6),
                        Padding(
                          padding: EdgeInsets.all(7.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              print(
                                  '${dateTimeFormat(inDays: 1, inHours: startHourHours, inMinutes: startHourMinutes, inSeconds: 0)} Start Hour');
                              print(
                                  '${dateTimeFormat(inDays: 1, inHours: startHourHours + widget.hour, inMinutes: startHourMinutes, inSeconds: 0)} End Hour');
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
