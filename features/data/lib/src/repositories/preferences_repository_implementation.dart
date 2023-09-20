import 'package:data/src/data_sources/local_data_sources/secure_local_storage_data_source.dart';
import 'package:domain/src/repositories/preferences_repository.dart';

class PreferencesRepositoryImplementation extends PreferencesRepository {
  PreferencesRepositoryImplementation({
    required SecureLocalStorageDataSource secureLocalStorageDataSource,
  }) : _secureLocalStorageDataSource = secureLocalStorageDataSource;

  final SecureLocalStorageDataSource _secureLocalStorageDataSource;

  @override
  Future<void> writeToken(String token) async {
    await _secureLocalStorageDataSource.writeToken(token);
  }

  @override
  Future<void> deleteToken() async {
    await _secureLocalStorageDataSource.deleteToken();
  }

  @override
  Future<String?> getToken() {
    return _secureLocalStorageDataSource.getToken();
  }
}
