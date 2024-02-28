class RestApiEndpointsConstants {
  static const String baseUrl = 'http://localhost:4000/';

  static const String _users = 'users';

  static const String signIn = '$_users/authenticate';
  static const String signUp = '$_users/register';
  static const String verifyEmail = '$_users/verify-email';

  static const String refreshToken = '$_users/refresh-token';
}
