import 'package:dartz/dartz.dart';
import 'package:rakna/domain/entities/parking.dart';

import '../../core/local_error/exceptions.dart';
import '../entities/movies_entities.dart';

abstract class BaseParkingRepository {
  Future<Either<LocalException, List<Parking>>> getParking();

  void postDio(String userName, int age, String email, String password,
      String confirmPassword, String phoneNumber);
}
