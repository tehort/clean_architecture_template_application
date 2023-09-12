import 'package:domain/core/result.dart';

abstract class AuthenticationRepository {
  Future<Result<void, Exception>> signIn({required String username, required String password});
}
