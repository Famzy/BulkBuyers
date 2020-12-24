//// GENERATED CODE - DO NOT MODIFY BY HAND
//
//part of 'shop_hive_model.dart';
//
//// **************************************************************************
//// TypeAdapterGenerator
//// **************************************************************************
//
//class ShopHiveModleAdapter extends TypeAdapter<ShopHiveModle> {
//  @override
//  ShopHiveModle read(BinaryReader reader) {
//    var numOfFields = reader.readByte();
//    var fields = <int, dynamic>{
//      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//    };
//    return ShopHiveModle(
//      fields[0] as int,
//      fields[1] as int,
//      fields[2] as String,
//      fields[3] as String,
//      fields[4] as int,
//      fields[5] as int,
//      fields[6] as int,
//      fields[7] as bool,
//      fields[8] as String,
//    );
//  }
//
//  @override
//  void write(BinaryWriter writer, ShopHiveModle obj) {
//    writer
//      ..writeByte(9)
//      ..writeByte(0)
//      ..write(obj.productid)
//      ..writeByte(1)
//      ..write(obj.prodcatid)
//      ..writeByte(2)
//      ..write(obj.productname)
//      ..writeByte(3)
//      ..write(obj.description)
//      ..writeByte(4)
//      ..write(obj.price)
//      ..writeByte(5)
//      ..write(obj.discount)
//      ..writeByte(6)
//      ..write(obj.quantity)
//      ..writeByte(7)
//      ..write(obj.wishlist)
//      ..writeByte(8)
//      ..write(obj.productimg);
//  }
//}
