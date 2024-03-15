import 'package:authentication_repository/authentication_repository.dart';
import 'package:secure_local_storage_data_source_adapter/secure_local_storage_data_source_adapter.dart';

abstract class AuthenticationLocalDataSourceContract {
  Future<void> storeAuthorizationToken({
    required String value,
  });
  Future<void> storeRefreshToken({
    required String value,
  });

  Future<void> eraseAuthorizationToken();
  Future<void> eraseRefreshToken();

  Future<String?> readAuthorizationToken();
  Future<String?> readRefreshToken();
}

class AuthenticationLocalDataSourceImplementation implements AuthenticationLocalDataSourceContract {
  AuthenticationLocalDataSourceImplementation({
    required SecureLocalStorageAdapter secureLocalStorageAdapter,
  }) : _secureLocalStorageAdapter = secureLocalStorageAdapter;

  final SecureLocalStorageAdapter _secureLocalStorageAdapter;

  @override
  Future<void> eraseAuthorizationToken() async {
    await _secureLocalStorageAdapter.delete(
      key: LocalStorageConstants.authorizationTokenStorageKey,
    );
  }

  @override
  Future<void> eraseRefreshToken() async {
    await _secureLocalStorageAdapter.delete(
      key: LocalStorageConstants.refreshTokenStorageKey,
    );
  }

  @override
  Future<String?> readAuthorizationToken() async {
    final value = await _secureLocalStorageAdapter.read(
      key: LocalStorageConstants.authorizationTokenStorageKey,
    );

    return value;
  }

  @override
  Future<String?> readRefreshToken() async {
    final value = await _secureLocalStorageAdapter.read(
      key: LocalStorageConstants.refreshTokenStorageKey,
    );

    return value;
  }

  @override
  Future<void> storeAuthorizationToken({
    required String value,
  }) async {
    await _secureLocalStorageAdapter.write(
      key: LocalStorageConstants.authorizationTokenStorageKey,
      value: value,
    );
  }

  @override
  Future<void> storeRefreshToken({
    required String value,
  }) async {
    await _secureLocalStorageAdapter.write(
      key: LocalStorageConstants.refreshTokenStorageKey,
      value: value,
    );
  }
}
