import 'package:collection/collection.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/models/slot.dart';

extension SlotExtension on ECard {
  String? winningSlotId() {
    int? t1 = teamOneScore;
    int? t2 = teamTwoScore;
    if (t1 == null || t2 == null) {
      return null;
    }
    final scores = [t1, t2];
    scores.sort((b, a) => (a).compareTo(b));
    return scores.map((e) => e % 10).join("-");
  }

  Slot? winnerSlot() {
    for (var i = 0; i < slotList.length; i++) {
      if (slotList[i].id == winningSlotId()) {
        return slotList[i];
      }
    }
    return null;
  }

  List<Slot> generateSlots() {
    List<Slot> slots = [];
    for (var i = 0; i < 25; i++) {
      for (var j = 0; j < 4; j++) {
        final isFirstLoop = (i == 0 && j == 0);

        var id = "${isFirstLoop ? 0 : i + (j * 25)}"
            .padLeft(2, '0')
            .split("")
            .join("-");
        Slot temp =
            slotList.firstWhereOrNull((val) => val.id == id) ?? Slot(id: id);
        var slot = temp.copyWith(isWinner: temp.id == winningSlotId());

        slots.add(slot);
      }
    }
    return slots;
  }
}
