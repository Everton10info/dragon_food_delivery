import 'package:bloc/bloc.dart';
import 'package:dragon_food/core/sources/remote/client.dart';
import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/data/repositories/repository_impl.dart';
import 'package:dragon_food/features/login/domain/use_cases/login.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final usecase = Login(
    RepositoryImpl(
      AppHttpClientLogin(
        AppClient(),
      ),
    ),
  );
  LoginBloc() : super(LoginInitial()) {
    on<Auth>((event, emit) async {
      emit(LoginLoad());

      await Future.delayed(const Duration(seconds: 1));
      try {
        final result = await usecase(event.email, event.password);
        if (result == true) {
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
