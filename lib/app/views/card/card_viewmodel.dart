import 'package:pataya_ending_card/app/app.router.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/dialog_ui.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/services/_core/ecard_service.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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
  final routingService = locator<RouterService>();
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

  create() async {
    await runBusyFuture(_eCardService.create(formModel.model))
        .then((value) => routingService.pop());
  }

  update() async {
    await runBusyFuture(_eCardService.update(formModel.model))
        .then((value) => routingService.pop(value));
  }

  delete() async {
    await runBusyFuture(_eCardService.delete(formModel.model.id)).then(
        (value) => routingService.clearStackAndShow(const HomeViewRoute()));
  }
}
