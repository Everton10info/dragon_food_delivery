import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';
import '../../domain/use_cases/find_products.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashProductsUseCase usecase;
  SplashBloc({required this.usecase}) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      final List<Product> product = (await usecase());

      if (product.isEmpty) {
        emit(const SplashProductsExceptionState(message: 'deu erro manooo'));
      } else {
        emit(
          SplashProductsLoadedState(),
        );
      }
    });
  }
}
