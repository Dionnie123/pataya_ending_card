import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'slot.dart';
part 'ecard.freezed.dart';
part 'ecard.g.dart';
part 'ecard.gform.dart';

@Freezed()
@HiveType(typeId: 0, adapterName: "ECardAdapter")
@Rf()
class ECard with _$ECard {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory ECard({
    @HiveField(0) @RfControl<String>() String? id,
    @HiveField(1) DateTime? date,
    @HiveField(2) @RfControl<String>() String? title,
    @HiveField(3) @RfControl<String>(validators: []) String? teamOneName,
    @HiveField(4) @RfControl<String>() String? teamTwoName,
    @HiveField(5) @RfControl<int>() int? teamOneScore,
    @HiveField(6) @RfControl<int>() int? teamTwoScore,
    @HiveField(7) @RfControl<double>() double? betAmount,
    @HiveField(8) @RfControl<String>() String? prize,
    @HiveField(9) @RfControl<String>() String? remarks,
    @HiveField(10) @Default([]) @RfArray() List<Slot> slotList,
    @HiveField(11) DateTime? createdAt,
    @HiveField(12) DateTime? updatedAt,
  }) = _ECard;

  factory ECard.fromJson(Map<String, dynamic> json) => _$ECardFromJson(json);
}
