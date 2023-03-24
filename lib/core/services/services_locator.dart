import 'package:get_it/get_it.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/data/repository/parking_repository.dart';
import 'package:rakna/domain/repository/base_parking_repository.dart';
import 'package:rakna/domain/usecase/get_parking_usecase.dart';
import 'package:rakna/presentation/controller/get_parking_data_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///BLOC
    sl.registerFactory(() => ParkingBloc(sl()));

    /// Parking USECASE
    sl.registerLazySingleton(() => GetParkingUseCase(sl()));

    /// Parking REPOSITORY
    sl.registerLazySingleton<BaseParkingRepository>(
        () => ParkingRepository(sl()));

    /// REMOTE DATA SOURCE
    sl.registerLazySingleton<BaseRemoteDataSource>(
        () => ParkingRemoteDataSource());
  }
}
