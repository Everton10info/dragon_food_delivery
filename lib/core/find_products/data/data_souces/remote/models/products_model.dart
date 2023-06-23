import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String title;
  final String category;
  final String description;
  final int price;
  final String local;
  final String ingredients;
  final int deliveryPrice;
  final CachedNetworkImage cacheImage;

  ProductModel({
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.local,
    required this.ingredients,
    required this.deliveryPrice,
    required this.cacheImage,
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
      cacheImage: CachedNetworkImage(
        imageUrl: json['urlImage'],
        progressIndicatorBuilder: (context, url, progress) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 2,
              backgroundColor: Colors.amber,
            ),
          );
        },
      ),
    );
  }

  static List<ProductModel> productsCache = [];
}
