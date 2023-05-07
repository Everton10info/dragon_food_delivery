// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [
        LoginInitial,
        LoginLoad,
        LoginLoaded,
        LoginFailure,
        LoginException,
      ];
}

class LoginInitial extends LoginState {}

class LoginLoad extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure({
    required this.message,
  });
}

class LoginException extends LoginState {
  final String message;
  const LoginException({
    required this.message,
  });
}
