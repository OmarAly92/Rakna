import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/parking_detail2.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * .130,
            decoration: const BoxDecoration(
              color: Color(0xff144272),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(
                            Icons.settings,
                            color: Color(0xff144272),
                          ),
                        ),
                        const Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(
                            Icons.person,
                            color: Color(0xff144272),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 22, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Parking space',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff144272)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParkingSelection(),
                        ));
                  },
                  child: Row(
                    children: [
                      Text(
                        'See More',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff144272),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          color: Color(0xff144272),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 180,
                width: 400,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade400, blurRadius: .7)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abbas El-Akkad Parking',
                        style: TextStyle(
                            color: Color(0xff144272),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text('A03(1st Floor)',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 15),
                          Icon(
                            CupertinoIcons.placemark,
                            color: Color(0xff144272),
                          ),
                          Text(
                            '3.3 km',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      '10:00 AM',
                                      style: TextStyle(
                                          color: Color(0xff144272),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.circle_fill,
                                    color: Colors.blue.shade900,
                                    size: 6.5,
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 26, top: 4),
                                child: Text(
                                  '11 Apr,2023',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Icon(
                                      CupertinoIcons.circle_fill,
                                      color: Colors.orange.shade900,
                                      size: 6.5,
                                    ),
                                  ),
                                  Text(
                                    '11:00 PM',
                                    style: TextStyle(
                                        color: Color(0xff144272),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 4),
                                child: Text(
                                  '12 Apr,2023',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent.shade700,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              CupertinoIcons.arrow_counterclockwise,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                CupertinoIcons.drop_fill,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 185, top: 15),
                            child: Text(
                              'E£10/hr',
                              style: TextStyle(
                                  color: Color(0xff144272),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 22, bottom: 5),
            child: Text(
              'Previous parking',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff144272)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ParkingDetail1()));
                        },
                        child: Container(
                          height: 100,
                          width: 250,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade400, blurRadius: .8)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, right: 115, left: 4),
                                      child: Text(
                                        'Nasr City',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ),
                                    Text(
                                      '  E£',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff144272)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Text(
                                        '10',
                                        style:
                                            TextStyle(color: Color(0xff144272)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Park Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17),
                                      ),
                                      SizedBox(width: 105),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Text(
                                          'for 1hr',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(),
                                      child: Icon(
                                        Icons.local_parking,
                                        color: Color(0xff144272),
                                        size: 20,
                                      ),
                                    ),
                                    Text('15 Car Spots'),
                                    SizedBox(width: 70),
                                    Icon(
                                      Icons.location_pin,
                                      color: Color(0xff144272),
                                      size: 20,
                                    ),
                                    Text('2.1 km')
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
