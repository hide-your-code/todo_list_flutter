abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterFieldUsername extends RegisterEvent {
  final String username;

  const RegisterFieldUsername(this.username);
}

class RegisterFieldPassword extends RegisterEvent {
  final String password;

  const RegisterFieldPassword(this.password);
}

class RegisterFieldConfirmPassword extends RegisterEvent {
  final String confirmPassword;

  const RegisterFieldConfirmPassword(this.confirmPassword);
}
