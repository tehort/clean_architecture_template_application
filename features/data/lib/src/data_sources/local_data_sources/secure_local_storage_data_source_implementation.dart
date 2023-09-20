import 'package:data/src/core/secure_local_storage_adapter.dart';
import 'package:data/src/data_sources/local_data_sources/secure_local_storage_data_source.dart';
import 'package:data/src/utils/local_storage_constants.dart';

class SecureLocalStorageDataSourceImplementation implements SecureLocalStorageDataSource {
  SecureLocalStorageDataSourceImplementation({
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
