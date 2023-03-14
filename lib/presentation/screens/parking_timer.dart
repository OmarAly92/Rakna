import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/LogButton_Widget.dart';

class ParkingTimer extends StatefulWidget {
  const ParkingTimer({Key? key}) : super(key: key);

  @override
  State<ParkingTimer> createState() => _ParkingTimerState();
}

class _ParkingTimerState extends State<ParkingTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inHours % 60).toString().padLeft(2, '0')}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inHours % 60).toString().padLeft(2, '0')}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '00:00:05') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 0, minutes: 0, hours: 1));
    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.all(8.0.r),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, size: 30.r)),
                    SizedBox(width: width * .01),
                    Text(
                      'Parking Timer',
                      style: TextStyle(fontSize: 27.sp,
                      fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .02),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey.shade300,
                        value: progress,
                        strokeWidth: 6,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.isDismissed) {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => SizedBox(
                              height: 300,
                              child: CupertinoTimerPicker(
                                  initialTimerDuration: controller.duration!,
                                  onTimerDurationChanged: (time) {
                                    setState(() {
                                      controller.duration = time;
                                    });
                                  }),
                            ),
                          );
                        }
                      },
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget? child) => Text(
                          countText,
                          style: TextStyle(
                            fontSize: 60,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       IconButton(
              //           onPressed: () {
              //             if (controller.isAnimating) {
              //               controller.stop();
              //               setState(() {
              //                 isPlaying = false;
              //               });
              //             } else {
              //               setState(() {
              //                 isPlaying = true;
              //               });
              //             }
              //           },
              //           icon: Icon(
              //             isPlaying == true ? Icons.pause : Icons.play_arrow,
              //             size: 35,
              //           ),
              //       ),
              //       IconButton(
              //         onPressed: () {
              //           controller.reset();
              //           setState(() {
              //             isPlaying = false;
              //           });
              //         },
              //         icon: Icon(
              //           Icons.stop,
              //           size: 35,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                // height: 315,
                // width:350,
                margin: EdgeInsets.only(
                  bottom: 10.h,
                  top: 10.h,
                  left: 18.w,
                  right: 18.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(
                      left: 12.w, right: 12.w, top: 17.h, bottom: 17.h,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Parking Area'),
                            Text('Nasr City Parking'), //TODO connect Api
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Location'),
                            Text('Nasr City, Fair Square'), //TODO connect Api
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Vehicle'),
                            Text('Toyota Land Cru (Car plate)'),
                            //TODO connect Api
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Parking Spot'),
                            Text('1st Floor (A05)'), //TODO connect Api
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Date'),
                            Text('1 / 1 / 2023'), //TODO connect Api
                            // Text('${today.toString().split(' ')[0]}'),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Duration'),
                            Text('1 hours'), //TODO connect Api
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Hours'),
                            Text('12:00 PM - 13:00 PM'), //TODO connect Api
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 18.h),
              Center(
                child: LogButton(
                  text: 'Extend Parking Time',
                  backgroundColor: Color(0xff067fd0),
                  textColor: Colors.white,
                  onPressed: () {
                    ///TODO navigation
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
    );
  }
}
