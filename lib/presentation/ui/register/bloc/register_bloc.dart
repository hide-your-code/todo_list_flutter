import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/ui/register/bloc/register_event.dart';
import 'package:todo_list/presentation/ui/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterFieldUsername>(_onChangedUsername);
    on<RegisterFieldPassword>(_onChangedPassword);
    on<RegisterFieldConfirmPassword>(_onChangedConfirmPassword);
  }

  Future<void> _onChangedUsername(
    RegisterFieldUsername event,
    Emitter<RegisterState> emitter,
  ) async {
    bool isEnable = event.username.isNotEmpty &&
        state.password.isNotEmpty &&
        state.confirmPassword.isNotEmpty;

    return emitter(state.copyWith(
      username: event.username,
      isEnable: isEnable,
    ));
  }

  Future<void> _onChangedPassword(
    RegisterFieldPassword event,
    Emitter<RegisterState> emitter,
  ) async {
    bool isEnable = event.password.isNotEmpty &&
        state.username.isNotEmpty &&
        state.confirmPassword.isNotEmpty;

    return emitter(state.copyWith(
      password: event.password,
      isEnable: isEnable,
    ));
  }

  Future<void> _onChangedConfirmPassword(
    RegisterFieldConfirmPassword event,
    Emitter<RegisterState> emitter,
  ) async {
    bool isEnable = event.confirmPassword.isNotEmpty &&
        state.username.isNotEmpty &&
        state.password.isNotEmpty;

    return emitter(state.copyWith(
      confirmPassword: event.confirmPassword,
      isEnable: isEnable,
    ));
  }
}
