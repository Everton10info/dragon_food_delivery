import '../../../../core/find_products/data/data_souces/remote/models/products_model.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote_data_source.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesDataSource categoriesDataSource;

  CategoriesRepositoryImpl({
    required this.categoriesDataSource,
  });
  @override
  Future<List<Product>> getProducts() async {
    List<Product> productsEntity = [];
    final List<ProductModel> products =
        await categoriesDataSource.findProducts();

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
