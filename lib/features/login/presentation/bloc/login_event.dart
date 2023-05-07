// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [Auth];
}

class Auth extends LoginEvent {
  final String email;
  final String password;
  const Auth(
    this.email,
    this.password,
  );
}
