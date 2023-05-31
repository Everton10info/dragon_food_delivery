part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [FindCategoryEvent];
}

class FindCategoryEvent extends CategoriesEvent {
  final String category;

  const FindCategoryEvent({required this.category});
}
