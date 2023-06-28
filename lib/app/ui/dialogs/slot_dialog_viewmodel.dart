import 'package:pataya_ending_card/app/app.dialog_ui.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/app.locator.dart';

import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../models/ecard.dart';
import '../../models/slot.dart';
import '../../routes/app_router.dart';

enum ActionType { add, edit }

class SlotDialogViewModel extends ReactiveViewModel {
  final uuid = const Uuid();
  final log = getLogger('SlotDialogViewModel');

  final _dialogService = locator<DialogService>();
  final _navigationService = locator<AppRouter>();

  Slot? model;
  late SlotForm _formModel;
  SlotForm get formModel => _formModel;

  initForm(Slot? e) async {
    final el = SlotForm.formElements(e);
    _formModel = SlotForm(el, null);
    _formModel.form.setValidators(el.validators);
    _formModel.form.setAsyncValidators(el.asyncValidators);
    if (el.disabled) {
      _formModel.form.markAsDisabled();
    }
    _formModel.form.addAll(el.controls);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];

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
}
