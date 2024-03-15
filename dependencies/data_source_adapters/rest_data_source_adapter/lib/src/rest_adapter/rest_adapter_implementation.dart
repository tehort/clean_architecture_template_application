import 'package:dio/dio.dart';
import 'package:rest_data_source_adapter/rest_adapter.dart';
import 'package:rest_data_source_adapter/src/rest_adapter/interceptors/authorization_interceptor.dart';
import 'package:rest_data_source_adapter/src/rest_adapter/interceptors/refresh_token_interceptor.dart';

class RestAdapterImplementation extends RestAdapter {
  RestAdapterImplementation({
    required localStorageConstants,
  })  : _dio = Dio(),
        _localStorageConstants = localStorageConstants {
    _dio.interceptors.addAll([
      RefreshTokenInterceptor(localStorageConstants: localStorageConstants),
      AuthorizationInterceptor(localStorageConstants: localStorageConstants),
    ]);
  }

  final Dio _dio;
  final Constants _localStorageConstants;

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
          _localStorageConstants.requireAuthorizationTokenHeaderKey: requiresAuthToken,
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
    bool requiresRefreshToken = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _dio.options.baseUrl = baseUrl;
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        extra: <String, Object?>{
          _localStorageConstants.requireAuthorizationTokenHeaderKey: requiresAuthToken,
          _localStorageConstants.requireRefreshTokenOptionKey: requiresRefreshToken,
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
          _localStorageConstants.requireAuthorizationTokenHeaderKey: requiresAuthToken,
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
          _localStorageConstants.requireAuthorizationTokenHeaderKey: requiresAuthToken,
        },
      ),
    );
  }
}
