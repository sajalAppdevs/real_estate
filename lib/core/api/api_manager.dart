import 'dart:io';

import 'package:real_estate/core/api/interceptor.dart';
import 'package:real_estate/core/logger/init_logger.dart';
import 'package:real_estate/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManager with AppLogger {
  late final Dio _dio;
  late final Dio _tokenDio;

  ApiManager({
    this.userAgent,
    this.packageInfo,
    required this.baseUrl,
  }) {
    final logInterceptor = PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      error: true,
      request: false,
      requestHeader: false,
      responseHeader: false,
      maxWidth: 120,
    );

    final dioOptions = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      headers: {
        "Accept": "application/json",
        "X-Server-Select": "staging",
      },
    );

    _dio = Dio(dioOptions);
    _tokenDio = Dio(dioOptions);
    _addPackageHeaders(_dio, packageInfo, userAgent);
    _addPackageHeaders(_tokenDio, packageInfo, userAgent);

    _dio.interceptors.add(ApiInterceptor(_dio, _tokenDio));
    _dio.interceptors.add(logInterceptor);
    _tokenDio.interceptors.add(logInterceptor);
  }

  // final DeviceModel? activeDevice;
  final String baseUrl;
  final PackageInfo? packageInfo;
  final String? userAgent;

  void _addPackageHeaders(
      Dio dio, PackageInfo? packageInfo, String? userAgent) {
    String packageName = packageInfo?.packageName ?? "";
    String version = packageInfo?.version ?? "";
    String buildNumber = packageInfo?.buildNumber ?? "";
    dio.options.headers["X-App-Package-Name"] = packageName;
    dio.options.headers["X-App-Version"] = version;
    dio.options.headers["X-App-Build-Number"] = buildNumber;
    dio.options.headers[HttpHeaders.userAgentHeader] = userAgent;
  }

  Future<Map<String, dynamic>> post(String endpoint,
      {required dynamic body}) async {
    var result = <String, dynamic>{};
    try {
      Response response = await _dio.post(endpoint, data: body);

      if (successCodes.containsKey(response.statusCode)) {
        result = {
          'status': true,
          'error': false,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      } else {
        result = {
          'status': false,
          'error': true,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      }
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic> param = const {},
  }) async {
    try {
      Response response = await _dio.get(endpoint, queryParameters: param);
      if (successCodes.containsKey(response.statusCode)) {
        return {
          'status': true,
          'error': false,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      } else {
        return {
          'status': false,
          'error': true,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      }
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(
    String endpoint, {
    required dynamic body,
    Map<String, dynamic>? param,
  }) async {
    var result = <String, dynamic>{};
    try {
      Response response =
          await _dio.put(endpoint, queryParameters: param, data: body);
      if (successCodes.containsKey(response.statusCode)) {
        result = {
          'status': true,
          'error': false,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      } else {
        result = {
          'status': false,
          'error': true,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      }
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<Map<String, dynamic>> postWithFormData(String endpoint,
      {required FormData body}) async {
    return await Future.delayed(const Duration(milliseconds: 100), () {
      return <String, dynamic>{};
    });
  }

  Future<Map<String, dynamic>> putWithFormData(String endpoint,
      {Map<String, dynamic>? body, FormData? data}) async {
    var result = <String, dynamic>{};
    try {
      Response response =
          await _dio.put(endpoint, data: data, queryParameters: body);
      if (successCodes.containsKey(response.statusCode)) {
        result = {
          'status': true,
          'error': false,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      } else {
        result = {
          'status': false,
          'error': true,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      }
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, dynamic> body = const {},
  }) async {
    var result = <String, dynamic>{};
    try {
      Response response = await _dio.delete(endpoint);

      if (successCodes.containsKey(response.statusCode)) {
        result = {
          'status': true,
          'error': false,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      } else {
        result = {
          'status': false,
          'error': true,
          'data': response.data,
          'statusCode': response.statusCode,
        };
      }
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  // void setActiveProfile(int profileId) {
  //   _dio.options.headers["X-Active-Profile"] = profileId;
  //   _tokenDio.options.headers["X-Active-Profile"] = profileId;
  // }
}
