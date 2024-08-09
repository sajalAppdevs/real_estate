class AuthFailedException {
  final String message = "Authentication Failed";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthFailedException &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class RegistrationFailedException {
  final String message = "User Registration Failed";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationFailedException &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
