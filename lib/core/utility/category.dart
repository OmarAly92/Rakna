import 'package:flutter/material.dart';

class Category {
  String parkImage;
  String parkingName;
  String parkingLocation;
  String parkPrice;
  Widget nextScreen;

  Category({
    required this.parkingName,
    required this.parkingLocation,
    required this.parkImage,
    required this.parkPrice,
    required this.nextScreen
  });
}


