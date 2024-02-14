import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_with_bloc/src/bloc/login_event.dart';
import 'package:login_with_bloc/src/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      await Future.delayed(const Duration(seconds: 2));

      try {
        await Future.delayed(const Duration(seconds: 2));

        yield LoginSuccess();
      } catch (error) {
        yield const LoginFailure(error: "Login falhou. Tente novamente.");
      }
    }
  }
}
