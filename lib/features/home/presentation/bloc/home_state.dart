// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class FindDailyDealInitial extends HomeState {}

class FindDailyDealLoader extends HomeState {}

class FindDailyDealLoaded extends HomeState {
  final Product product;
  const FindDailyDealLoaded({
    required this.product,
  });
}

class Loged extends HomeState {
  final String message;

  const Loged({required this.message});
}

class FindDailyDealException extends HomeState {
  final String message;

  const FindDailyDealException({required this.message});
}
