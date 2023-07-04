import 'dart:async';
import 'package:collection/collection.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/dialog_ui.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/app.locator.dart';

import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/routes/app_router.gr.dart';
import 'package:pataya_ending_card/app/services/_core/ecard_service.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../extensions/slot_extension.dart';
import '../../models/ecard.dart';
import '../../models/slot.dart';
import '../../routes/app_router.dart';

class CardViewModel extends ReactiveViewModel {
  @override
  List<ListenableServiceMixin> get listenableServices => [
        _eCardService,
      ];

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString(),
      );
    });
  }

  final log = getLogger('CardViewModel');

  final dialogService = locator<DialogService>();
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

  initForm(ECard? e, {ActionType? actionType}) async {
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
  }

  List<Slot> _slots = [];
  List<Slot> get slots => _slots;

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

  String? selectedSlotId;
  mapSlot() {
    _slots = [];
    final s = formModel.model.slotList;
    for (var i = 0; i < 25; i++) {
      for (var j = 0; j < 4; j++) {
        var slotId =
            SlotExtension.slotFormat(i == 0 && j == 0 ? 0 : i + j * 25);
        var slot = s.firstWhereOrNull((val) => val.id == slotId);
        var x = slot != null
            ? slot.copyWith(isWinner: slot.id == winningId)
            : Slot(id: slotId).copyWith(isWinner: slotId == winningId);
        _slots.add(x);
      }
    }
    notifyListeners();
  }

  manageSlot(Slot? slot, ActionType action) {
    selectedSlotId = slot?.id;
    mapSlot();
    dialogService.showCustomDialog(
      takesInput: true,
      variant: DialogType.slot,
      barrierDismissible: true,
      data: {
        'slot': slot,
        'action': action,
      },
    ).then((value) async {
      if (value?.data is Slot) {
        final Slot slot = value?.data;
        if (action == ActionType.add) {
          formModel.addSlotListItem(slot);
        } else if (action == ActionType.update) {
          final a = formModel.model.slotList.indexWhere((e) => e.id == slot.id);
          if (a != -1) {
            formModel.removeSlotListItemAtIndex(a);
            formModel.addSlotListItem(slot);
          }
        }
        mapSlot();
        await updateCard();
      }
    });
  }

  showScoreForm() {
    dialogService.showCustomDialog(
        variant: DialogType.score,
        barrierDismissible: true,
        takesInput: true,
        data: {
          'card': _formModel.model,
          'action': ActionType.update,
        }).then((value) async {
      if (value?.data is ECard) {
        model = value?.data;
        print(model);
        initForm(model);

        mapSlot();
        await updateCard();
      }
    });
  }

  showCardForm() {
    navigationService
        .push(
      CardRoute(
        card: formModel.model,
        action: ActionType.update,
      ),
    )
        .then((value) {
      if (value is ECard) {
        model = value;
        initForm(model);
        notifyListeners();
      }
    });
  }

  createCard() async {
    await runBusyFuture(_eCardService.create(formModel.model))
        .then((value) => navigationService.pop());
  }

  updateCard() async {
    await runBusyFuture(_eCardService.update(formModel.model));
  }

  Future<DialogResponse<dynamic>?> confirmExit() async {
    return await dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Exit App",
      description: "You sure you want to exit?",
      mainButtonTitle: "Yes",
      secondaryButtonTitle: "Cancel",
      barrierDismissible: true,
    );
  }
}
