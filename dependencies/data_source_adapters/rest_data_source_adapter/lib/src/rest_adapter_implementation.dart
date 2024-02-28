import 'package:dio/dio.dart';
import 'package:rest_data_source_adapter/rest_adapter.dart';

class RestAdapterImplementation extends RestAdapter {
  RestAdapterImplementation() : _dio = Dio();

  final Dio _dio;

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
          'requiresAuthToken': requiresAuthToken,
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
          'requiresAuthToken': requiresAuthToken,
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
          'requiresAuthToken': requiresAuthToken,
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
          'requiresAuthToken': requiresAuthToken,
        },
      ),
    );
  }
}
