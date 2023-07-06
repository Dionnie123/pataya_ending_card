// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'slot.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveSlotFormConsumer extends StatelessWidget {
  const ReactiveSlotFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(BuildContext context, SlotForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSlotForm.of(context);

    if (formModel is! SlotForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class SlotFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const SlotFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final SlotForm form;
}

class ReactiveSlotForm extends StatelessWidget {
  const ReactiveSlotForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final SlotForm form;

  final WillPopCallback? onWillPop;

  static SlotForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<SlotFormInheritedStreamer>()
          ?.form;
    }

    final element = context
        .getElementForInheritedWidgetOfExactType<SlotFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as SlotFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return SlotFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class SlotFormBuilder extends StatefulWidget {
  const SlotFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final Slot? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(BuildContext context, SlotForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, SlotForm formModel)? initState;

  @override
  _SlotFormBuilderState createState() => _SlotFormBuilderState();
}

class _SlotFormBuilderState extends State<SlotFormBuilder> {
  late SlotForm _formModel;

  @override
  void initState() {
    _formModel = SlotForm(SlotForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant SlotFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = SlotForm(SlotForm.formElements(widget.model), null);

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
    return ReactiveSlotForm(
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

class ReactiveSlotFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveSlotFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(SlotForm formModel)? control;

  final Widget Function(
      BuildContext context, List<Widget> itemList, SlotForm formModel)? builder;

  final Widget Function(
      BuildContext context, int i, T? item, SlotForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSlotForm.of(context);

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

class ReactiveSlotFormFormGroupArrayBuilder<V> extends StatelessWidget {
  const ReactiveSlotFormFormGroupArrayBuilder({
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
      SlotForm formModel)? getExtended;

  final Widget Function(
      BuildContext context, List<Widget> itemList, SlotForm formModel)? builder;

  final Widget Function(
      BuildContext context, int i, V? item, SlotForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSlotForm.of(context);

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
