import 'package:domain/src/core/result.dart';
import 'package:domain/src/repositories/authentication_repository.dart';

class AuthenticationVerifyEmailUsecase {
  AuthenticationVerifyEmailUsecase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  Future<Result<void, Exception>> call({
    required String token,
  }) async {
    try {
      await _authenticationRepository.verifyEmail(
        token: token,
      );
      return const Success(null);
    } on Exception catch (e) {
      return Future(() => Failure(e));
    }
  }
}
