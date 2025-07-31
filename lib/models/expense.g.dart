// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final int typeId = 0;

  @override
  Expense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expense(
      name: fields[1] as String,
      amount: fields[2] as double,
      currency: fields[3] as String,
      date: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.currency)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeekendExpenseAdapter extends TypeAdapter<WeekendExpense> {
  @override
  final int typeId = 1;

  @override
  WeekendExpense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeekendExpense(
      name: fields[1] as String,
      amount: fields[2] as double,
      currency: fields[3] as String,
      date: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, WeekendExpense obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.currency)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekendExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BudgetExpenseAdapter extends TypeAdapter<BudgetExpense> {
  @override
  final int typeId = 2;

  @override
  BudgetExpense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetExpense(
      name: fields[1] as String,
      amount: fields[2] as double,
      currency: fields[3] as String,
      category: fields[5] as String,
      type: fields[6] as String,
      date: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetExpense obj) {
    writer
      ..writeByte(7)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.currency)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
