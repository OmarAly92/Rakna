import 'package:rakna/domain/entities/parking.dart';
import 'package:rakna/domain/repository/base_parking_repository.dart';

import '../data_source/remote_data_source.dart';

class ParkingRepository extends BaseParkingRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  ParkingRepository(this.baseRemoteDataSource);

  @override
  Future<List<Parking>> getParking() async {
    final result = await baseRemoteDataSource.getParking();

    return result;
  }
}
