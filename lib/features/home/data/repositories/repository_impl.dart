import 'package:dragon_food/features/home/domain/entities/product.dart';

import '../../../../core/data/data_souces/remote/models/products_model.dart';
import '../../domain/repositories/repository.dart';
import '../data_sources/remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({
    required this.homeDataSource,
  });
  @override
  Future<List<Product>> getProducts() async {
    List<Product> productsEntity = [];
    final List<ProductModel> products = await homeDataSource.findProducts();

    for (var product in products) {
      Product entity = Product(
          title: product.title,
          category: product.category,
          description: product.description,
          price: product.price,
          local: product.local,
          ingredients: product.ingredients,
          deliveryPrice: product.deliveryPrice,
          cacheImage: product.cacheImage);

      productsEntity.add(entity);
    }

    return productsEntity;
  }
}
