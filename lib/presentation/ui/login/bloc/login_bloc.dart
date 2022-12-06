import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/ui/login/bloc/login_event.dart';
import 'package:todo_list/presentation/ui/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginFieldUsername>(_onChangeUsername);
    on<LoginFieldPassword>(_onChangePassword);
  }

  Future<void> _onChangeUsername(
    LoginFieldUsername event,
    Emitter<LoginState> emitter,
  ) async {
    final bool isEnable = event.username.isNotEmpty && state.password.isNotEmpty;

    return emitter(state.copyWith(
      username: event.username,
      isEnable: isEnable,
    ));
  }

  Future<void> _onChangePassword(
    LoginFieldPassword event,
    Emitter<LoginState> emitter,
  ) async {
    final bool isEnable = event.password.isNotEmpty && state.username.isNotEmpty;

    return emitter(state.copyWith(
      password: event.password,
      isEnable: isEnable,
    ));
  }
}
