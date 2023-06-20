import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/utility/enums.dart';
import 'package:rakna/domain/usecase/get_parking_usecase.dart';
import 'package:rakna/presentation/screens/parking_detail.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';

import '../../core/services/services_locator.dart';
import '../../core/utility/category.dart';
import '../../core/utility/color.dart';
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
                 AppBarCustom(image:'https://cdn.wallpapersafari.com/82/10/tC7I1w.jpg',),
                Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
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
                                        builder: (context) => ParkingSelection(),
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
                        // Padding(
                        //   padding:
                        //       EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         "Previous parking",
                        //         style: Theme.of(context).textTheme.bodyLarge,
                        //       ),
                        //       TextButton(
                        //         onPressed: () {                                ///todo fix this screen
                        //
                        //           // // Navigator.push(context, CupertinoModalPopupRoute(builder: (context) => ParkingSelection()));
                        //           // Navigator.push(
                        //           //     context,
                        //           //     MaterialPageRoute(
                        //           //       builder: (context) => ParkingSelection(),
                        //           //     ));
                        //         },
                        //         child: Text(
                        //           "See All",
                        //           style: Theme.of(context)
                        //               .textTheme
                        //               .bodyMedium
                        //               ?.copyWith(color: kPrimaryColor),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // PreviousParking(),
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

// class PreviousParking extends StatelessWidget {
//   const PreviousParking({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ParkingBloc, ParkingState>(
//       builder: (context, state) {
//         switch (state.requestState) {
//           case RequestState.loading:
//             return Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 55.5),
//
//                   child: CircularProgressIndicator(),
//                 ),
//               ],
//             );
//           case RequestState.loaded:
//             return SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(
//                   state.parking.length,
//                   (index) => Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.w),
//                     child: SizedBox(
//                       // width: 300,
//                       child: CategoryCard(
//                         category: Category(
//                           parkingName: state.parking[index].parkName,
//                           parkingLocation:
//                               ' ${state.parking[index].parkLocation}',
//                           parkPrice: '${(state.parking[index].parkPrice).toString().replaceFirst('.0', '')}/Hours',
//                           nextScreen: ParkingDetail1(
//                               parkName: state.parking[index].parkName,
//                               parkLocation: state.parking[index].parkLocation,
//                               parkPrice:
//                                   state.parking[index].parkPrice,
//                               parkImage:
//                               state.parking[index].parkImage.toString(),
//                              parkId: state.parking[index].parkId,),
//                         ),
//                         widthBookmark: 60.w,
//                         widthPrice: 75.w, image: Image.memory(base64Decode(state.parking[index].parkImage)),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           case RequestState.error:
//             return Center(child: Text(state.message));
//         }
//       },
//     );
//   }
// }


class NearbyParking extends StatefulWidget {
   NearbyParking({Key? key}) : super(key: key);
 late bool bookmark = true;

  @override
  State<NearbyParking> createState() => _NearbyParkingState();
}

class _NearbyParkingState extends State<NearbyParking> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParkingBloc, ParkingState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 55.5),
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          case RequestState.loaded:
            return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    state.parking.length,
                        (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: SizedBox(
                        // width: 300,
                        child: CategoryCard(
                          category: Category(
                            parkingName: state.parking[index].parkName,
                            parkingLocation:
                            ' ${state.parking[index].parkLocation}',
                            parkPrice: '${(state.parking[index].parkPrice).toString().replaceFirst('.0', '')}/Hours',
                            nextScreen: ParkingDetail1(
                              parkName: state.parking[index].parkName,
                              parkLocation: state.parking[index].parkLocation,
                              parkPrice:
                              state.parking[index].parkPrice,
                              parkImage:
                              base64Decode(state.parking[index].parkImage), parkId: state.parking[index].parkId,),
                          ),
                          widthBookmark: 60.w,
                          widthPrice: 75.w, image: Image.memory(base64Decode(state.parking[index].parkImage),
                        ),
                        ),
                      ),
                    ),
                  ),
                ));
          case RequestState.error:
            return Center(child: Text(state.message));
        }
      },
    );
  }
}


