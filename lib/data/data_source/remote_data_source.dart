import 'package:dio/dio.dart';
import 'package:rakna/data/model/parking_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<ParkingModel>> getParking();
}



class ParkingRemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<ParkingModel>> getParking() async{

    final Response response = await Dio().get('');
      return List<ParkingModel>.from((response.data["results"] as List).map((e) => ParkingModel.fromJson(e)));
}
}
