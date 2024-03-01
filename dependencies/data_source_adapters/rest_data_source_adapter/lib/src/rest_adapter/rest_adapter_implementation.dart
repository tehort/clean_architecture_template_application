import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:rest_data_source_adapter/rest_adapter.dart';
import 'package:rest_data_source_adapter/src/rest_adapter/interceptors/authentication_interceptor.dart';

class RestAdapterImplementation extends RestAdapter {
  RestAdapterImplementation({
    required localStorageConstants,
  })  : _dio = Dio(),
        _localStorageConstants = localStorageConstants {
    _dio.interceptors.addAll([
      AuthenticationInterceptor(localStorageConstants: localStorageConstants),
      CookieManager(CookieJar()),
    ]);
  }

  final Dio _dio;
  final LocalStorageConstants _localStorageConstants;

  @override
  Future<Response<T>> get<T>({
    required String path,
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = true,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _dio.options.baseUrl = baseUrl;
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: Options(
        extra: <String, Object?>{
          _localStorageConstants.requiresTokenAuthorizationKey: requiresAuthToken,
        },
      ),
    );
  }

  @override
  Future<Response<T>> post<T>({
    required String path,
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = true,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _dio.options.baseUrl = baseUrl;
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        extra: <String, Object?>{
          _localStorageConstants.requiresTokenAuthorizationKey: requiresAuthToken,
          // 'Cookie': 'JSESSIONID=1234567890',
        },
      ),
    );
  }

  @override
  Future<Response<T>> put<T>({
    required String path,
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = true,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _dio.options.baseUrl = baseUrl;
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        extra: <String, Object?>{
          _localStorageConstants.requiresTokenAuthorizationKey: requiresAuthToken,
        },
      ),
    );
  }

  @override
  Future<Response<T>> delete<T>({
    required String path,
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = true,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _dio.options.baseUrl = baseUrl;
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        extra: <String, Object?>{
          _localStorageConstants.requiresTokenAuthorizationKey: requiresAuthToken,
        },
      ),
    );
  }
}
