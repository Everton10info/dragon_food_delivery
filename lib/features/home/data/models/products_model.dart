import '../../domain/entities/products.dart';

class ProductModel extends Products {
  ProductModel({
    required super.title,
    required super.category,
    required super.description,
    required super.price,
    required super.local,
    required super.ingredients,
    required super.deliveryPrice,
    required super.urlImage,
  });
  factory ProductModel.fromJon(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      category: json['category'],
      description: json['description'],
      price: json['price'],
      local: json['local'],
      ingredients: json['ingredients'],
      deliveryPrice: json['deliveryPrice'],
      urlImage: json['urlImage'],
    );
  }
}
