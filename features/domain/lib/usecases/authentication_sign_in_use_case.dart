import 'package:domain/core/result.dart';
import 'package:domain/repositories/authentication_repository.dart';

class AuthenticationSignInUsecase {
  AuthenticationSignInUsecase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  Future<Result<void, Exception>> call({
    required String username,
    required String password,
  }) {
    return _authenticationRepository.signIn(
      username: username,
      password: password,
    );
  }
}
