// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_bot_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActiveBotModelAdapter extends TypeAdapter<ActiveBotModel> {
  @override
  final int typeId = 0;

  @override
  ActiveBotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActiveBotModel(
      productID: fields[0] as String,
      botType: fields[1] as String,
      type: fields[2] as String,
      power: fields[3] as String,
      machineType: fields[4] as String,
      duration: fields[5] as int,
      addTime: fields[6] as int,
      expireTime: fields[7] as int,
      days: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ActiveBotModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.productID)
      ..writeByte(1)
      ..write(obj.botType)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.power)
      ..writeByte(4)
      ..write(obj.machineType)
      ..writeByte(5)
      ..write(obj.duration)
      ..writeByte(6)
      ..write(obj.addTime)
      ..writeByte(7)
      ..write(obj.expireTime)
      ..writeByte(8)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActiveBotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
