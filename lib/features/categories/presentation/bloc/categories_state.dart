part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoryLoaded extends CategoriesState {
  final List<Product> listCategory;

  const CategoryLoaded({
    required this.listCategory,
  });
}
