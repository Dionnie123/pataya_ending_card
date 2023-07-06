// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return _Slot.fromJson(json);
}

/// @nodoc
mixin _$Slot {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @RfControl()
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  @RfControl()
  bool? get isPaid => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get isWinner => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlotCopyWith<Slot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotCopyWith<$Res> {
  factory $SlotCopyWith(Slot value, $Res Function(Slot) then) =
      _$SlotCopyWithImpl<$Res, Slot>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) @RfControl() String? name,
      @HiveField(2) @RfControl() bool? isPaid,
      @HiveField(3) bool? isWinner,
      @HiveField(4) DateTime? createdAt,
      @HiveField(5) DateTime? updatedAt});
}

/// @nodoc
class _$SlotCopyWithImpl<$Res, $Val extends Slot>
    implements $SlotCopyWith<$Res> {
  _$SlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isPaid = freezed,
    Object? isWinner = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWinner: freezed == isWinner
          ? _value.isWinner
          : isWinner // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SlotCopyWith<$Res> implements $SlotCopyWith<$Res> {
  factory _$$_SlotCopyWith(_$_Slot value, $Res Function(_$_Slot) then) =
      __$$_SlotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) @RfControl() String? name,
      @HiveField(2) @RfControl() bool? isPaid,
      @HiveField(3) bool? isWinner,
      @HiveField(4) DateTime? createdAt,
      @HiveField(5) DateTime? updatedAt});
}

/// @nodoc
class __$$_SlotCopyWithImpl<$Res> extends _$SlotCopyWithImpl<$Res, _$_Slot>
    implements _$$_SlotCopyWith<$Res> {
  __$$_SlotCopyWithImpl(_$_Slot _value, $Res Function(_$_Slot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isPaid = freezed,
    Object? isWinner = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Slot(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWinner: freezed == isWinner
          ? _value.isWinner
          : isWinner // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Slot implements _Slot {
  _$_Slot(
      {@HiveField(0) this.id,
      @HiveField(1) @RfControl() this.name,
      @HiveField(2) @RfControl() this.isPaid = false,
      @HiveField(3) this.isWinner = false,
      @HiveField(4) this.createdAt,
      @HiveField(5) this.updatedAt});

  factory _$_Slot.fromJson(Map<String, dynamic> json) => _$$_SlotFromJson(json);

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  @RfControl()
  final String? name;
  @override
  @JsonKey()
  @HiveField(2)
  @RfControl()
  final bool? isPaid;
  @override
  @JsonKey()
  @HiveField(3)
  final bool? isWinner;
  @override
  @HiveField(4)
  final DateTime? createdAt;
  @override
  @HiveField(5)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Slot(id: $id, name: $name, isPaid: $isPaid, isWinner: $isWinner, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Slot &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.isWinner, isWinner) ||
                other.isWinner == isWinner) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, isPaid, isWinner, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SlotCopyWith<_$_Slot> get copyWith =>
      __$$_SlotCopyWithImpl<_$_Slot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlotToJson(
      this,
    );
  }
}

abstract class _Slot implements Slot {
  factory _Slot(
      {@HiveField(0) final String? id,
      @HiveField(1) @RfControl() final String? name,
      @HiveField(2) @RfControl() final bool? isPaid,
      @HiveField(3) final bool? isWinner,
      @HiveField(4) final DateTime? createdAt,
      @HiveField(5) final DateTime? updatedAt}) = _$_Slot;

  factory _Slot.fromJson(Map<String, dynamic> json) = _$_Slot.fromJson;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  @RfControl()
  String? get name;
  @override
  @HiveField(2)
  @RfControl()
  bool? get isPaid;
  @override
  @HiveField(3)
  bool? get isWinner;
  @override
  @HiveField(4)
  DateTime? get createdAt;
  @override
  @HiveField(5)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_SlotCopyWith<_$_Slot> get copyWith => throw _privateConstructorUsedError;
}
