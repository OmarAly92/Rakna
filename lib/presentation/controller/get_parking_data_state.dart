part of 'get_parking_data_bloc.dart';



class ParkingState extends Equatable {
  final List<Parking> parking;
  final RequestState requestState;
  final String message;

  const ParkingState({
    this.parking = const [],
    this.requestState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object> get props => [
        parking,
        requestState,
        message,
      ];
}
