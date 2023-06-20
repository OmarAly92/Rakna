import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rakna/data/model/parking_model.dart';
import 'package:rakna/data/model/parking_slot_model.dart';
import 'package:rakna/data/model/user_data_model.dart';
import 'package:http/http.dart' as http;

import '../../core/local_error/exceptions.dart';
import '../model/garage_owner_data_model.dart';
import '../model/garage_owner_parking_data_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<ParkingModel>> getParking();

  Future<void> getBookMark();

  Future<List<GarageOwnerParkingModel>> getParkingGarageOwner(int garageOwnerId);

  Future<List<ParkingModel>> getSearchResult(String? query);

  Future<List<ParkingSlotModel>> getParkingSlot(int parkId);

  Stream<List<ParkingSlotModel>> getParkingSlot1(int parkId);

  Future<List<UserDataModel>> checkUserData();

  Future<List<GarageOwnerDataModel>> checkGarageOwnerData();

  void postSignUp({required String userName, required int age, required String email, required String password, required String confirmPassword, required String phoneNumber,});

  void postPark({required String parkName, required String parkLocation, required String parkImage, required double parkPrice, required int garageOwnerId});

  void putPark({required int parkId,required String parkName, required String parkLocation, required String parkImage, required double parkPrice,required double parkRating, required int garageOwnerId});

  void putReservationData({required int id, required String parkingSlotName, required String startHour, required String endHour, required bool isAvailable, required String randomNumber, required int parkForeignKey,});

  void postReservationData({required String parkingSlotName, required int parkForeignKey});

  void postBookMark({required bool isFavorite, required int userId,required int parkId,});

  void deleteReservationData({required int parkSlotId});


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
      print('${response.statusCode}');
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
  void putReservationData({
    required int id,
    required String parkingSlotName,
    required String startHour,
    required String endHour,
    required bool isAvailable,
    required String randomNumber,
    required int parkForeignKey,
  }) async {
    var body = {
      'id': id,
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

  @override
  Future<List<ParkingModel>> getSearchResult(String? query) async {
    final Response response =
        await Dio().get('http://raknaapi-001-site1.ctempurl.com/Parks');
    if (response.statusCode == 200) {
      var result = List<ParkingModel>.from(
          (response.data as List).map((e) => ParkingModel.fromJson(e)));

      if (query != null) {
        var x = result
            .where((element) =>
                element.parkName.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return x;
      } else {
        return result;
      }
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<GarageOwnerDataModel>> checkGarageOwnerData() async {
    final Response response = await Dio().get(
        'http://raknaapi-001-site1.ctempurl.com/GarageOwner'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      print('${response.data}');
      return List<GarageOwnerDataModel>.from(
          (response.data as List).map((e) => GarageOwnerDataModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<GarageOwnerParkingModel>> getParkingGarageOwner(int garageOwnerId) async{
    final Response response =
        await Dio().get('http://raknaapi-001-site1.ctempurl.com/GarageOwner/$garageOwnerId');
    print('${response.statusCode}');
    print('${response.data}');
    if (response.statusCode == 200) {
      return List<GarageOwnerParkingModel>.from(
          (response.data as List).map((e) => GarageOwnerParkingModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  void postPark({required String parkName, required String parkLocation, required double parkPrice, required int garageOwnerId,required String parkImage})async {
    var body = {
      "parkName": parkName,
      "parkLocation": parkLocation,
      "parkImage": parkImage,
      'parkPrice': parkPrice,
      'garageForiegnKey':garageOwnerId
    };

    try {
      http.Response response = await http.post(
          Uri.parse('http://raknaapi-001-site1.ctempurl.com/Parks'),
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

  @override
  void postReservationData({required String parkingSlotName, required int parkForeignKey})async {
    var body = {
      "id": 0,
      "parkingSlotName": parkingSlotName,
      "startHour": '2023-06-14T18:33:00',
      'endHour': '2023-06-14T18:33:00',
      'isAvailable': true,
      "numberOfSlots": 1,
      "numberOfSections": 1,
      'randomNumber': '1231',
      'parkForiegnKey': parkForeignKey,
    };

    try {
      http.Response response = await http.post(
          Uri.parse('http://raknaapi-001-site1.ctempurl.com/ParkingSlot'),
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

  @override
  void deleteReservationData({required int parkSlotId})async {


    try {
      http.Response response = await http.delete(
          Uri.parse('http://raknaapi-001-site1.ctempurl.com/ParkingSlot/$parkSlotId'),
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

  @override
  void putPark({required int parkId,required String parkName, required String parkLocation, required String parkImage, required double parkPrice, required double parkRating, required int garageOwnerId})async {
    var body = {
      "parkId": parkId,
      "parkName": parkName,
      "parkLocation": parkLocation,
      "parkImage": parkImage,
      'parkPrice': parkPrice,
      "parkingRating": parkRating,
      "parkSection": 0,
      "reservationPlace": 0,
      'garageForiegnKey':garageOwnerId
    };

    try {
      http.Response response = await http.put(
          Uri.parse('http://raknaapi-001-site1.ctempurl.com/Parks/$parkId'),
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

  @override
  Stream<List<ParkingSlotModel>> getParkingSlot1(int parkId)async* {
    final Response response = await Dio().get(
        'http://raknaapi-001-site1.ctempurl.com/ParkingSlot/$parkId'); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      yield List<ParkingSlotModel>.from(
          (response.data as List).map((e) => ParkingSlotModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }



  @override
  Future<List> getBookMark()  async {
    final  response =
    await http.get(Uri.parse('http://raknaapi-001-site1.ctempurl.com/BookMark'));
    print('${response.statusCode}');
    // print('${response.body}');
    if (response.statusCode == 200) {
     return  jsonDecode(response.body);
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  void postBookMark({required bool isFavorite, required int userId, required int parkId})async {
    var body = {
      "isFav": isFavorite,
      "userForeignKey": userId,
      "parkForeignKey": parkId,
    };

    try {
      http.Response response = await http.post(
          Uri.parse('http://raknaapi-001-site1.ctempurl.com/BookMark'),
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
