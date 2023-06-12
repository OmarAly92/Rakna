import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/presentation/screens/parking_detail.dart';
import '../../core/services/services_locator.dart';
import '../../core/utility/category.dart';
import '../../core/utility/color.dart';
import '../../core/utility/enums.dart';
import '../components/appbar.dart';
import '../components/circle_button.dart';
import '../components/search_testfield.dart';
import '../components/category_card.dart';
import '../controller/get_parking_data_bloc/get_parking_data_bloc.dart';
import '../controller/get_parking_data_bloc/get_parking_data_state.dart';

class ParkingSelection extends StatefulWidget {
  const ParkingSelection({Key? key}) : super(key: key);

  @override
  State<ParkingSelection> createState() => _ParkingSelectionState();
}

class _ParkingSelectionState extends State<ParkingSelection> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => sl<ParkingBloc>()..add(GetParkingDataEvent()),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MiniAppBarCustom(),
                BlocBuilder<ParkingBloc, ParkingState>(
                  builder: (context, state) {
                    switch (state.requestState) {
                      case RequestState.loading:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      case RequestState.loaded:
                        var item = state.parking;
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nearby Parking",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(height: 10.h),
                              for (int i = 0; i < 5; i++)
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.h, bottom: 10.h),
                                  child: CategoryCard(
                                    category: Category(
                                        parkingName: item[i].parkName,
                                        parkingLocation: item[i].parkLocation,
                                        parkImage:
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9FvFe1zRItStF3sa5SoJ6T9LihZcKSEGLdQ&usqp=CAU',
                                        parkPrice: '${item[i].parkPrice}',
                                        nextScreen: ParkingDetail1(
                                          parkName: item[i].parkName,
                                          parkLocation: item[i].parkLocation,
                                          parkPrice: item[i].parkPrice,
                                          parkImage:
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9FvFe1zRItStF3sa5SoJ6T9LihZcKSEGLdQ&usqp=CAU', parkId: state.parking[i].parkId,
                                        )),
                                    widthBookmark: 18.w,
                                    widthPrice: 65.w,
                                  ),
                                ),
                            ],
                          ),
                        );
                      case RequestState.error:
                        return Center(
                          child: Text(state.message),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MiniAppBarCustom extends StatelessWidget {
  const MiniAppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 18.h, left: 18.h, right: 18.h),
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.7],
            colors: [
              kPrimaryLight,
              kPrimaryColor,
              // Colors.blue.shade500,
              // Colors.blue.shade900,
              // Color(0xff886ff2),
              // Color(0xff144272)
            ],
          ),
        ),
        child: SearchTextField(),
      ),
    );
  }
}
