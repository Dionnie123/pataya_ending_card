import 'dart:async';
import 'package:collection/collection.dart';
import 'package:pataya_ending_card/app/dialog_ui.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/app.locator.dart';

import 'package:flutter/material.dart';
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

class CardViewModel extends ReactiveViewModel {
  final uuid = const Uuid();
  final log = getLogger('CardViewModel');

  final _dialogService = locator<DialogService>();
  final navigationService = locator<AppRouter>();
  final _eCardService = locator<ECardService>();

  ECard? model;
  late ECardForm _formModel;
  ECardForm get formModel => _formModel;

  ActionType? action = ActionType.add;

  isAddMode() {
    return action == ActionType.add;
  }

  isUpdateMode() {
    return action == ActionType.update;
  }

  initForm(ECard? e, {required ActionType? actionType}) async {
    model = e;
    action = actionType;
    final el = ECardForm.formElements(e);
    _formModel = ECardForm(el, null);
    _formModel.form.setValidators(el.validators);
    _formModel.form.setAsyncValidators(el.asyncValidators);
    if (el.disabled) {
      _formModel.form.markAsDisabled();
    }
    _formModel.form.addAll(el.controls);
    mapSlot();
  }

  List _slots = [];
  get slots => _slots;

  String get winningId {
    int? a = formModel.model.teamOneScore;
    int? b = formModel.model.teamTwoScore;
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
    final s = formModel.model.slotList;
    for (var i = 0; i < 25; i++) {
      for (var j = 0; j < 4; j++) {
        var id = SlotExtension.slotFormat(i == 0 && j == 0 ? 0 : i + j * 25);
        var slot = s.firstWhereOrNull((val) => val.id == id);

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
        .then((value) async {
      if (value?.data is Slot) {
        final Slot slot = value?.data;
        final a = formModel.model.slotList
            .indexWhere((e) => e.id == slot.id && e.name == slot.name);
        if (a != -1) {
          formModel.removeSlotListItemAtIndex(a);
          formModel.addSlotListItem(slot);
        } else {
          formModel.addSlotListItem(slot);
        }

        await updateCard();
        mapSlot();
      }
    });
  }

  addCard() async {
    await runBusyFuture(_eCardService.create(formModel.model))
        .then((value) => navigationService.pop());
  }

  updateCard() async {
    await runBusyFuture(_eCardService.update(formModel.model));
  }

  Future<DialogResponse<dynamic>?> confirmExit() async {
    return await _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Exit App",
      description: "You sure you want to exit?",
      mainButtonTitle: "Yes",
      secondaryButtonTitle: "Cancel",
      barrierDismissible: true,
    );
  }
}
