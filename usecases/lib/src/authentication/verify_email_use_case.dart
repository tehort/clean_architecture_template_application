import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';

class VerifyEmailUseCase {
  VerifyEmailUseCase({
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
