import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rest_data_source_adapter/src/utils/utils.dart';

class AuthenticationInterceptor extends Interceptor {
  AuthenticationInterceptor({
    required localStorageConstants,
  }) : _localStorageConstants = localStorageConstants;

  final LocalStorageConstants _localStorageConstants;
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey(_localStorageConstants.requiresTokenAuthorizationKey)) {
      if (options.extra[_localStorageConstants.requiresTokenAuthorizationKey] == true) {
        final token = await _readAuthToken();
        options.headers.addAll(
          <String, Object?>{'Authorization': 'Bearer $token'},
        );
      }

      options.extra.remove(_localStorageConstants.requiresTokenAuthorizationKey);
    }
    return handler.next(options);
  }

  Future<String?> _readAuthToken() async {
    final value = await _storage.read(key: _localStorageConstants.authorizationTokenKey);
    if (value != null) {
      final token = json.decode(value)['jwtToken'];
      return token;
    } else {
      return null;
    }
  }
}
