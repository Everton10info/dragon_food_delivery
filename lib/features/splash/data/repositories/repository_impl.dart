import '../../../../core/find_products/data/data_souces/remote/models/products_model.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote_data_source.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashDataSource splashDataSource;

  SplashRepositoryImpl({required this.splashDataSource});

  @override
  Future<List<Product>> getProducts() async {
    final List<Product> productsEntity = [];
    final List<ProductModel> products = await splashDataSource.findProducts();

    for (var product in products) {
      final Product entity = Product(
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
