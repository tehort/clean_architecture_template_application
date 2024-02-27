import 'package:authentication_domain/authentication_domain.dart';
import 'package:core/core.dart';

class VerifyEmailUseCase {
  VerifyEmailUseCase({
    required AuthenticationRepositoryContract authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepositoryContract _authenticationRepository;

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
