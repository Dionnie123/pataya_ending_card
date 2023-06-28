// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'ecard.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveECardFormConsumer extends StatelessWidget {
  const ReactiveECardFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, ECardForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveECardForm.of(context);

    if (formModel is! ECardForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class ECardFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const ECardFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final ECardForm form;
}

class ReactiveECardForm extends StatelessWidget {
  const ReactiveECardForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final ECardForm form;

  final WillPopCallback? onWillPop;

  static ECardForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<ECardFormInheritedStreamer>()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<ECardFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as ECardFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return ECardFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class ECardFormBuilder extends StatefulWidget {
  const ECardFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final ECard? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, ECardForm formModel, Widget? child) builder;

  final void Function(BuildContext context, ECardForm formModel)? initState;

  @override
  _ECardFormBuilderState createState() => _ECardFormBuilderState();
}

class _ECardFormBuilderState extends State<ECardFormBuilder> {
  late ECardForm _formModel;

  @override
  void initState() {
    _formModel = ECardForm(ECardForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ECardFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = ECardForm(ECardForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveECardForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class ECardForm implements FormModel<ECard> {
  ECardForm(
    this.form,
    this.path,
  );

  static const String idControlName = "id";

  static const String dateControlName = "date";

  static const String titleControlName = "title";

  static const String teamOneNameControlName = "teamOneName";

  static const String teamTwoNameControlName = "teamTwoName";

  static const String teamOneScoreControlName = "teamOneScore";

  static const String teamTwoScoreControlName = "teamTwoScore";

  static const String betAmountControlName = "betAmount";

  static const String prizeControlName = "prize";

  static const String remarksControlName = "remarks";

  static const String slotListControlName = "slotList";

  static const String createdAtControlName = "createdAt";

  static const String updatedAtControlName = "updatedAt";

  final FormGroup form;

  final String? path;

  String idControlPath() => pathBuilder(idControlName);
  String dateControlPath() => pathBuilder(dateControlName);
  String titleControlPath() => pathBuilder(titleControlName);
  String teamOneNameControlPath() => pathBuilder(teamOneNameControlName);
  String teamTwoNameControlPath() => pathBuilder(teamTwoNameControlName);
  String teamOneScoreControlPath() => pathBuilder(teamOneScoreControlName);
  String teamTwoScoreControlPath() => pathBuilder(teamTwoScoreControlName);
  String betAmountControlPath() => pathBuilder(betAmountControlName);
  String prizeControlPath() => pathBuilder(prizeControlName);
  String remarksControlPath() => pathBuilder(remarksControlName);
  String createdAtControlPath() => pathBuilder(createdAtControlName);
  String updatedAtControlPath() => pathBuilder(updatedAtControlName);
  String slotListControlPath() => pathBuilder(slotListControlName);
  String? get _idValue => idControl?.value;
  DateTime? get _dateValue => dateControl?.value;
  String? get _titleValue => titleControl?.value;
  String? get _teamOneNameValue => teamOneNameControl?.value;
  String? get _teamTwoNameValue => teamTwoNameControl?.value;
  int? get _teamOneScoreValue => teamOneScoreControl?.value;
  int? get _teamTwoScoreValue => teamTwoScoreControl?.value;
  double? get _betAmountValue => betAmountControl?.value;
  String? get _prizeValue => prizeControl?.value;
  String? get _remarksValue => remarksControl?.value;
  DateTime? get _createdAtValue => createdAtControl?.value;
  DateTime? get _updatedAtValue => updatedAtControl?.value;
  List<Slot> get _slotListValue =>
      slotListSlotForm.map((e) => e.model).toList();
  bool get containsId {
    try {
      form.control(idControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsDate {
    try {
      form.control(dateControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTitle {
    try {
      form.control(titleControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTeamOneName {
    try {
      form.control(teamOneNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTeamTwoName {
    try {
      form.control(teamTwoNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTeamOneScore {
    try {
      form.control(teamOneScoreControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTeamTwoScore {
    try {
      form.control(teamTwoScoreControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsBetAmount {
    try {
      form.control(betAmountControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPrize {
    try {
      form.control(prizeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsRemarks {
    try {
      form.control(remarksControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCreatedAt {
    try {
      form.control(createdAtControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsUpdatedAt {
    try {
      form.control(updatedAtControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsSlotList {
    try {
      form.control(slotListControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get idErrors => idControl?.errors;
  Object? get dateErrors => dateControl?.errors;
  Object? get titleErrors => titleControl?.errors;
  Object? get teamOneNameErrors => teamOneNameControl?.errors;
  Object? get teamTwoNameErrors => teamTwoNameControl?.errors;
  Object? get teamOneScoreErrors => teamOneScoreControl?.errors;
  Object? get teamTwoScoreErrors => teamTwoScoreControl?.errors;
  Object? get betAmountErrors => betAmountControl?.errors;
  Object? get prizeErrors => prizeControl?.errors;
  Object? get remarksErrors => remarksControl?.errors;
  Object? get createdAtErrors => createdAtControl?.errors;
  Object? get updatedAtErrors => updatedAtControl?.errors;
  Object? get slotListErrors => slotListControl.errors;
  void get idFocus => form.focus(idControlPath());
  void get dateFocus => form.focus(dateControlPath());
  void get titleFocus => form.focus(titleControlPath());
  void get teamOneNameFocus => form.focus(teamOneNameControlPath());
  void get teamTwoNameFocus => form.focus(teamTwoNameControlPath());
  void get teamOneScoreFocus => form.focus(teamOneScoreControlPath());
  void get teamTwoScoreFocus => form.focus(teamTwoScoreControlPath());
  void get betAmountFocus => form.focus(betAmountControlPath());
  void get prizeFocus => form.focus(prizeControlPath());
  void get remarksFocus => form.focus(remarksControlPath());
  void get createdAtFocus => form.focus(createdAtControlPath());
  void get updatedAtFocus => form.focus(updatedAtControlPath());
  void get slotListFocus => form.focus(slotListControlPath());
  void idRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsId) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          idControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            idControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void dateRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsDate) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          dateControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            dateControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void titleRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsTitle) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          titleControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            titleControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void teamOneNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsTeamOneName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          teamOneNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            teamOneNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void teamTwoNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsTeamTwoName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          teamTwoNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            teamTwoNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void teamOneScoreRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsTeamOneScore) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          teamOneScoreControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            teamOneScoreControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void teamTwoScoreRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsTeamTwoScore) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          teamTwoScoreControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            teamTwoScoreControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void betAmountRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsBetAmount) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          betAmountControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            betAmountControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void prizeRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPrize) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          prizeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            prizeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void remarksRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsRemarks) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          remarksControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            remarksControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void createdAtRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsCreatedAt) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          createdAtControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            createdAtControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void updatedAtRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsUpdatedAt) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          updatedAtControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            updatedAtControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void idValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void dateValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    dateControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void titleValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    titleControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void teamOneNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    teamOneNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void teamTwoNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    teamTwoNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void teamOneScoreValueUpdate(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    teamOneScoreControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void teamTwoScoreValueUpdate(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    teamTwoScoreControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void betAmountValueUpdate(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    betAmountControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void prizeValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    prizeControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void remarksValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    remarksControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void createdAtValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    createdAtControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void updatedAtValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updatedAtControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void slotListValueUpdate(
    List<Slot> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final localValue = (value);
    if (localValue.isEmpty) {
      slotListClear(updateParent: updateParent, emitEvent: emitEvent);

      return;
    }

    final toUpdate = <Slot>[];
    final toAdd = <Slot>[];

    localValue.asMap().forEach((k, v) {
      if (slotListSlotForm.asMap().containsKey(k) &&
          (slotListControl.value ?? []).asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      slotListControl.updateValue(
          toUpdate.map((e) => SlotForm.formElements(e).rawValue).toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        slotListControl.add(SlotForm.formElements(e),
            updateParent: updateParent, emitEvent: emitEvent);
      });
    }
  }

  void slotListInsert(
    int i,
    Slot value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if ((slotListControl.value ?? []).length < i) {
      addSlotListItem(value);
      return;
    }

    slotListControl.insert(
      i,
      SlotForm.formElements(value),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void slotListClear({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    slotListSlotForm.clear();
    slotListControl.clear(updateParent: updateParent, emitEvent: emitEvent);
  }

  void idValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void dateValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    dateControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void titleValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    titleControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void teamOneNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    teamOneNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void teamTwoNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    teamTwoNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void teamOneScoreValuePatch(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    teamOneScoreControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void teamTwoScoreValuePatch(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    teamTwoScoreControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void betAmountValuePatch(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    betAmountControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void prizeValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    prizeControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void remarksValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    remarksControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void createdAtValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    createdAtControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void updatedAtValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updatedAtControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void slotListValuePatch(
    List<Slot> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = slotListSlotForm.asMap().keys;

    final toPatch = <Slot>[];
    (value).asMap().forEach(
      (k, v) {
        if (keys.contains(k)) {
          toPatch.add(v);
        }
      },
    );

    slotListControl.patchValue(
        toPatch.map((e) => SlotForm.formElements(e).rawValue).toList(),
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void idValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      idControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void dateValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      dateControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void titleValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      titleControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void teamOneNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      teamOneNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void teamTwoNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      teamTwoNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void teamOneScoreValueReset(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      teamOneScoreControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void teamTwoScoreValueReset(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      teamTwoScoreControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void betAmountValueReset(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      betAmountControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void prizeValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      prizeControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void remarksValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      remarksControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void createdAtValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      createdAtControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void updatedAtValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      updatedAtControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void slotListValueReset(
    List<Slot> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      slotListControl.reset(
          value: value.map((e) => SlotForm.formElements(e).rawValue).toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
  FormControl<String>? get idControl =>
      containsId ? form.control(idControlPath()) as FormControl<String>? : null;
  FormControl<DateTime>? get dateControl => containsDate
      ? form.control(dateControlPath()) as FormControl<DateTime>?
      : null;
  FormControl<String>? get titleControl => containsTitle
      ? form.control(titleControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get teamOneNameControl => containsTeamOneName
      ? form.control(teamOneNameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get teamTwoNameControl => containsTeamTwoName
      ? form.control(teamTwoNameControlPath()) as FormControl<String>?
      : null;
  FormControl<int>? get teamOneScoreControl => containsTeamOneScore
      ? form.control(teamOneScoreControlPath()) as FormControl<int>?
      : null;
  FormControl<int>? get teamTwoScoreControl => containsTeamTwoScore
      ? form.control(teamTwoScoreControlPath()) as FormControl<int>?
      : null;
  FormControl<double>? get betAmountControl => containsBetAmount
      ? form.control(betAmountControlPath()) as FormControl<double>?
      : null;
  FormControl<String>? get prizeControl => containsPrize
      ? form.control(prizeControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get remarksControl => containsRemarks
      ? form.control(remarksControlPath()) as FormControl<String>?
      : null;
  FormControl<DateTime>? get createdAtControl => containsCreatedAt
      ? form.control(createdAtControlPath()) as FormControl<DateTime>?
      : null;
  FormControl<DateTime>? get updatedAtControl => containsUpdatedAt
      ? form.control(updatedAtControlPath()) as FormControl<DateTime>?
      : null;
  FormArray<Map<String, Object?>> get slotListControl =>
      form.control(slotListControlPath()) as FormArray<Map<String, Object?>>;
  List<SlotForm> get slotListSlotForm => (slotListControl.value ?? [])
      .asMap()
      .map((k, v) => MapEntry(k, SlotForm(form, pathBuilder("slotList.$k"))))
      .values
      .toList();
  void idSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      idControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      idControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void dateSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      dateControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      dateControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void titleSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      titleControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      titleControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void teamOneNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      teamOneNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      teamOneNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void teamTwoNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      teamTwoNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      teamTwoNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void teamOneScoreSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      teamOneScoreControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      teamOneScoreControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void teamTwoScoreSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      teamTwoScoreControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      teamTwoScoreControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void betAmountSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      betAmountControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      betAmountControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void prizeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      prizeControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      prizeControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void remarksSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      remarksControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      remarksControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void createdAtSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      createdAtControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      createdAtControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void updatedAtSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      updatedAtControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      updatedAtControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void slotListSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      slotListControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      slotListControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  ExtendedControl<List<Map<String, Object?>?>, List<SlotForm>>
      get slotListExtendedControl =>
          ExtendedControl<List<Map<String, Object?>?>, List<SlotForm>>(
              form.control(slotListControlPath())
                  as FormArray<Map<String, Object?>>,
              () => slotListSlotForm);
  void addSlotListItem(Slot value) {
    slotListControl.add(SlotForm.formElements(value));
  }

  void removeSlotListItemAtIndex(int i) {
    if ((slotListControl.value ?? []).length > i) {
      slotListControl.removeAt(i);
    }
  }

  void addSlotListItemList(List<Slot> value) {
    value.map((e) => addSlotListItem(e));
  }

  @override
  ECard get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'ECardForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return ECard(
        id: _idValue,
        date: _dateValue,
        title: _titleValue,
        teamOneName: _teamOneNameValue,
        teamTwoName: _teamTwoNameValue,
        teamOneScore: _teamOneScoreValue,
        teamTwoScore: _teamTwoScoreValue,
        betAmount: _betAmountValue,
        prize: _prizeValue,
        remarks: _remarksValue,
        slotList: _slotListValue,
        createdAt: _createdAtValue,
        updatedAt: _updatedAtValue);
  }

  void submit({
    required void Function(ECard model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    ECard value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(ECardForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    ECard? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(ECard? eCard) => FormGroup({
        idControlName: FormControl<String>(
            value: eCard?.id,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        dateControlName: FormControl<DateTime>(
            value: eCard?.date,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        titleControlName: FormControl<String>(
            value: eCard?.title,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        teamOneNameControlName: FormControl<String>(
            value: eCard?.teamOneName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        teamTwoNameControlName: FormControl<String>(
            value: eCard?.teamTwoName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        teamOneScoreControlName: FormControl<int>(
            value: eCard?.teamOneScore,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        teamTwoScoreControlName: FormControl<int>(
            value: eCard?.teamTwoScore,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        betAmountControlName: FormControl<double>(
            value: eCard?.betAmount,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        prizeControlName: FormControl<String>(
            value: eCard?.prize,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        remarksControlName: FormControl<String>(
            value: eCard?.remarks,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        slotListControlName: FormArray(
            (eCard?.slotList ?? [])
                .map((e) => SlotForm.formElements(e))
                .toList(),
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false),
        createdAtControlName: FormControl<DateTime>(
            value: eCard?.createdAt,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        updatedAtControlName: FormControl<DateTime>(
            value: eCard?.updatedAt,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class SlotForm implements FormModel<Slot> {
  SlotForm(
    this.form,
    this.path,
  );

  static const String idControlName = "id";

  static const String nameControlName = "name";

  static const String isPaidControlName = "isPaid";

  static const String isWinnerControlName = "isWinner";

  static const String createdAtControlName = "createdAt";

  static const String updatedAtControlName = "updatedAt";

  final FormGroup form;

  final String? path;

  String idControlPath() => pathBuilder(idControlName);
  String nameControlPath() => pathBuilder(nameControlName);
  String isPaidControlPath() => pathBuilder(isPaidControlName);
  String isWinnerControlPath() => pathBuilder(isWinnerControlName);
  String createdAtControlPath() => pathBuilder(createdAtControlName);
  String updatedAtControlPath() => pathBuilder(updatedAtControlName);
  String? get _idValue => idControl?.value;
  String? get _nameValue => nameControl?.value;
  bool? get _isPaidValue => isPaidControl?.value;
  bool? get _isWinnerValue => isWinnerControl?.value;
  DateTime? get _createdAtValue => createdAtControl?.value;
  DateTime? get _updatedAtValue => updatedAtControl?.value;
  bool get containsId {
    try {
      form.control(idControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsName {
    try {
      form.control(nameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsIsPaid {
    try {
      form.control(isPaidControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsIsWinner {
    try {
      form.control(isWinnerControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCreatedAt {
    try {
      form.control(createdAtControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsUpdatedAt {
    try {
      form.control(updatedAtControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get idErrors => idControl?.errors;
  Object? get nameErrors => nameControl?.errors;
  Object? get isPaidErrors => isPaidControl?.errors;
  Object? get isWinnerErrors => isWinnerControl?.errors;
  Object? get createdAtErrors => createdAtControl?.errors;
  Object? get updatedAtErrors => updatedAtControl?.errors;
  void get idFocus => form.focus(idControlPath());
  void get nameFocus => form.focus(nameControlPath());
  void get isPaidFocus => form.focus(isPaidControlPath());
  void get isWinnerFocus => form.focus(isWinnerControlPath());
  void get createdAtFocus => form.focus(createdAtControlPath());
  void get updatedAtFocus => form.focus(updatedAtControlPath());
  void idRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsId) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          idControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            idControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void nameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          nameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            nameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void isPaidRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsIsPaid) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          isPaidControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            isPaidControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void isWinnerRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsIsWinner) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          isWinnerControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            isWinnerControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void createdAtRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsCreatedAt) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          createdAtControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            createdAtControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void updatedAtRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsUpdatedAt) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          updatedAtControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            updatedAtControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void idValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void isPaidValueUpdate(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isPaidControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void isWinnerValueUpdate(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isWinnerControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void createdAtValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    createdAtControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void updatedAtValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updatedAtControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void idValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void isPaidValuePatch(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isPaidControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void isWinnerValuePatch(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isWinnerControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void createdAtValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    createdAtControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void updatedAtValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updatedAtControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void idValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      idControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void nameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      nameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void isPaidValueReset(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      isPaidControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void isWinnerValueReset(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      isWinnerControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void createdAtValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      createdAtControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void updatedAtValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      updatedAtControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String>? get idControl =>
      containsId ? form.control(idControlPath()) as FormControl<String>? : null;
  FormControl<String>? get nameControl => containsName
      ? form.control(nameControlPath()) as FormControl<String>?
      : null;
  FormControl<bool>? get isPaidControl => containsIsPaid
      ? form.control(isPaidControlPath()) as FormControl<bool>?
      : null;
  FormControl<bool>? get isWinnerControl => containsIsWinner
      ? form.control(isWinnerControlPath()) as FormControl<bool>?
      : null;
  FormControl<DateTime>? get createdAtControl => containsCreatedAt
      ? form.control(createdAtControlPath()) as FormControl<DateTime>?
      : null;
  FormControl<DateTime>? get updatedAtControl => containsUpdatedAt
      ? form.control(updatedAtControlPath()) as FormControl<DateTime>?
      : null;
  void idSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      idControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      idControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void nameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      nameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      nameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void isPaidSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      isPaidControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      isPaidControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void isWinnerSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      isWinnerControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      isWinnerControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void createdAtSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      createdAtControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      createdAtControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void updatedAtSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      updatedAtControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      updatedAtControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  Slot get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'SlotForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return Slot(
        id: _idValue,
        name: _nameValue,
        isPaid: _isPaidValue,
        isWinner: _isWinnerValue,
        createdAt: _createdAtValue,
        updatedAt: _updatedAtValue);
  }

  void submit({
    required void Function(Slot model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    Slot value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(SlotForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    Slot? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(Slot? slot) => FormGroup({
        idControlName: FormControl<String>(
            value: slot?.id,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        nameControlName: FormControl<String>(
            value: slot?.name,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        isPaidControlName: FormControl<bool>(
            value: slot?.isPaid,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        isWinnerControlName: FormControl<bool>(
            value: slot?.isWinner,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        createdAtControlName: FormControl<DateTime>(
            value: slot?.createdAt,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        updatedAtControlName: FormControl<DateTime>(
            value: slot?.updatedAt,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveECardFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveECardFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(ECardForm formModel)? control;

  final Widget Function(
          BuildContext context, List<Widget> itemList, ECardForm formModel)?
      builder;

  final Widget Function(
      BuildContext context, int i, T? item, ECardForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveECardForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveECardFormFormGroupArrayBuilder<V> extends StatelessWidget {
  const ReactiveECardFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      ECardForm formModel)? getExtended;

  final Widget Function(
          BuildContext context, List<Widget> itemList, ECardForm formModel)?
      builder;

  final Widget Function(
      BuildContext context, int i, V? item, ECardForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveECardForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
