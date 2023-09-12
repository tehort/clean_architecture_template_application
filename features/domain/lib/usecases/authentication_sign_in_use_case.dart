import 'package:domain/core/result.dart';
import 'package:domain/repositories/authentication_repository.dart';

class AuthenticationSignInUsecase {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationSignInUsecase({
    required authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  Future<Result<void, Exception>> call({required String username, required String password}) {
    return _authenticationRepository.signIn(username: username, password: password);
  }
}
