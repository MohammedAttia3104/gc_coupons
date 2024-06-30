// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreDataModelAdapter extends TypeAdapter<StoreDataModel> {
  @override
  final int typeId = 2;

  @override
  StoreDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreDataModel(
      storeId: fields[0] as int,
      storeImage: fields[1] as String,
      storeUrl: fields[2] as String,
      storeName: fields[3] as String,
      slug: fields[4] as String,
      count: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StoreDataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.storeId)
      ..writeByte(1)
      ..write(obj.storeImage)
      ..writeByte(2)
      ..write(obj.storeUrl)
      ..writeByte(3)
      ..write(obj.storeName)
      ..writeByte(4)
      ..write(obj.slug)
      ..writeByte(5)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
