import 'package:rakna/domain/entities/parking.dart';

class ParkingModel extends Parking {
  ParkingModel({
    required super.parkName,
    required super.parkLocation,
    required super.parkImage,
    required super.parkPrice,
    required super.parkingRating,
    required super.parkSection,
    required super.reservationPlace,
  });

  factory ParkingModel.fromJson(Map<String, dynamic> json) => ParkingModel(
        parkName: json['parkName'],
        parkLocation: json['parkLocation'],
        parkImage: json['parkImage'],
        parkPrice: json['parkPrice'],
        parkingRating: json['parkingRating'],
        parkSection: json['parkSection'],
        reservationPlace: json['reservationPlace'],
      );
}
