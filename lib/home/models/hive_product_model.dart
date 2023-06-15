import 'package:hive/hive.dart';

part 'hive_product_model.g.dart';

@HiveType(typeId: 0)
class LocalStoreProduct extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late double price;

  @HiveField(3)
  late String description;

  @HiveField(4)
  late String category;

  @HiveField(5)
  late String image;

  @HiveField(6)
  late RatingDataModel rating;
}

@HiveType(typeId: 1)
class RatingDataModel extends HiveObject {
  @HiveField(0)
  late double rate;

  @HiveField(1)
  late int count;
}
