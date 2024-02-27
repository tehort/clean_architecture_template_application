import 'package:authentication_domain/authentication_domain.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:secure_local_storage_data_source_adapter/secure_local_storage_data_source_adapter.dart';

abstract class AuthenticationLocalDataSourceContract {
  Future<void> storeAuthenticationInfo({
    required AuthenticationInfo value,
  });

  Future<void> eraseAuthenticationInfo();

  Future<AuthenticationInfo?> readAuthenticationInfo();
}

class AuthenticationLocalDataSourceImplementation implements AuthenticationLocalDataSourceContract {
  AuthenticationLocalDataSourceImplementation({
    required SecureLocalStorageAdapter secureLocalStorageAdapter,
  }) : _secureLocalStorageAdapter = secureLocalStorageAdapter;

  final SecureLocalStorageAdapter _secureLocalStorageAdapter;

  @override
  Future<void> eraseAuthenticationInfo() async {
    await _secureLocalStorageAdapter.delete(
      key: LocalStorageConstants.authenticationInfoKey,
    );
  }

  @override
  Future<AuthenticationInfo?> readAuthenticationInfo() async {
    final value = await _secureLocalStorageAdapter.read(
      key: LocalStorageConstants.authenticationInfoKey,
    );
    if (value != null) {
      return AuthenticationInfo.fromJson(value);
    } else {
      return null;
    }
  }

  @override
  Future<void> storeAuthenticationInfo({
    required AuthenticationInfo value,
  }) async {
    await _secureLocalStorageAdapter.write(
      key: LocalStorageConstants.authenticationInfoKey,
      value: value.toJson(),
    );
  }
}
