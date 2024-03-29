import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/session/manager_session/manager_session.dart';
import '../../domain/use_cases/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login usecase;

  LoginBloc({required this.usecase}) : super(LoginInitial()) {
    on<Auth>((event, emit) async {
      emit(LoginLoad());

      await Future.delayed(const Duration(seconds: 1));
      try {
        final result = await usecase(event.email, event.password);

        if (result == true) {
          await Session.getVerifyToken();
          emit(LoginLoaded());
        } else {
          emit(LoginFailure(message: result));
        }
      } catch (e) {
        emit(const LoginException(
            message: 'Erro no servidor, tente mais tarde!'));
      }
    });
  }
}
