abstract class AuthenticationRepository {
  Future<bool> get isLoggedIn;

  Future<String> signIn({
    required String username,
    required String password,
  });
}
