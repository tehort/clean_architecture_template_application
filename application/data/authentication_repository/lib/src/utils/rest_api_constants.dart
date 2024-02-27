class RestApiEndpointsConstants {
  static const String baseUrl = 'http://localhost:4000/';

  static const String _accounts = 'accounts';

  static const String signIn = '$_accounts/authenticate';
  static const String signUp = '$_accounts/register';
  static const String verifyEmail = '$_accounts/verify-email';
}
