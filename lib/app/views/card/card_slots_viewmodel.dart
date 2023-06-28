import 'package:collection/collection.dart';
import 'package:pataya_ending_card/app/app.dialog_ui.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/app.locator.dart';

import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/routes/app_router.gr.dart';
import 'package:pataya_ending_card/app/services/_core/ecard_service.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../extensions/slot_extension.dart';
import '../../models/ecard.dart';
import '../../models/slot.dart';
import '../../routes/app_router.dart';
import 'widgets/slot.dart';

enum ActionType { add, update }

class CardSlotsViewModel extends ReactiveViewModel {
  final uuid = const Uuid();
  final log = getLogger('CardSlotsViewModel');

  final _dialogService = locator<DialogService>();
  final navigationService = locator<AppRouter>();
  final _eCardService = locator<ECardService>();

  ECard? model;

  List _slots = [];
  get slots => _slots;

  String get winningId {
    int? a = model?.teamOneScore;
    int? b = model?.teamTwoScore;
    final h = [a, b];
    h.sort((a, b) {
      if (a == null) {
        return 1;
      }
      if (b == null) {
        return -1;
      }
      return b.compareTo(a);
    });

    return h.map((e) => e != null ? e % 10 : null).join("-");
  }

  mapSlot() {
    _slots = [];
    final s = model?.slotList;
    for (var i = 0; i < 25; i++) {
      for (var j = 0; j < 4; j++) {
        var id = SlotExtension.slotFormat(i == 0 && j == 0 ? 0 : i + j * 25);
        var slot = s?.firstWhereOrNull((val) => val.id == id);

        var x = slot != null
            ? slot.copyWith(isWinner: slot.id == winningId)
            : Slot(id: id).copyWith(isWinner: id == winningId);

        _slots.add(SlotCell(x, onTap: (slot) {
          addSlot(slot);
        }));
      }
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _eCardService,
      ];

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString(),
      );
    });
  }

  addSlot(Slot? slot) {
    _dialogService
        .showCustomDialog(
      takesInput: true,
      variant: DialogType.slot,
      barrierDismissible: true,
      data: slot,
    )
        .then((value) {
      if (value?.data is Slot) {
        model?.slotList.add(value?.data);
        mapSlot();
        notifyListeners();
      }
    });
  }

  updateSlot() {
    navigationService.push(CardSlotsRoute());
  }
}
