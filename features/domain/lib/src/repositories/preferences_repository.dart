abstract class PreferencesRepository {
  Future<void> writeToken(String token);
  Future<void> deleteToken();
  Future<String?> getToken();
}
