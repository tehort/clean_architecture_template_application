import 'package:data/core/secure_local_storage_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureLocalStorageClientImplementation implements SecureLocalStorageClient {
  SecureLocalStorageClientImplementation({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

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
