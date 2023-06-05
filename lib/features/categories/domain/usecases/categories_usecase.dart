// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../entities/product.dart';
import '../repositories/repository.dart';

class FindCategoryUseCase {
  final CategoriesRepository repository;
  final List<Product> categoryList = [];

  FindCategoryUseCase({
    required this.repository,
  });

  Future<List<Product>> call(String category) async {
    final listProducts = await repository.getProducts();
    List<Product> listTemp = [];

    for (var element in listProducts) {
      if (element.category == category) {
        listTemp.add(element);
      }
    }
    if (listTemp.length > categoryList.length) {
      categoryList.addAll(listTemp);
    }
    return categoryList;
  }
}
