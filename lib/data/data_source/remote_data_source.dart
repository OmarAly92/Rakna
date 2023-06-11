import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rakna/data/model/parking_model.dart';
import 'package:rakna/data/model/parking_slot_model.dart';
import 'package:rakna/data/model/user_data_model.dart';
import 'package:http/http.dart' as http;

import '../../core/local_error/exceptions.dart';

abstract class BaseRemoteDataSource {
  Future<List<ParkingModel>> getParking();

  Future<List<ParkingSlotModel>> getParkingSlot(int parkId);

  Future<List<UserDataModel>> checkUserData();

  void postSignUp({
    required String userName,
    required int age,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  });

  void putReservationData({
    required int id,
    required String parkingSlotName,
    required String startHour,
    required String endHour,
    required bool isAvailable,
    required String randomNumber,
    required int parkForeignKey,

  });
}

class ParkingRemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<ParkingModel>> getParking() async {
    final Response response =
        await Dio().get('http://raknaapi-001-site1.ctempurl.com/Parks');
    print('${response.statusCode}');
    print('${response.data}');
    if (response.statusCode == 200) {
      return List<ParkingModel>.from(
          (response.data as List).map((e) => ParkingModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<ParkingSlotModel>> getParkingSlot(int parkId) async {
    final Response response = await Dio().get(
        'http://raknaapi-001-site1.ctempurl.com/ParkingSlot/$parkId'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      return List<ParkingSlotModel>.from(
          (response.data as List).map((e) => ParkingSlotModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
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
  void postSignUp({
    required String userName,
    required int age,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) async {
    var body = jsonEncode({
      "userName": userName,
      'phoneNumber': phoneNumber,
      'password': password,
      'email': email,
      "age": age.toString(),
      'confirmPassword': confirmPassword,
    });

    try {
      http.Response response = await http.post(
          Uri.parse('http://raknaapi-001-site1.ctempurl.com/Register'),
          body: body,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
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
  void putReservationData(
      {required int id,
      required String parkingSlotName,
      required String startHour,
      required String endHour,
      required bool isAvailable,
      required String randomNumber,
        required int parkForeignKey,
}) async {
    var body = {
      'id':id,
      "parkingSlotName": parkingSlotName,
      "startHour": startHour,
      'endHour': endHour,
      'isAvailable': isAvailable,
      'randomNumber': randomNumber,
      'parkForiegnKey': parkForeignKey,
    };

    try {
      http.Response response = await http.put(
          Uri.parse('http://raknaapi-001-site1.ctempurl.com/ParkingSlot/$id'),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }).then((dynamic res) {
        print(res.toString());
        return res;
      });
      print(response.statusCode);
    } catch (e) {
      print('$e error catch :( ');
    }
  }
}
