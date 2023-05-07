import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_products_event.dart';
part 'show_products_state.dart';

class ShowProductsBloc extends Bloc<ShowProductsEvent, ShowProductsState> {
  ShowProductsBloc() : super(ShowProductsInitial()) {
    on<ShowProductsEvent>((event, emit) {});
  }
}
