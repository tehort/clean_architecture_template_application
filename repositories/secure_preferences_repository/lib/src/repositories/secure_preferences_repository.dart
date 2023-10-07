import 'package:secure_preferences_repository/src/data_sources/secure_local_storage_data_source.dart';

abstract class SecurePreferencesRepository {
  Future<void> write({
    required String key,
    required String value,
  });

  Future<void> delete({
    required String key,
  });

  Future<String?> read({
    required String key,
  });
}

class SecurePreferencesRepositoryImplementation implements SecurePreferencesRepository {
  SecurePreferencesRepositoryImplementation({
    required SecureLocalStorageDataSource secureLocalStorageDataSource,
  }) : _secureLocalStorageDataSource = secureLocalStorageDataSource;

  final SecureLocalStorageDataSource _secureLocalStorageDataSource;

  @override
  Future<void> delete({
    required String key,
  }) {
    return _secureLocalStorageDataSource.delete(
      key,
    );
  }

  @override
  Future<String?> read({
    required String key,
  }) {
    return _secureLocalStorageDataSource.read(
      key,
    );
  }

  @override
  Future<void> write({
    required String key,
    required String value,
  }) {
    return _secureLocalStorageDataSource.write(
      key,
      value,
    );
  }
}
