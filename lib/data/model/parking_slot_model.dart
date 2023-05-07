import 'package:rakna/domain/entities/parking_slot_entities.dart';

import '../../domain/entities/movies_entities.dart';

class ParkingSlotModel extends ParkingSlot {
  const ParkingSlotModel({
    required super.slotId,
    required super.slotName,
    required super.numbersOfSlots,
    required super.available,
    required super.section,
  });

factory ParkingSlotModel.fromJson(Map<String, dynamic> json) => ParkingSlotModel(
  slotId: json['slotId'],
  slotName: json['slotName'],
  numbersOfSlots: json['numbersOfSlots'],
  available: json['available'],
  section: json['section'],
);
}
