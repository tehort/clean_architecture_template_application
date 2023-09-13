import 'package:data/core/secure_local_storage_client.dart';
import 'package:data/data_sources/local_data_sources/secure_local_storage_data_source.dart';
import 'package:data/utils/local_storage_constants.dart';

class SecureLocalStorageDataSourceImplementation implements SecureLocalStorageDataSource {
  SecureLocalStorageDataSourceImplementation({
    required SecureLocalStorageClient localStorageClient,
  }) : _localSecureStorageClient = localStorageClient;

  final SecureLocalStorageClient _localSecureStorageClient;

  @override
  Future<String?> getAuthenticationToken() async {
    return _localSecureStorageClient.read(
      key: LocalStorageConstants.authenticationTokenKey,
    );
  }
}
