import 'package:dio/dio.dart';

class NeedsOtpException {
  final DioException e;

  NeedsOtpException(this.e);
}

class InvalidTokenException {
  final DioException e;

  InvalidTokenException(this.e);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvalidTokenException &&
          runtimeType == other.runtimeType &&
          e == other.e;

  @override
  int get hashCode => e.hashCode;

  @override
  String toString() {
    return 'InvalidTokenException{e: $e}';
  }
}
