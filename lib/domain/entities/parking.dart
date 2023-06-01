import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Parking extends Equatable {
  final String parkName;
  final String parkLocation;
  final String parkImage;
  final num parkPrice;
  final num parkingRating;
  final int parkSection;
  final int reservationPlace;

  const Parking({
    required this.parkName,
    required this.parkLocation,
    required this.parkImage,
    required this.parkPrice,
    required this.reservationPlace,
    required this.parkingRating,
    required this.parkSection,
  });

  @override
  List<Object> get props => [
        parkName,
        parkLocation,
        parkImage,
        parkPrice,
        parkingRating,
        reservationPlace,
        parkSection,
      ];
}
