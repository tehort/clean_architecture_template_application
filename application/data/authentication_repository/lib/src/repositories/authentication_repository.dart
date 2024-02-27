import 'package:authentication_domain/authentication_domain.dart';
import 'package:authentication_repository/authentication_repository.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepositoryContract {
  AuthenticationRepositoryImplementation({
    required AuthenticationRemoteDataSourceContract authenticationRemoteDataSource,
    required AuthenticationLocalDataSourceContract authenticationLocalDataSource,
  })  : _authenticationRemoteDataSource = authenticationRemoteDataSource,
        _authenticationLocalDataSource = authenticationLocalDataSource;

  final AuthenticationRemoteDataSourceContract _authenticationRemoteDataSource;
  final AuthenticationLocalDataSourceContract _authenticationLocalDataSource;

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
  Future<void> eraseAuthenticationInfo() async {
    await _authenticationLocalDataSource.eraseAuthenticationInfo();
  }

  @override
  Future<AuthenticationInfo?> readAuthenticationInfo() async {
    return _authenticationLocalDataSource.readAuthenticationInfo();
  }

  @override
  Future<void> storeAuthenticationInfo({
    required AuthenticationInfo authenticationInfo,
  }) async {
    await _authenticationLocalDataSource.storeAuthenticationInfo(
      value: authenticationInfo,
    );
  }
}
