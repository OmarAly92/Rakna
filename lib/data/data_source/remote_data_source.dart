import 'package:dio/dio.dart';
import 'package:rakna/data/model/parking_model.dart';
import 'package:rakna/data/model/parking_slot_model.dart';
import 'package:rakna/data/model/user_data_model.dart';

import '../../core/local_error/exceptions.dart';

abstract class BaseRemoteDataSource {
  Future<List<ParkingModel>> getParking();

  Future<List<ParkingSlotModel>> getParkingSlot();

  Future<List<UserDataModel>> checkUserData();

  void postSignUp({
    required String userName,
    required int age,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  });
  void postReservationData({
    required String parkingSlotName,
    required String startHour,
    required String endHour,
    required bool isAvailable,
    required String randomNumber,
  });
}

class ParkingRemoteDataSource extends BaseRemoteDataSource {

  late final String reqStatus;


  @override
  Future<List<ParkingModel>> getParking() async {
    final Response response =
        await Dio().get('http://raknaapi-001-site1.ctempurl.com/Parks');
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      return List<ParkingModel>.from(
          (response.data as List).map((e) => ParkingModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<ParkingSlotModel>> getParkingSlot() async {
    final Response response = await Dio().get(
        'http://raknaapi-001-site1.ctempurl.com/ParkingSlot'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      return List<ParkingSlotModel>.from(
          (response.data as List).map((e) => ParkingSlotModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }
  @override
  void postSignUp({
    required String userName,
    required int age,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) async {
    try {
      Response response = await Dio().post(
        'http://raknaapi-001-site1.ctempurl.com/Register',
        data: {
          "userName": userName,
          "age": age,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'phoneNumber': phoneNumber,
        },
      );
      reqStatus = response.statusCode.toString();

      if (response.statusCode == 200) {
        print(response.data);
        print('Sign up successfully');
      } else {
        print('failed');
        throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
      }
    } catch (e) {
      print('$e error catch :( ');
    }
  }

  @override
  Future<List<UserDataModel>> checkUserData() async {
    final Response response = await Dio().get(
        'http://raknaapi-001-site1.ctempurl.com/Register'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      return List<UserDataModel>.from(
          (response.data as List).map((e) => UserDataModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  void postReservationData({required String parkingSlotName, required String startHour, required String endHour, required bool isAvailable, required String randomNumber})async {
    try {
      Response response = await Dio().post(
        'http://raknaapi-001-site1.ctempurl.com/ParkingSlot',
        data: {
          "parkingSlotName": parkingSlotName,
          "startHour": startHour,
          'endHour': endHour,
          'isAvailable': isAvailable,
          'randomNumber': randomNumber,
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        print('Sign up successfully');
      } else {
        print('failed');
        throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
      }
    } catch (e) {
      print('$e error catch :( ');
    }
  }
}
