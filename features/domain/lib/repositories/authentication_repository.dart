abstract class AuthenticationRepository {
  Future<bool> get isLoggedIn;

  Future<String> signIn({
    required String username,
    required String password,
  });

  Future<String> signUp({
    required String title,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  });
}
