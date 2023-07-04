import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
part 'slot.freezed.dart';
part 'slot.g.dart';

@Freezed()
@HiveType(typeId: 2, adapterName: "SlotAdapter")
@FormGroupAnnotation()
class Slot with _$Slot {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory Slot({
    @HiveField(0) String? id,
    @HiveField(1) @FormControlAnnotation() String? name,
    @HiveField(2) @Default(false) @FormControlAnnotation() bool? isPaid,
    @HiveField(3) @Default(false) bool? isWinner,
    @HiveField(4) DateTime? createdAt,
    @HiveField(5) DateTime? updatedAt,
  }) = _Slot;

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
}
