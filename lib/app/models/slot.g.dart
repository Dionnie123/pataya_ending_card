// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SlotAdapter extends TypeAdapter<Slot> {
  @override
  final int typeId = 1;

  @override
  Slot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Slot(
      id: fields[0] as String?,
      name: fields[1] as String?,
      isPaid: fields[2] as bool?,
      isWinner: fields[3] as bool?,
      createdAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Slot obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isPaid)
      ..writeByte(3)
      ..write(obj.isWinner)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SlotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Slot _$$_SlotFromJson(Map<String, dynamic> json) => _$_Slot(
      id: json['id'] as String?,
      name: json['name'] as String?,
      isPaid: json['is_paid'] as bool? ?? false,
      isWinner: json['is_winner'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_SlotToJson(_$_Slot instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_paid': instance.isPaid,
      'is_winner': instance.isWinner,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
