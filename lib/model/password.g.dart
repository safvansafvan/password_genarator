// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasswordModelAdapter extends TypeAdapter<PasswordModel> {
  @override
  final int typeId = 1;

  @override
  PasswordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasswordModel(
      password: fields[1] as String,
      time: fields[2] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
