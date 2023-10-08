import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';

class SignOutUseCase {
  SignOutUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  Future<Result<void, Exception>> call() async {
    try {
      await _authenticationRepository.deleteAuthenticationInfo();
      return const Success(null);
    } on Exception catch (e) {
      return Future(() => Failure(e));
    }
  }
}
