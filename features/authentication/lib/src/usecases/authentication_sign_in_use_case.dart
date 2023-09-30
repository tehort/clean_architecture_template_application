import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';

class AuthenticationSignInUsecase {
  AuthenticationSignInUsecase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  Future<Result<void, Exception>> call({
    required String username,
    required String password,
  }) async {
    try {
      final authToken = await _authenticationRepository.signIn(
        username: username,
        password: password,
      );
      await _authenticationRepository.writeToken(token: authToken);
      return const Success(null);
    } on Exception catch (e) {
      await _authenticationRepository.deleteToken();
      return Future(() => Failure(e));
    }
  }
}
