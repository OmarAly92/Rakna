import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rakna/domain/entities/parking_slot_entities.dart';
import 'package:rakna/domain/usecase/get_parking_slot_usecase.dart';

import '../../../core/utility/enums.dart';
import '../get_parking_data_bloc/get_parking_data_state.dart';

part 'parking_slots_event.dart';
part 'parking_slots_state.dart';

class ParkingSlotBloc extends Bloc<ParkingSlotEvent, ParkingSlotState> {
  final GetParkingSlotUseCase getParkingSlotUseCase;

  ParkingSlotBloc(this.getParkingSlotUseCase)
      : super(const ParkingSlotState()) {
    on<ParkingSlotEvent>((event, emit) async {

      final result = await getParkingSlotUseCase.call();
      print(result);

      emit(
        const ParkingSlotState(requestState: RequestState.loaded),
      );
      result.fold(
            (l) => emit(
              ParkingSlotState(
            requestState: RequestState.error,
            message: l.statusMessage,
          ),
        ),
            (r) => emit(
              ParkingSlotState(
            requestState: RequestState.loaded,
            parkingSlot: r,
          ),
        ),
      );
    });
  }
}
