import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:real_estate/core/logger/init_logger.dart';

class BiometricHandler with AppLogger {
  bool? _canCheckBiometrics;
  late LocalAuthentication _localAuth;
  SupportState _supportState = SupportState.unknown;
  ValueNotifier authenticating = ValueNotifier(false);
  ValueNotifier authorized = ValueNotifier(false);

  bool? get canCheckBiometrics => _canCheckBiometrics;

  SupportState get supportState => _supportState;

  BiometricHandler() {
    _localAuth = LocalAuthentication();
    _checkBiometrics();
  }

  Future<void> _checkBiometrics() async {
    try {
      _canCheckBiometrics = await _localAuth.canCheckBiometrics;
      _localAuth.isDeviceSupported().then((supported) {
        _supportState =
            supported ? SupportState.supported : SupportState.unsupported;
      });
    } on PlatformException catch (e) {
      _canCheckBiometrics = false;
      log.e(e);
    }
  }

  Future<bool> checkBiometrics() async {
    try {
      return await _localAuth.canCheckBiometrics;
    } on PlatformException catch (e) {
      log.i(e);
      _canCheckBiometrics = false;
      rethrow;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      log.e(e);
      return [];
    }
  }

  Future<bool> authenticate() async {
    try {
      authenticating.value = true;
      authorized.value = AuthorizationStatus.authenticating.value;
      final authenticated = await _localAuth.authenticate(
        localizedReason: "Scan your face or fingerprint to authenticate",
      );
      authorized.value = authenticated
          ? AuthorizationStatus.authorized.value
          : AuthorizationStatus.unauthorized.value;
      return authenticated;
    } on PlatformException catch (e) {
      log.i(e);
      authorized.value = AuthorizationStatus.undefined.value;
      return false;
    } finally {
      authenticating.value = false;
    }
  }

  Future<void> cancelAuthentication() async {
    await _localAuth.stopAuthentication();
    authenticating.value = false;
  }
}

enum SupportState { unknown, supported, unsupported }

enum AuthorizationStatus { authenticating, authorized, unauthorized, undefined }

extension AuthStatusExt on AuthorizationStatus {
  String get value {
    switch (this) {
      case AuthorizationStatus.authenticating:
        return "Authenticating";
      case AuthorizationStatus.authorized:
        return "Authorized";
      case AuthorizationStatus.unauthorized:
        return "Not authorized";
      case AuthorizationStatus.undefined:
        return "Undefined";
    }
  }
}
