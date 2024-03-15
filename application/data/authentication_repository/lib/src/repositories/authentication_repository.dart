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
  Future<AuthenticationInfo> refreshToken() async {
    final response = await _authenticationRemoteDataSource.refreshToken();

    return AuthenticationInfo(
      id: response.id,
      firstName: response.firstName!,
      lastName: response.lastName!,
      username: response.username!,
      jwtToken: response.jwtToken!,
      refreshToken: response.refreshToken!,
      keepSignedIn: true,
    );
  }

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
      firstName: response.firstName!,
      lastName: response.lastName!,
      username: response.username!,
      jwtToken: response.jwtToken!,
      refreshToken: response.refreshToken!,
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
  Future<void> eraseAuthorizationToken() async {
    await _authenticationLocalDataSource.eraseAuthorizationToken();
  }

  @override
  Future<void> eraseRefreshToken() async {
    await _authenticationLocalDataSource.eraseRefreshToken();
  }

  @override
  Future<String?> readAuthorizationToken() async {
    return _authenticationLocalDataSource.readAuthorizationToken();
  }

  @override
  Future<String?> readRefreshToken() async {
    return _authenticationLocalDataSource.readRefreshToken();
  }

  @override
  Future<void> storeAuthorizationToken({
    required String value,
  }) async {
    await _authenticationLocalDataSource.storeAuthorizationToken(
      value: value,
    );
  }

  @override
  Future<void> storeRefreshToken({
    required String value,
  }) async {
    await _authenticationLocalDataSource.storeRefreshToken(
      value: value,
    );
  }

  @override
  Future<void> eraseStoredUserInfo() async {}

  @override
  Future<AuthenticationInfo?> readStoredUserInfo() async {
    final response = await _authenticationLocalDataSource.readRefreshToken();
    if (response == null) {
      return null;
    } else {
      return AuthenticationInfo.fromJson(response);
    }
  }

  @override
  Future<void> storeStoredUserInfo({
    required AuthenticationInfo value,
  }) async {
    await _authenticationLocalDataSource.storeRefreshToken(
      value: value.toJson(),
    );
  }
}
