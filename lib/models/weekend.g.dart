// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekend.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeekendAdapter extends TypeAdapter<Weekend> {
  @override
  final int typeId = 1;

  @override
  Weekend read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weekend(
      id: fields[0] as String,
      title: fields[1] as String,
      expenses: (fields[2] as List).cast<Expense>(),
    );
  }

  @override
  void write(BinaryWriter writer, Weekend obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.expenses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekendAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
