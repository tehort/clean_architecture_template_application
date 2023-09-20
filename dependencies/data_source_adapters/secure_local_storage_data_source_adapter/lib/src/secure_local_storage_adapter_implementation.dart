import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:secure_local_storage_data_source_adapter/src/secure_local_storage_adapter.dart';

class SecureLocalStorageAdapterImplementation implements SecureLocalStorageAdapter {
  SecureLocalStorageAdapterImplementation() : _storage = const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  @override
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  @override
  Future<String?> read({required String key}) async {
    return _storage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }
}
