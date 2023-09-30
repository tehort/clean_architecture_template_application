import 'package:authentication_repository/src/data_sources/authentication_remote_data_source.dart';
import 'package:authentication_repository/src/data_sources/secure_local_storage_data_source.dart';

abstract class AuthenticationRepository {
  Future<String> signIn({
    required String username,
    required String password,
  });

  Future<String> signUp({
    required String title,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  });

  Future<void> verifyEmail({
    required String token,
  });

  Future<void> signInWithToken({
    required String token,
  });

  Future<void> writeToken({
    required String token,
  });

  Future<void> deleteToken();

  Future<String?> getToken();
}

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  AuthenticationRepositoryImplementation({
    required AuthenticationRemoteDataSource authenticationRemoteDataSource,
    required AuthenticationSecureLocalStorageDataSource authenticationSecureLocalStorageDataSource,
  })  : _authenticationRemoteDataSource = authenticationRemoteDataSource,
        _authenticationSecureLocalStorageDataSource = authenticationSecureLocalStorageDataSource;

  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationSecureLocalStorageDataSource _authenticationSecureLocalStorageDataSource;

  @override
  Future<String> signIn({
    required String username,
    required String password,
  }) async {
    final result = await _authenticationRemoteDataSource.signIn(
      username: username,
      password: password,
    );
    return result.jwtToken;
  }

  @override
  Future<String> signUp({
    required String title,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  }) async {
    final result = await _authenticationRemoteDataSource.signUp(
      title: title,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      acceptTerms: acceptTerms,
    );
    return result.message;
  }

  @override
  Future<void> verifyEmail({
    required String token,
  }) async {
    await _authenticationRemoteDataSource.verifyEmail(
      token: token,
    );
  }

  @override
  Future<void> signInWithToken({
    required String token,
  }) async {
    return _authenticationRemoteDataSource.signInWithToken(
      token: token,
    );
  }

  @override
  Future<void> writeToken({required String token}) async {
    await _authenticationSecureLocalStorageDataSource.writeToken(token);
  }

  @override
  Future<void> deleteToken() async {
    await _authenticationSecureLocalStorageDataSource.deleteToken();
  }

  @override
  Future<String?> getToken() {
    return _authenticationSecureLocalStorageDataSource.getToken();
  }
}
