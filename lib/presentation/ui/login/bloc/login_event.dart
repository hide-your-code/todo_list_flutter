abstract class LoginEvent {
  const LoginEvent();
}

class LoginFieldUsername extends LoginEvent {
  final String username;

  const LoginFieldUsername({required this.username});
}

class LoginFieldPassword extends LoginEvent {
  final String password;

  const LoginFieldPassword({required this.password});
}
