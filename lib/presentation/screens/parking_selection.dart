import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/parking_detail2.dart';

class ParkingSelection extends StatefulWidget {
  const ParkingSelection({Key? key}) : super(key: key);

  @override
  State<ParkingSelection> createState() => _ParkingSelectionState();
}

class _ParkingSelectionState extends State<ParkingSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top:15,bottom: 15),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                ),
              ),
              for(int i = 0;i<3;i++)
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingDetail1(),));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25, left: 15, right: 15),
                  child: Container(
                    width: 400,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Container(
                            height: 105,
                            width: 105,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/park1.jpg',
                                width: 140,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Parking name',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Parking location',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Row(
                                children: [
                                  Text(
                                    'E£20',
                                    style: TextStyle(
                                        fontSize: 19,
                                        color:  Color(0xff144272),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '/1 hour',
                                    style: TextStyle(color: Colors.grey.shade700),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                    height: 33,
                                    width: 85,
                                    decoration: BoxDecoration(
                                      // color: Colors.white60,
                                      border: Border.all(
                                          color:  Color(0xff144272), width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Book Now',
                                        style: TextStyle(
                                            color:  Color(0xff144272),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
