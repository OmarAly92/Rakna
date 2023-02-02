import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakna/presentation/components/LogButton_Widget.dart';

class ParkingDetail extends StatefulWidget {
  const ParkingDetail({Key? key}) : super(key: key);

  @override
  State<ParkingDetail> createState() => _ParkingDetailState();
}

class _ParkingDetailState extends State<ParkingDetail> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: height * .350,
              width: double.infinity,
              child: Image.asset(
                'assets/images/park1.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 3),
                    child: Text(
                      'Parking name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Parking Location',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 190),
                child: Icon(
                  CupertinoIcons.bookmark_fill,
                  size: 40,
                  color: Colors.blue.shade800,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '2 km',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 135,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.clock_fill,
                        color: Colors.blue,
                        size: 17,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '8 AM - 10 PM',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Safe',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * .27),
          Center(
            child: Container(
              width: 350,
              height: 105,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'E£10',
                    style: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('per hour', style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Center(
                child: LogButton(
                    text: 'Book Now',
                    backgroundColor: Color(0xff1C82AD),
                    textColor: Colors.white,
                    onPressed: () {},
                    radius: 20,
                    width: 355,
                    high: 60)),
          )
        ],
      ),
    );
  }
}
