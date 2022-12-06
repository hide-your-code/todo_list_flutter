import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String username;
  final String password;
  final bool isEnable;

  const LoginState({
    this.isEnable = false,
    this.username = '',
    this.password = '',
  });

  LoginState copyWith({
    bool? isEnable,
    String? username,
    String? password,
  }) =>
      LoginState(
        isEnable: isEnable ?? this.isEnable,
        username: username ?? this.username,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props => [
        isEnable,
        username,
        password,
      ];
}
