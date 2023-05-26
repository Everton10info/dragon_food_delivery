part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashProductsLoadedState extends SplashState {}

class SplashProductsExceptionState extends SplashState {
  final String message;

  const SplashProductsExceptionState({required this.message});
}
