import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';

import '../../data/data_source/remote_data_source.dart';
import 'core/utility/custom_paypal.dart';

class ParkingTimerPaypal extends StatefulWidget {
   ParkingTimerPaypal(
      {Key? key,
      required this.slotId,
      required this.hourSelected,
      required this.parkSlotName,
      required this.onSuccess,
      required this.onError,
      required this.onCancel,
      required this.services,
      required this.url,
      required this.executeUrl,
      required this.accessToken,
      required this.startDateFormat,
      required this.endDateFormat,
      })
      : super(key: key);
  final String startDateFormat;
  final String endDateFormat;
  final int hourSelected;
  final int slotId;
  final String parkSlotName;
  Function onSuccess, onCancel, onError;
  PaypalServices services;
  String url, executeUrl, accessToken;

  @override
  State<ParkingTimerPaypal> createState() => _ParkingTimerPaypalState();
}

class _ParkingTimerPaypalState extends State<ParkingTimerPaypal> with TickerProviderStateMixin {

  bool loading = true;
  bool loadingError = false;

  // complete() async {
  //   final uri = Uri.parse(widget.url);
  //   final payerID = uri.queryParameters['PayerID'];
  //   if (payerID != null) {
  //     Map params = {
  //       "payerID": payerID,
  //       "paymentId": uri.queryParameters['paymentId'],
  //       "token": uri.queryParameters['token'],
  //     };
  //     setState(() {
  //       loading = true;
  //       loadingError = false;
  //     });
  //
  //     Map resp = await widget.services
  //         .executePayment(widget.executeUrl, payerID, widget.accessToken);
  //     if (resp['error'] == false) {
  //       params['status'] = 'success';
  //       params['data'] = resp['data'];
  //       await widget.onSuccess(params);
  //       setState(() {
  //         loading = false;
  //         loadingError = false;
  //       });
  //       Navigator.pop(context);
  //     } else {
  //       if (resp['exception'] != null && resp['exception'] == true) {
  //         widget.onError({"message": resp['message']});
  //         setState(() {
  //           loading = false;
  //           loadingError = true;
  //         });
  //       } else {
  //         await widget.onError(resp['data']);
  //         Navigator.of(context).pop();
  //       }
  //     }
  //     //return NavigationDecision.prevent;
  //   } else {
  //     Navigator.of(context).pop();
  //   }
  // }


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
    print(widget.startDateFormat);
    print(widget.endDateFormat);
    ParkingRemoteDataSource().putReservationData(
      id: widget.slotId,
      parkingSlotName: widget.parkSlotName,
      startHour: widget.startDateFormat,
      endHour: widget.endDateFormat,
      isAvailable: false,
      randomNumber: '4521',
      parkForeignKey: 1,
    );
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 0, minutes: 0, hours: widget.hourSelected
        ));
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
                padding: EdgeInsets.all(8.0.r),
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
                      style: TextStyle(
                          fontSize: 27.sp, fontWeight: FontWeight.bold),
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
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 12.w,
                    top: 17.h,
                    bottom: 17.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Your Entry Code'),
                            Text('1224'), //TODO connect Api
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Parking Name'),
                            Text('Nasr City Parking'), //TODO connect Api
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Location'),
                            Text('Nasr City, Fair Square'), //TODO connect Api
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
                        padding: EdgeInsets.all(7.0.r),
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
                        padding: EdgeInsets.all(7.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Duration'),
                            Text('1 hours'), //TODO connect Api
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0.r),
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
                  widget: Text('Extend Parking Time',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  backgroundColor: Color(0xff067fd0),
                  textColor: Colors.white,
                  onPressed: () {
                    ///TODO navigation
                  },
                  radius: 5.r,
                  width: 295.w,
                  height: 43.h,
                ),
              ),
              SizedBox(
                height: 18.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
