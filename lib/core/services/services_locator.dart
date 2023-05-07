import 'package:get_it/get_it.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/data/repository/parking_repository.dart';
import 'package:rakna/domain/repository/base_parking_repository.dart';
import 'package:rakna/domain/usecase/get_parking_usecase.dart';
import 'package:rakna/presentation/controller/get_parking_data_bloc/get_parking_data_bloc.dart';
import 'package:rakna/presentation/controller/get_parking_slots_bloc/parking_slots_bloc.dart';

import '../../domain/usecase/get_parking_slot_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///BLOC
    sl.registerFactory(() => ParkingBloc(sl()));

    sl.registerFactory(() => ParkingSlotBloc(sl()));

    /// Parking USECASE
    sl.registerLazySingleton(() => GetParkingUseCase(sl()));

    sl.registerLazySingleton(() => GetParkingSlotUseCase(sl()));

    /// Parking REPOSITORY
    sl.registerLazySingleton<BaseParkingRepository>(
        () => ParkingRepository(sl()));

    /// REMOTE DATA SOURCE
    sl.registerLazySingleton<BaseRemoteDataSource>(
        () => ParkingRemoteDataSource());
  }
}
