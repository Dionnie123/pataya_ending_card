// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ECardAdapter extends TypeAdapter<ECard> {
  @override
  final int typeId = 0;

  @override
  ECard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ECard(
      id: fields[0] as String?,
      date: fields[1] as DateTime?,
      title: fields[2] as String?,
      teamOneName: fields[3] as String?,
      teamTwoName: fields[4] as String?,
      teamOneScore: fields[5] as int?,
      teamTwoScore: fields[6] as int?,
      betAmount: fields[7] as double?,
      prize: fields[8] as String?,
      remarks: fields[9] as String?,
      slotList: (fields[10] as List).cast<Slot>(),
      createdAt: fields[11] as DateTime?,
      updatedAt: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ECard obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.teamOneName)
      ..writeByte(4)
      ..write(obj.teamTwoName)
      ..writeByte(5)
      ..write(obj.teamOneScore)
      ..writeByte(6)
      ..write(obj.teamTwoScore)
      ..writeByte(7)
      ..write(obj.betAmount)
      ..writeByte(8)
      ..write(obj.prize)
      ..writeByte(9)
      ..write(obj.remarks)
      ..writeByte(10)
      ..write(obj.slotList)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ECardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ECard _$$_ECardFromJson(Map<String, dynamic> json) => _$_ECard(
      id: json['id'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      title: json['title'] as String?,
      teamOneName: json['team_one_name'] as String?,
      teamTwoName: json['team_two_name'] as String?,
      teamOneScore: json['team_one_score'] as int?,
      teamTwoScore: json['team_two_score'] as int?,
      betAmount: (json['bet_amount'] as num?)?.toDouble(),
      prize: json['prize'] as String?,
      remarks: json['remarks'] as String?,
      slotList: (json['slot_list'] as List<dynamic>?)
              ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_ECardToJson(_$_ECard instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'title': instance.title,
      'team_one_name': instance.teamOneName,
      'team_two_name': instance.teamTwoName,
      'team_one_score': instance.teamOneScore,
      'team_two_score': instance.teamTwoScore,
      'bet_amount': instance.betAmount,
      'prize': instance.prize,
      'remarks': instance.remarks,
      'slot_list': instance.slotList,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
