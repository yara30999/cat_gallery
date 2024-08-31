// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_breed_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatBreedCardEntityAdapter extends TypeAdapter<CatBreedCardEntity> {
  @override
  final int typeId = 0;

  @override
  CatBreedCardEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatBreedCardEntity(
      breedId: fields[0] as String,
      breedName: fields[1] as String,
      referenceImgId: fields[2] as String,
      referenceImgurl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatBreedCardEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.breedId)
      ..writeByte(1)
      ..write(obj.breedName)
      ..writeByte(2)
      ..write(obj.referenceImgId)
      ..writeByte(3)
      ..write(obj.referenceImgurl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatBreedCardEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
