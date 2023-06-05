part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [CategoryLoadedState];
}

class CategoriesInitial extends CategoriesState {}

class CategoryLoadedState extends CategoriesState {
  final List<Product> listCategory;

  const CategoryLoadedState({
    required this.listCategory,
  });
}
