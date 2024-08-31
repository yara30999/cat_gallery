// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthenticationEntityAdapter extends TypeAdapter<AuthenticationEntity> {
  @override
  final int typeId = 1;

  @override
  AuthenticationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthenticationEntity(
      uid: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      countryMobileCode: fields[3] as String,
      phoneNum: fields[4] as String,
      gender: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthenticationEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.countryMobileCode)
      ..writeByte(4)
      ..write(obj.phoneNum)
      ..writeByte(5)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthenticationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
