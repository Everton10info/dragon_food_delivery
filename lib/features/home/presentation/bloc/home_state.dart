// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class FindProductsInitial extends HomeState {}

class FindProductsLoader extends HomeState {}

class FindProductsLoaded extends HomeState {
  final Products products;
  const FindProductsLoaded({
    required this.products,
  });
}

class FindProductsException extends HomeState {
  final String message;

  const FindProductsException({required this.message});
}
