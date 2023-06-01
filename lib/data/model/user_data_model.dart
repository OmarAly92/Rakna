import 'package:rakna/domain/entities/user_data_entities.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    required super.email,
    required super.password,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        email: json['email'],
        password: json['password'],
      );
}
