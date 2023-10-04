class RestApiEndpointsConstants {
  static const String baseUrl = 'http://localhost:4000/';

  static const String _accounts = 'accounts';

  static const String getAccounts = _accounts;
  static const String postAccount = _accounts;
  static String getAccount({required int id}) => '$_accounts/$id';
  static String putAccount({required int id}) => '$_accounts/$id';
  static String deleteAccount({required int id}) => '$_accounts/$id';
}
