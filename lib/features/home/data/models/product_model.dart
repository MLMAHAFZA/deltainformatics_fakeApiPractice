import 'rate_model.dart';

class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RateModel? rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    title = json['title'] ?? '';
    price = double.parse(json['price']?.toString() ?? '0');
    description = json['description'] ?? '';
    category = json['category'] ?? '';
    image = json['image'] ?? '';
    rating = RateModel.fromJson(json['rating']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['title'] = title;
    json['price'] = price;
    json['description'] = description;
    json['category'] = category;
    json['image'] = image;
    json['rating'] = rating?.toJson();

    return json;
  }
}
