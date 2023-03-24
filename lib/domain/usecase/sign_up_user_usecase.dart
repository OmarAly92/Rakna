import '../repository/base_parking_repository.dart';

class SignUpUserUseCase {
  final BaseParkingRepository baseParkingRepository;

  SignUpUserUseCase(this.baseParkingRepository);

  void postDio(String userName, int age, String email, String password,
      String confirmPassword,String phoneNumber) {
    baseParkingRepository.postDio(userName,age, email, password, confirmPassword, phoneNumber);
  }
}
