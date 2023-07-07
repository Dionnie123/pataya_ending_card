import '../models/slot.dart';

extension SlotExtension on Slot {
  String slotId() {
    return id.toString().padLeft(2, '0').split("").join("-");
  }
}
