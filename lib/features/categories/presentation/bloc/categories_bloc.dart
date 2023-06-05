// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/categories_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final FindCategoryUseCase findCategoryUseCase;
  CategoriesBloc({required this.findCategoryUseCase})
      : super(CategoriesInitial()) {
    on<FindCategoryEvent>((event, emit) async {
      List<Product> listCategory = await findCategoryUseCase(event.category);

      emit(CategoryLoadedState(listCategory: listCategory));
    });
  }
}
