// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:dragon_food/features/home/domain/entities/product.dart';
import 'package:dragon_food/features/home/domain/use_cases/find_daily_deal.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FindDailyDealUseCase usecase;
  HomeBloc({required this.usecase}) : super(FindDailyDealInitial()) {
    on<FindDailyDealEvent>((event, emit) async {
      final Product? product = (await usecase());

      emit(FindDailyDealLoader());

      if (product == null) {
        emit(const FindDailyDealException(message: 'deu erro manooo'));
      } else {
        emit(
          FindDailyDealLoaded(product: product),
        );
      }
    });
    on((event, emit) => 0);
  }
}
