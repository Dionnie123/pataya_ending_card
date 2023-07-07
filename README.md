# Pataya Ending Card
 Introducing "Pataya Ending Card" - the ultimate virtual ending card app for basketball enthusiasts!

flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

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