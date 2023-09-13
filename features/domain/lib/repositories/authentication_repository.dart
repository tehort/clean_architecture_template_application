import 'package:domain/core/result.dart';
import 'package:domain/entities/authenticated_info.dart';

abstract class AuthenticationRepository {
  Future<bool> get isLoggedIn;
  Future<String?> get authenticationToken;

  Future<Result<AuthenticatedInfo, Exception>> signIn({
    required String username,
    required String password,
  });
}
