class ProductDataModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  RatingDataModel rating;

  ProductDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: RatingDataModel.fromJson(json['rating']),
    );
  }
}

class RatingDataModel {
  double rate;
  int count;

  RatingDataModel({
    required this.rate,
    required this.count,
  });

  factory RatingDataModel.fromJson(Map<String, dynamic> json) {
    return RatingDataModel(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
