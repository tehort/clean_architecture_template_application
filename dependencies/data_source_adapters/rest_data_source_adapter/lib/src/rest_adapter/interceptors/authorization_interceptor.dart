import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rest_data_source_adapter/src/utils/utils.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor({
    required localStorageConstants,
  }) : _localStorageConstants = localStorageConstants;

  final Constants _localStorageConstants;
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey(_localStorageConstants.requireAuthorizationTokenHeaderKey)) {
      if (options.extra[_localStorageConstants.requireAuthorizationTokenHeaderKey] == true) {
        final token = await _readAuthTokenFromStorage();
        options.headers.addAll(
          {
            _localStorageConstants.authorizationTokenApiKey: 'Bearer $token',
          },
        );
      }

      options.extra.remove(_localStorageConstants.requireAuthorizationTokenHeaderKey);
    }
    return handler.next(options);
  }

  Future<String?> _readAuthTokenFromStorage() async {
    final value = await _storage.read(key: _localStorageConstants.authorizationTokenStorageKey);
    if (value != null) {
      final token = value;
      return token;
    } else {
      return null;
    }
  }
}
