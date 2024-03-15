import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rest_data_source_adapter/src/utils/utils.dart';

class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor({
    required localStorageConstants,
  }) : _localStorageConstants = localStorageConstants;

  final Constants _localStorageConstants;
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey(_localStorageConstants.requireRefreshTokenOptionKey)) {
      if (options.extra[_localStorageConstants.requireRefreshTokenOptionKey] == true) {
        final refreshToken = await _readRefreshTokenFromStorage();
        options.data = {
          _localStorageConstants.refreshTokenApiKey: refreshToken,
        };
      }

      options.extra.remove(_localStorageConstants.requireRefreshTokenOptionKey);
    }
    return handler.next(options);
  }

  Future<String?> _readRefreshTokenFromStorage() async {
    final value = await _storage.read(key: _localStorageConstants.refreshTokenStorageKey);
    if (value != null) {
      final token = value;
      return token;
    } else {
      return null;
    }
  }
}
