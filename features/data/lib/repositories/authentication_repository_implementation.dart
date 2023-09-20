import 'package:data/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:domain/repositories/authentication_repository.dart';
import 'package:domain/repositories/preferences_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  AuthenticationRepositoryImplementation({
    required AuthenticationRemoteDataSource authenticationRemoteDataSource,
    required PreferencesRepository preferencesRepository,
  })  : _authenticationRemoteDataSource = authenticationRemoteDataSource,
        _preferencesRepository = preferencesRepository;

  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final PreferencesRepository _preferencesRepository;

  @override
  Future<bool> get isLoggedIn async => await _preferencesRepository.getToken() != null;

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
}
