import 'package:authentication_repository/src/utils/local_storage_constants.dart';
import 'package:secure_local_storage_data_source_adapter/secure_local_storage_data_source_adapter.dart';

abstract class AuthenticationSecureLocalStorageDataSource {
  Future<void> writeToken(String token);
  Future<void> deleteToken();
  Future<String?> getToken();
}

class AuthenticationSecureLocalStorageDataSourceImplementation implements AuthenticationSecureLocalStorageDataSource {
  AuthenticationSecureLocalStorageDataSourceImplementation({
    required SecureLocalStorageAdapter localStorageClient,
  }) : _localSecureStorageClient = localStorageClient;

  final SecureLocalStorageAdapter _localSecureStorageClient;

  @override
  Future<String?> getToken() {
    return _localSecureStorageClient.read(
      key: LocalStorageConstants.authenticationTokenKey,
    );
  }

  @override
  Future<void> writeToken(String token) {
    return _localSecureStorageClient.write(
      key: LocalStorageConstants.authenticationTokenKey,
      value: token,
    );
  }

  @override
  Future<void> deleteToken() async {
    return _localSecureStorageClient.delete(
      key: LocalStorageConstants.authenticationTokenKey,
    );
  }
}
