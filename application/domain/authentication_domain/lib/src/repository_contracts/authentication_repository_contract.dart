import 'package:authentication_domain/authentication_domain.dart';

abstract class AuthenticationRepositoryContract {
  Future<AuthenticationInfo> signIn({
    required String username,
    required String password,
    required bool keepSignedIn,
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

  Future<void> verifyEmail({
    required String token,
  });

  Future<AuthenticationInfo> refreshToken();

  Future<void> storeAuthInfo({
    required AuthenticationInfo value,
  });

  Future<void> eraseAuthInfo();

  Future<AuthenticationInfo?> readAuthInfo();
}
