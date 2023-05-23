import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
    required super.cacheImage,
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
}
