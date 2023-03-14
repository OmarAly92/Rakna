import 'package:rakna/domain/entities/parking.dart';

abstract class BaseParkingRepository{
 Future<List<Parking>> getParking();
}