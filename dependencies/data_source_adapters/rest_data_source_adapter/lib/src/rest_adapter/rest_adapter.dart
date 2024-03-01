import 'package:dio/dio.dart';

export 'rest_adapter_implementation.dart';

abstract class RestAdapter {
  Future<Response<T>> get<T>({
    required String path,
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = true,
  });

  Future<Response<T>> post<T>({
    required String path,
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = true,
  });

  Future<Response<T>> put<T>({
    required String path,
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = true,
  });

  Future<Response<T>> delete<T>({
    required String path,
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuthToken = true,
  });
}
