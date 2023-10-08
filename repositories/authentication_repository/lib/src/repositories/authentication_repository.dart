import 'package:authentication_repository/src/data_sources/authentication_remote_data_source.dart';
import 'package:authentication_repository/src/utils/local_storage_constants.dart';
import 'package:secure_preferences_repository/secure_preferences_repository.dart';
import 'package:usecases/usecases.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationInfo> signIn({
    required String username,
    required String password,
    required bool keepSignedIn,
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

  Future<void> writeAuthenticationInfo({
    required AuthenticationInfo authenticationInfo,
  });

  Future<void> deleteAuthenticationInfo();

  Future<AuthenticationInfo?> readAuthenticationInfo();
}

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  AuthenticationRepositoryImplementation({
    required AuthenticationRemoteDataSource authenticationRemoteDataSource,
    required SecurePreferencesRepository securePreferencesRepository,
  })  : _authenticationRemoteDataSource = authenticationRemoteDataSource,
        _securePreferencesRepository = securePreferencesRepository;

  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final SecurePreferencesRepository _securePreferencesRepository;

  @override
  Future<AuthenticationInfo> signIn({
    required String username,
    required String password,
    required bool keepSignedIn,
  }) async {
    final response = await _authenticationRemoteDataSource.signIn(
      username: username,
      password: password,
    );

    return AuthenticationInfo(
      id: response.id,
      title: response.title!,
      firstName: response.firstName!,
      lastName: response.lastName!,
      email: response.email!,
      role: response.role!,
      isVerified: response.isVerified,
      jwtToken: response.jwtToken!,
      created: response.created,
      updated: response.updated,
      keepSignedIn: keepSignedIn,
    );
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
  Future<void> writeAuthenticationInfo({
    required AuthenticationInfo authenticationInfo,
  }) async {
    await _securePreferencesRepository.write(
      key: LocalStorageConstants.authenticationInfoKey,
      value: authenticationInfo.toJson(),
    );
  }

  @override
  Future<void> deleteAuthenticationInfo() async {
    await _securePreferencesRepository.delete(
      key: LocalStorageConstants.authenticationInfoKey,
    );
  }

  @override
  Future<AuthenticationInfo?> readAuthenticationInfo() async {
    final string = await _securePreferencesRepository.read(
      key: LocalStorageConstants.authenticationInfoKey,
    );

    return string == null ? null : AuthenticationInfo.fromJson(string);
  }
}
