class AuthServiceEvent {}

class LoginAuthServiceEvent extends AuthServiceEvent {
  final String email;
  final String password;
  LoginAuthServiceEvent(this.email, this.password);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginAuthServiceEvent &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password;

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
