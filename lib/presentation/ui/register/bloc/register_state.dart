import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final String username;
  final String password;
  final String confirmPassword;
  final bool isEnable;

  const RegisterState({
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.isEnable = false,
  });

  RegisterState copyWith({
    String? username,
    String? password,
    String? confirmPassword,
    bool? isEnable, 
  }) =>
      RegisterState(
        username: username ?? this.username,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        isEnable: isEnable ?? this.isEnable,
      );

  @override
  List<Object?> get props => [
        username,
        password,
        confirmPassword,
        isEnable,
      ];
}
