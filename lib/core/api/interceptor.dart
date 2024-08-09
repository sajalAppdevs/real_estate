import 'dart:io';

import 'package:dio/dio.dart';
import 'package:real_estate/core/api/exceptions/exceptions.dart';
import 'package:real_estate/core/preferences/auth_preference.dart';
import 'package:real_estate/core/services/service_locator.dart';

class ApiInterceptor extends Interceptor {
  final Dio dio;
  final Dio tokenDio;

  final AuthPreferences pref;

  ApiInterceptor(this.dio, this.tokenDio) : pref = app<AuthPreferences>();

  // @override
  // void onRequest(
  //     RequestOptions options, RequestInterceptorHandler handler) async {
  //   try {
  //     /// CHECK IF EXPIRY DATE IS VALID
  //     final expiryTime = pref.expirationDuration;
  //     if (expiryTime > 0) {
  //       final expiryToDate =
  //           DateTime.fromMillisecondsSinceEpoch(expiryTime * 1000);
  //       final minutesToExpiry =
  //           expiryToDate.toLocal().difference(DateTime.now()).inMinutes;

  //       if (minutesToExpiry < 30) {
  //         await refreshToken();
  //       }
  //     }
  //     final accessToken = pref.accessToken;
  //     final profileId = pref.accountProfileId;
  //     if (profileId != 0) {
  //       dio.options.headers["X-Active-Profile"] = profileId;
  //       tokenDio.options.headers["X-Active-Profile"] = profileId;
  //     }
  //     if (accessToken.isNotEmpty) {
  //       options.headers["Authorization"] = "Bearer $accessToken";
  //     }
  //     return handler.next(options);
  //   } catch (e, _) {
  //     Logger().i("Error adding Token to request due to $e");
  //     rethrow;
  //   }
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        throw (TimeOutException(err.requestOptions, err.response));
      case DioExceptionType.sendTimeout:
        throw (err);
      case DioExceptionType.receiveTimeout:
        throw (err);
      case DioExceptionType.badCertificate:
        throw (err);
      case DioExceptionType.badResponse:
        if (err.response?.statusCode == 401) {
          throw (UnauthorizedException(err.requestOptions, err.response));
        }
        throw (BadResponseException(err.requestOptions, err.response));
      case DioExceptionType.cancel:
        throw (err);
      case DioExceptionType.connectionError:
        throw (err);
      case DioExceptionType.unknown:
        if (err.error is SocketException) {
          throw (ConnectionException(err.requestOptions, err.response));
        }
        throw (UnknownErrorException(err.requestOptions, err.response));
    }
  }
}
