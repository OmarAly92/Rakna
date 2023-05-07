import 'package:equatable/equatable.dart';

class ParkingSlot extends Equatable {
  final int slotId;
  final String slotName;
  final int numbersOfSlots;
  final bool available;
  final int section;

  const ParkingSlot({
    required this.slotId,
    required this.slotName,
    required this.numbersOfSlots,
    required this.available,
    required this.section,
  });

  @override
  List<Object> get props => [
        slotId,
        slotName,
        numbersOfSlots,
        available,
        section,
      ];
}
