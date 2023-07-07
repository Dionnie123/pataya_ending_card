import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/dialog_ui.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/extensions/ecard_extension.dart';
import 'package:pataya_ending_card/app/routes/app_router.gr.dart';
import 'package:pataya_ending_card/app/services/_core/ecard_service.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../models/ecard.dart';
import '../../models/slot.dart';
import '../../routes/app_router.dart';

class CardSlotsViewModel extends ReactiveViewModel {
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

  final log = getLogger('CardSlotsViewModel');

  final dialogService = locator<DialogService>();
  final navigationService = locator<AppRouter>();
  final _eCardService = locator<ECardService>();

  bool isAddMode() {
    return action == ActionType.add;
  }

  bool isUpdateMode() {
    return action == ActionType.update;
  }

  late ActionType action;
  late ECard model;
  late ECardForm formModel;
  readyForm() async {
    final formGroup = ECardForm.formElements(model);
    formModel = ECardForm(formGroup, null);
    formModel.form.setValidators(formGroup.validators);
    formModel.form.setAsyncValidators(formGroup.asyncValidators);
    if (formGroup.disabled) {
      formModel.form.markAsDisabled();
    }
    formModel.form.addAll(formGroup.controls);
  }

  List<Slot> get slots => formModel.model.generateSlots();

  String? selectedSlotId;

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
        readyForm();
        notifyListeners();
      }
    });
  }

  updateScore() {
    dialogService.showCustomDialog(
      takesInput: true,
      variant: DialogType.score,
      barrierDismissible: true,
      data: {
        'card': formModel.model,
      },
    ).then((value) async {
      if (value?.data is ECard) {
        formModel.updateValue(value?.data);

        dialogService.showCustomDialog(
            variant: DialogType.simple,
            description: formModel.model.winnerSlot() != null
                ? "May Nanalo!"
                : "Walang Nanalo");
        notifyListeners();
        await updateCard();
      }
    });
  }

  updateSlot(Slot? slot, ActionType action) {
    selectedSlotId = slot?.id;

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
        notifyListeners();
        await updateCard();
      }
    });
  }

  updateCard() async {
    await runBusyFuture(_eCardService.update(formModel.model));
  }
}
