import 'package:dio/dio.dart';
import 'package:rakna/data/model/parking_model.dart';
import 'package:rakna/data/model/parking_slot_model.dart';

import '../../core/local_error/exceptions.dart';
import '../model/movies_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<ParkingModel>> getParking();

  Future<List<ParkingSlotModel>> getParkingSlot();

  void postSignUp({
    required String userName,
    required int age,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  });
}

class ParkingRemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<ParkingModel>> getParking() async {
    final Response response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=03c1b496b0bd8b48501e5eec0af2b127&language=en-US&page=1');
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      return List<ParkingModel>.from((response.data['results'] as List)
          .map((e) => ParkingModel.fromJson(e)));
    } else {
      throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
    }
  }

  @override
  Future<List<ParkingSlotModel>> getParkingSlot() async {
    final Response response = await Dio().get(''); //todo put api url here
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      return List<ParkingSlotModel>.from(
          (response.data as List).map((e) => ParkingModel.fromJson(e)));
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
        'https://reqres.in/api/login',
        data: {
          "userName": userName,
          "age": age,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'phoneNumber': phoneNumber,
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        print('Login successfully');
      } else {
        print('failed');
        throw LocalException(statusMessage: 'Api error RDS: 1', success: false);
      }
    } catch (e) {
      print('$e error catch :( ');
    }
  }
}
