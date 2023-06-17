import 'package:equatable/equatable.dart';

class GarageOwnerData extends Equatable {
  final String email;
  final String password;
  final int garageOwnerId;

  const GarageOwnerData({
    required this.email,
    required this.password,
    required this.garageOwnerId,
  });

  @override
  List<Object> get props => [
        email,
        password,
        garageOwnerId,
      ];
}
