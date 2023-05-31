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
    final list = await repository.getProducts();

    for (var element in list) {
      if (element.category == category) {
        categoryList.add(element);
      }
    }
    return categoryList;
  }
}
