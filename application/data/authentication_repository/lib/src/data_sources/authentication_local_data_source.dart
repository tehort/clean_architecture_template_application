import 'package:authentication_domain/authentication_domain.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:secure_local_storage_data_source_adapter/secure_local_storage_data_source_adapter.dart';

abstract class AuthenticationLocalDataSourceContract {
  Future<void> storeAuthInfo({
    required AuthenticationInfo value,
  });

  Future<void> eraseAuthInfo();

  Future<AuthenticationInfo?> readAuthInfo();
}

class AuthenticationLocalDataSourceImplementation implements AuthenticationLocalDataSourceContract {
  AuthenticationLocalDataSourceImplementation({
    required SecureLocalStorageAdapter secureLocalStorageAdapter,
  }) : _secureLocalStorageAdapter = secureLocalStorageAdapter;

  final SecureLocalStorageAdapter _secureLocalStorageAdapter;

  @override
  Future<void> eraseAuthInfo() async {
    await _secureLocalStorageAdapter.delete(
      key: LocalStorageConstants.authenticationInfoStorageKey,
    );
  }

  @override
  Future<AuthenticationInfo?> readAuthInfo() async {
    final value = await _secureLocalStorageAdapter.read(
      key: LocalStorageConstants.authenticationInfoStorageKey,
    );

    if (value != null) {
      return AuthenticationInfo.fromJson(value);
    } else {
      return null;
    }
  }

  @override
  Future<void> storeAuthInfo({
    required AuthenticationInfo value,
  }) async {
    await _secureLocalStorageAdapter.write(
      key: LocalStorageConstants.authenticationInfoStorageKey,
      value: value.toJson(),
    );
  }
}
