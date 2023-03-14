import 'package:rakna/domain/entities/parking.dart';

class ParkingModel extends Parking {
  ParkingModel({
    required super.parkName,
    required super.parkLocation,
    required super.parkImage,
    required super.parkPrice,
    required super.reservationPlace,
    required super.parkingRating,
    required super.parkSection,
  });

  factory ParkingModel.fromJson(Map<String, dynamic> json) => ParkingModel(
        parkName: json[''],
        parkLocation: json[''],
        parkImage: json[''],
        parkPrice: json[''],
        reservationPlace: json[''],
        parkingRating: json[''],
        parkSection: json[''],
      );
}
