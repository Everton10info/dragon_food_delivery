import 'package:dragon_food/features/home/domain/entities/products.dart';

import '../../domain/repositories/repository.dart';
import '../datas_ources/remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final AppHttpClientFindProducts appHttpClient;

  ProductsRepositoryImpl({
    required this.appHttpClient,
  });
  @override
  Future<List<Products>> getProducts() async {
    return await appHttpClient.getProducts();
  }
}
