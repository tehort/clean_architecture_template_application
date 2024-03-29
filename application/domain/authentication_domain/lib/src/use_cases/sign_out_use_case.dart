import 'package:authentication_domain/authentication_domain.dart';
import 'package:core_domain/core_domain.dart';

class SignOutUseCase {
  SignOutUseCase({
    required AuthenticationRepositoryContract authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepositoryContract _authenticationRepository;

  Future<Result<void, Exception>> call() async {
    try {
      await _authenticationRepository.eraseAuthorizationToken();
      return const Success(null);
    } on Exception catch (e) {
      return Future(() => Failure(e));
    }
  }
}
