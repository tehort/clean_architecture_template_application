class RestApiEndpointsConstants {
  static const String baseUrl = 'http://localhost:4000/';

  static const String _users = 'users';

  static const String getAccounts = _users;
  static const String postAccount = _users;
  static String getUser({required int id}) => '$_users/$id';
  static String putUser({required int id}) => '$_users/$id';
  static String deleteUser({required int id}) => '$_users/$id';
}
