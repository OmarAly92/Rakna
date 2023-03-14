import 'package:rakna/domain/repository/base_parking_repository.dart';

import '../entities/parking.dart';

class GetParkingUseCase {
  final BaseParkingRepository baseParkingRepository;

  GetParkingUseCase(this.baseParkingRepository);

  Future<List<Parking>> call()async{
    return await baseParkingRepository.getParking();
  }

}