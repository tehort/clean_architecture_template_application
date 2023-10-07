import 'package:secure_local_storage_data_source_adapter/secure_local_storage_data_source_adapter.dart';

abstract class SecureLocalStorageDataSource {
  Future<void> write(
    String key,
    String value,
  );

  Future<void> delete(
    String key,
  );

  Future<String?> read(
    String key,
  );
}

class SecureLocalStorageDataSourceImplementation implements SecureLocalStorageDataSource {
  SecureLocalStorageDataSourceImplementation({
    required SecureLocalStorageAdapter secureLocalStorageAdapter,
  }) : _secureLocalStorageAdapter = secureLocalStorageAdapter;

  final SecureLocalStorageAdapter _secureLocalStorageAdapter;

  @override
  Future<void> delete(
    String key,
  ) async {
    return _secureLocalStorageAdapter.delete(
      key: key,
    );
  }

  @override
  Future<String?> read(
    String key,
  ) {
    return _secureLocalStorageAdapter.read(
      key: key,
    );
  }

  @override
  Future<void> write(
    String key,
    String value,
  ) {
    return _secureLocalStorageAdapter.write(
      key: key,
      value: value,
    );
  }
}
