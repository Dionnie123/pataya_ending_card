// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ECard _$ECardFromJson(Map<String, dynamic> json) {
  return _ECard.fromJson(json);
}

/// @nodoc
mixin _$ECard {
  @HiveField(0)
  @RfControl<String>()
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime? get date => throw _privateConstructorUsedError;
  @HiveField(2)
  @RfControl<String>()
  String? get title => throw _privateConstructorUsedError;
  @HiveField(3)
  @RfControl<String>(validators: [])
  String? get teamOneName => throw _privateConstructorUsedError;
  @HiveField(4)
  @RfControl<String>()
  String? get teamTwoName => throw _privateConstructorUsedError;
  @HiveField(5)
  @RfControl<int>()
  int? get teamOneScore => throw _privateConstructorUsedError;
  @HiveField(6)
  @RfControl<int>()
  int? get teamTwoScore => throw _privateConstructorUsedError;
  @HiveField(7)
  @RfControl<double>()
  double? get betAmount => throw _privateConstructorUsedError;
  @HiveField(8)
  @RfControl<String>()
  String? get prize => throw _privateConstructorUsedError;
  @HiveField(9)
  @RfControl<String>()
  String? get remarks => throw _privateConstructorUsedError;
  @HiveField(10)
  @RfArray()
  List<Slot> get slotList => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(12)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ECardCopyWith<ECard> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ECardCopyWith<$Res> {
  factory $ECardCopyWith(ECard value, $Res Function(ECard) then) =
      _$ECardCopyWithImpl<$Res, ECard>;
  @useResult
  $Res call(
      {@HiveField(0) @RfControl<String>() String? id,
      @HiveField(1) DateTime? date,
      @HiveField(2) @RfControl<String>() String? title,
      @HiveField(3) @RfControl<String>(validators: []) String? teamOneName,
      @HiveField(4) @RfControl<String>() String? teamTwoName,
      @HiveField(5) @RfControl<int>() int? teamOneScore,
      @HiveField(6) @RfControl<int>() int? teamTwoScore,
      @HiveField(7) @RfControl<double>() double? betAmount,
      @HiveField(8) @RfControl<String>() String? prize,
      @HiveField(9) @RfControl<String>() String? remarks,
      @HiveField(10) @RfArray() List<Slot> slotList,
      @HiveField(11) DateTime? createdAt,
      @HiveField(12) DateTime? updatedAt});
}

/// @nodoc
class _$ECardCopyWithImpl<$Res, $Val extends ECard>
    implements $ECardCopyWith<$Res> {
  _$ECardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? title = freezed,
    Object? teamOneName = freezed,
    Object? teamTwoName = freezed,
    Object? teamOneScore = freezed,
    Object? teamTwoScore = freezed,
    Object? betAmount = freezed,
    Object? prize = freezed,
    Object? remarks = freezed,
    Object? slotList = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      teamOneName: freezed == teamOneName
          ? _value.teamOneName
          : teamOneName // ignore: cast_nullable_to_non_nullable
              as String?,
      teamTwoName: freezed == teamTwoName
          ? _value.teamTwoName
          : teamTwoName // ignore: cast_nullable_to_non_nullable
              as String?,
      teamOneScore: freezed == teamOneScore
          ? _value.teamOneScore
          : teamOneScore // ignore: cast_nullable_to_non_nullable
              as int?,
      teamTwoScore: freezed == teamTwoScore
          ? _value.teamTwoScore
          : teamTwoScore // ignore: cast_nullable_to_non_nullable
              as int?,
      betAmount: freezed == betAmount
          ? _value.betAmount
          : betAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      prize: freezed == prize
          ? _value.prize
          : prize // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      slotList: null == slotList
          ? _value.slotList
          : slotList // ignore: cast_nullable_to_non_nullable
              as List<Slot>,
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
abstract class _$$_ECardCopyWith<$Res> implements $ECardCopyWith<$Res> {
  factory _$$_ECardCopyWith(_$_ECard value, $Res Function(_$_ECard) then) =
      __$$_ECardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @RfControl<String>() String? id,
      @HiveField(1) DateTime? date,
      @HiveField(2) @RfControl<String>() String? title,
      @HiveField(3) @RfControl<String>(validators: []) String? teamOneName,
      @HiveField(4) @RfControl<String>() String? teamTwoName,
      @HiveField(5) @RfControl<int>() int? teamOneScore,
      @HiveField(6) @RfControl<int>() int? teamTwoScore,
      @HiveField(7) @RfControl<double>() double? betAmount,
      @HiveField(8) @RfControl<String>() String? prize,
      @HiveField(9) @RfControl<String>() String? remarks,
      @HiveField(10) @RfArray() List<Slot> slotList,
      @HiveField(11) DateTime? createdAt,
      @HiveField(12) DateTime? updatedAt});
}

/// @nodoc
class __$$_ECardCopyWithImpl<$Res> extends _$ECardCopyWithImpl<$Res, _$_ECard>
    implements _$$_ECardCopyWith<$Res> {
  __$$_ECardCopyWithImpl(_$_ECard _value, $Res Function(_$_ECard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? title = freezed,
    Object? teamOneName = freezed,
    Object? teamTwoName = freezed,
    Object? teamOneScore = freezed,
    Object? teamTwoScore = freezed,
    Object? betAmount = freezed,
    Object? prize = freezed,
    Object? remarks = freezed,
    Object? slotList = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ECard(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      teamOneName: freezed == teamOneName
          ? _value.teamOneName
          : teamOneName // ignore: cast_nullable_to_non_nullable
              as String?,
      teamTwoName: freezed == teamTwoName
          ? _value.teamTwoName
          : teamTwoName // ignore: cast_nullable_to_non_nullable
              as String?,
      teamOneScore: freezed == teamOneScore
          ? _value.teamOneScore
          : teamOneScore // ignore: cast_nullable_to_non_nullable
              as int?,
      teamTwoScore: freezed == teamTwoScore
          ? _value.teamTwoScore
          : teamTwoScore // ignore: cast_nullable_to_non_nullable
              as int?,
      betAmount: freezed == betAmount
          ? _value.betAmount
          : betAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      prize: freezed == prize
          ? _value.prize
          : prize // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      slotList: null == slotList
          ? _value._slotList
          : slotList // ignore: cast_nullable_to_non_nullable
              as List<Slot>,
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
class _$_ECard implements _ECard {
  _$_ECard(
      {@HiveField(0) @RfControl<String>() this.id,
      @HiveField(1) this.date,
      @HiveField(2) @RfControl<String>() this.title,
      @HiveField(3) @RfControl<String>(validators: []) this.teamOneName,
      @HiveField(4) @RfControl<String>() this.teamTwoName,
      @HiveField(5) @RfControl<int>() this.teamOneScore,
      @HiveField(6) @RfControl<int>() this.teamTwoScore,
      @HiveField(7) @RfControl<double>() this.betAmount,
      @HiveField(8) @RfControl<String>() this.prize,
      @HiveField(9) @RfControl<String>() this.remarks,
      @HiveField(10) @RfArray() final List<Slot> slotList = const [],
      @HiveField(11) this.createdAt,
      @HiveField(12) this.updatedAt})
      : _slotList = slotList;

  factory _$_ECard.fromJson(Map<String, dynamic> json) =>
      _$$_ECardFromJson(json);

  @override
  @HiveField(0)
  @RfControl<String>()
  final String? id;
  @override
  @HiveField(1)
  final DateTime? date;
  @override
  @HiveField(2)
  @RfControl<String>()
  final String? title;
  @override
  @HiveField(3)
  @RfControl<String>(validators: [])
  final String? teamOneName;
  @override
  @HiveField(4)
  @RfControl<String>()
  final String? teamTwoName;
  @override
  @HiveField(5)
  @RfControl<int>()
  final int? teamOneScore;
  @override
  @HiveField(6)
  @RfControl<int>()
  final int? teamTwoScore;
  @override
  @HiveField(7)
  @RfControl<double>()
  final double? betAmount;
  @override
  @HiveField(8)
  @RfControl<String>()
  final String? prize;
  @override
  @HiveField(9)
  @RfControl<String>()
  final String? remarks;
  final List<Slot> _slotList;
  @override
  @JsonKey()
  @HiveField(10)
  @RfArray()
  List<Slot> get slotList {
    if (_slotList is EqualUnmodifiableListView) return _slotList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slotList);
  }

  @override
  @HiveField(11)
  final DateTime? createdAt;
  @override
  @HiveField(12)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ECard(id: $id, date: $date, title: $title, teamOneName: $teamOneName, teamTwoName: $teamTwoName, teamOneScore: $teamOneScore, teamTwoScore: $teamTwoScore, betAmount: $betAmount, prize: $prize, remarks: $remarks, slotList: $slotList, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ECard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.teamOneName, teamOneName) ||
                other.teamOneName == teamOneName) &&
            (identical(other.teamTwoName, teamTwoName) ||
                other.teamTwoName == teamTwoName) &&
            (identical(other.teamOneScore, teamOneScore) ||
                other.teamOneScore == teamOneScore) &&
            (identical(other.teamTwoScore, teamTwoScore) ||
                other.teamTwoScore == teamTwoScore) &&
            (identical(other.betAmount, betAmount) ||
                other.betAmount == betAmount) &&
            (identical(other.prize, prize) || other.prize == prize) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            const DeepCollectionEquality().equals(other._slotList, _slotList) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      title,
      teamOneName,
      teamTwoName,
      teamOneScore,
      teamTwoScore,
      betAmount,
      prize,
      remarks,
      const DeepCollectionEquality().hash(_slotList),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ECardCopyWith<_$_ECard> get copyWith =>
      __$$_ECardCopyWithImpl<_$_ECard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ECardToJson(
      this,
    );
  }
}

abstract class _ECard implements ECard {
  factory _ECard(
      {@HiveField(0)
      @RfControl<String>()
          final String? id,
      @HiveField(1)
          final DateTime? date,
      @HiveField(2)
      @RfControl<String>()
          final String? title,
      @HiveField(3)
      @RfControl<String>(validators: [])
          final String? teamOneName,
      @HiveField(4)
      @RfControl<String>()
          final String? teamTwoName,
      @HiveField(5)
      @RfControl<int>()
          final int? teamOneScore,
      @HiveField(6)
      @RfControl<int>()
          final int? teamTwoScore,
      @HiveField(7)
      @RfControl<double>()
          final double? betAmount,
      @HiveField(8)
      @RfControl<String>()
          final String? prize,
      @HiveField(9)
      @RfControl<String>()
          final String? remarks,
      @HiveField(10)
      @RfArray()
          final List<Slot> slotList,
      @HiveField(11)
          final DateTime? createdAt,
      @HiveField(12)
          final DateTime? updatedAt}) = _$_ECard;

  factory _ECard.fromJson(Map<String, dynamic> json) = _$_ECard.fromJson;

  @override
  @HiveField(0)
  @RfControl<String>()
  String? get id;
  @override
  @HiveField(1)
  DateTime? get date;
  @override
  @HiveField(2)
  @RfControl<String>()
  String? get title;
  @override
  @HiveField(3)
  @RfControl<String>(validators: [])
  String? get teamOneName;
  @override
  @HiveField(4)
  @RfControl<String>()
  String? get teamTwoName;
  @override
  @HiveField(5)
  @RfControl<int>()
  int? get teamOneScore;
  @override
  @HiveField(6)
  @RfControl<int>()
  int? get teamTwoScore;
  @override
  @HiveField(7)
  @RfControl<double>()
  double? get betAmount;
  @override
  @HiveField(8)
  @RfControl<String>()
  String? get prize;
  @override
  @HiveField(9)
  @RfControl<String>()
  String? get remarks;
  @override
  @HiveField(10)
  @RfArray()
  List<Slot> get slotList;
  @override
  @HiveField(11)
  DateTime? get createdAt;
  @override
  @HiveField(12)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ECardCopyWith<_$_ECard> get copyWith =>
      throw _privateConstructorUsedError;
}
