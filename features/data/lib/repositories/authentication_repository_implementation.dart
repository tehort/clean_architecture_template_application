import 'package:data/data_sources/local_data_sources/secure_local_storage_data_source.dart';
import 'package:data/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:domain/core/result.dart';
import 'package:domain/entities/authenticated_info.dart';
import 'package:domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  AuthenticationRepositoryImplementation({
    required AuthenticationRemoteDataSource authenticationRemoteDataSource,
    required SecureLocalStorageDataSource secureLocalStorageDataSource,
  })  : _authenticationRemoteDataSource = authenticationRemoteDataSource,
        _secureLocalStorageDataSource = secureLocalStorageDataSource;

  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final SecureLocalStorageDataSource _secureLocalStorageDataSource;

  @override
  Future<bool> get isLoggedIn async => await authenticationToken != null;

  @override
  Future<String?> get authenticationToken async => _secureLocalStorageDataSource.getAuthenticationToken();

  @override
  Future<Result<AuthenticatedInfo, Exception>> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _authenticationRemoteDataSource.signIn(
        username: username,
        password: password,
      );
      return Success(result.toAuthenticatedInfo());
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
