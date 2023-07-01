import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/dialog_ui.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/app.locator.dart';

import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../models/ecard.dart';

class ScoreDialogViewModel extends ReactiveViewModel {
  final uuid = const Uuid();
  final log = getLogger('ScoreDialogViewModel');

  final _dialogService = locator<DialogService>();

  ECard? model;
  late ECardForm _formModel;
  ECardForm get formModel => _formModel;

  ActionType? action = ActionType.add;

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
