// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../entities/product.dart';
import '../repositories/repository.dart';

class SearchProdutcUseCase {
  HomeRepository repository;
  SearchProdutcUseCase({
    required this.repository,
  });

  Future<List<Product>> listProduts() async {
    return await repository.getProducts();
  }
}
