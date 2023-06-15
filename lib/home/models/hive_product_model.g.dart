// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalStoreProductAdapter extends TypeAdapter<LocalStoreProduct> {
  @override
  final int typeId = 0;

  @override
  LocalStoreProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalStoreProduct(
      id: fields[0] as int,
      title: fields[1] as String,
      price: fields[2] as double,
      description: fields[3] as String,
      category: fields[4] as String,
      image: fields[5] as String,
      rating: fields[6] as RatingDataModel,
    );
  }

  @override
  void write(BinaryWriter writer, LocalStoreProduct obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalStoreProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RatingDataModelAdapter extends TypeAdapter<RatingDataModel> {
  @override
  final int typeId = 1;

  @override
  RatingDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingDataModel(
      rate: fields[0] as double,
      count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RatingDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.rate)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
