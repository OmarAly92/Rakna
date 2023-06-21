import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

// import 'package:geolocator/geolocator.dart';
import 'package:rakna/core/utility/enums.dart';
import 'package:rakna/domain/entities/parking.dart';
import 'package:rakna/domain/usecase/get_parking_usecase.dart';
import 'package:rakna/presentation/screens/parking_detail.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';

import '../../core/services/location_sevices.dart';
import '../../core/services/services_locator.dart';
import '../../core/utility/category.dart';
import '../../core/utility/color.dart';
import '../../data/data_source/remote_data_source.dart';
import '../components/appbar.dart';
import '../components/category_card.dart';
import '../controller/get_parking_data_bloc/get_parking_data_bloc.dart';
import '../controller/get_parking_data_bloc/get_parking_data_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // late double height = MediaQuery.of(context).size.height;
    // late double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (context) => sl<ParkingBloc>()..add(GetParkingDataEvent()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppBarCustom(
                  image: 'https://cdn.wallpapersafari.com/82/10/tC7I1w.jpg',
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 20.w, right: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Explore nearby parking",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextButton(
                                onPressed: () {
                                  ///todo fix this screen
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ParkingSelection(),
                                      ));
                                },
                                child: Text(
                                  "See All",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        NearbyParking(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NearbyParking extends StatefulWidget {
  NearbyParking({Key? key}) : super(key: key);
  late bool bookmark = true;

  @override
  State<NearbyParking> createState() => _NearbyParkingState();
}

class _NearbyParkingState extends State<NearbyParking> {
  double calculateDistance(
      {required lat1, required lon1, required lat2, required lon2}) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  late LatLng myLocations = LatLng(30.085942552537484, 31.287274807691574);

  Future<void> _getMyLocation() async {
    LocationData myLocation = await LocationServices().getLocation();
    myLocations = LatLng(myLocation.latitude!, myLocation.longitude!);
  }

  @override
  void initState() {
    super.initState();
    _getMyLocation();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Parking>>(
      stream: Stream.periodic(Duration(seconds: 30))
          .asyncMap((_) => ParkingRemoteDataSource().getParking()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData) {
          return const CircularProgressIndicator(color: Colors.blue);
        }
        _getMyLocation();
        final parkingList = snapshot.data!;
        final nearestDistanceList = List<Parking>.from(parkingList);
        nearestDistanceList.sort(
          (a, b) => calculateDistance(
            lat1: myLocations.latitude,
            lon1: myLocations.longitude,
            lat2: a.latitude,
            lon2: a.longitude,
          ).compareTo(
            calculateDistance(
              lat1: myLocations.latitude,
              lon1: myLocations.longitude,
              lat2: b.latitude,
              lon2: b.longitude,
            ),
          ),
        );

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(nearestDistanceList.length, (index) {
            return InkWell(
              enableFeedback: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ParkingDetail1(
                          parkId: nearestDistanceList[index].parkId,
                          parkName: nearestDistanceList[index].parkName,
                          parkLocation: nearestDistanceList[index].parkLocation,
                          parkPrice: nearestDistanceList[index].parkPrice,
                          parkImage: nearestDistanceList[index].parkImage)),
                );
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.fromLTRB(19.w, 5.w, 19.w, 0),
                padding: EdgeInsets.all(20.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffEDECEA),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.withOpacity(.1),
                      radius: 30.r,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.memory(
                            base64Decode(nearestDistanceList[index].parkImage),
// '',
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(width: 15.w),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 150.w,
                      child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160.w,
                            child: Text(
                              nearestDistanceList[index].parkName,
                              textScaleFactor: 1.45,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.7),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              nearestDistanceList[index].parkLocation,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(.8),
                              ),
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
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.bookmark))),
                          SizedBox(height: 20.h),
                          Text(
                            '${nearestDistanceList[index].parkPrice.toString().replaceAll('.0', '')}/Hr',
                            style: TextStyle(fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
        );
      },
    );
  }
}
