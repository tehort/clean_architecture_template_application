import 'package:data/core/rest_client.dart';
import 'package:dio/dio.dart';

class RestClientImplementation extends RestClient {
  RestClientImplementation({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<Response<T>> get<T>({
    required String path,
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _dio.options.baseUrl = baseUrl;
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response<T>> post<T>({
    required String path,
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _dio.options.baseUrl = baseUrl;
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response<T>> put<T>({
    required String path,
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _dio.options.baseUrl = baseUrl;
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response<T>> delete<T>({
    required String path,
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _dio.options.baseUrl = baseUrl;
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
