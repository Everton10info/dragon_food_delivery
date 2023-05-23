import 'package:cached_network_image/cached_network_image.dart';

class Products {
  final String title;
  final String category;
  final String description;
  final int price;
  final String local;
  final String ingredients;
  final int deliveryPrice;
  final CachedNetworkImage cacheImage;

  Products({
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.local,
    required this.ingredients,
    required this.deliveryPrice,
    required this.cacheImage,
  });
}
