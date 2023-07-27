import '../../../../core/find_products/data/data_souces/remote/models/products_model.dart';
import '../../../../core/find_products/data/data_souces/remote/remote_data_source.dart';

class HomeDataSource {
  final ProductsDataSource productsDataSource;

  HomeDataSource({
    required this.productsDataSource,
  });

  Future<List<ProductModel>> findProducts() async {
    return await productsDataSource.getProducts();
  }
}
