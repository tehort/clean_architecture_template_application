abstract class AuthenticationRemoteDataSource {
  Future<void> signIn({required String username, required String password});
}
