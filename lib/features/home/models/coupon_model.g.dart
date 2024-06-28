// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CouponModelAdapter extends TypeAdapter<CouponModel> {
  @override
  final int typeId = 1;

  @override
  CouponModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CouponModel(
      couponId: fields[0] as String,
      title: fields[1] as String,
      couponDesc: fields[2] as String,
      date: fields[3] as String,
      storeId: fields[4] as String,
      imageUrl: fields[5] as String,
      storeName: fields[6] as String,
      storeUrl: fields[7] as String,
      categoryId: fields[8] as String,
      expire: fields[9] as String,
      ctype: fields[10] as String,
      exclusive: fields[11] as String?,
      used: fields[12] as String,
      couponCode: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CouponModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.couponId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.couponDesc)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.storeId)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.storeName)
      ..writeByte(7)
      ..write(obj.storeUrl)
      ..writeByte(8)
      ..write(obj.categoryId)
      ..writeByte(9)
      ..write(obj.expire)
      ..writeByte(10)
      ..write(obj.ctype)
      ..writeByte(11)
      ..write(obj.exclusive)
      ..writeByte(12)
      ..write(obj.used)
      ..writeByte(13)
      ..write(obj.couponCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CouponModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
