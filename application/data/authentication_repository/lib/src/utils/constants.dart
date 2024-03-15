class LocalStorageConstants {
  static const String requireAuthorizationTokenHeaderKey = 'REQUIRE_AUTHORIZATION_TOKEN';
  static const String authorizationTokenStorageKey = 'AUTHORIZATION_TOKEN';
  static const String authorizationTokenApiHeaderKey = 'Authorization';

  static const String requireRefreshTokenOptionKey = 'REQUIRE_REFRESH_TOKEN';
  static const String refreshTokenStorageKey = 'REFRESH_TOKEN';
  static const String refreshTokenApiHeaderKey = 'refreshToken';
}

class RestApiEndpointsConstants {
  static const String baseUrl = 'http://localhost:4000/';

  static const String _users = 'users';

  static const String signIn = '$_users/authenticate';
  static const String signUp = '$_users/register';
  static const String verifyEmail = '$_users/verify-email';

  static const String refreshToken = '$_users/refresh-token';
}
