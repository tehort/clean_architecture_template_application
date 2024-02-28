import 'package:authentication_domain/authentication_domain.dart';
import 'package:core/core.dart';

class SignInFromStorageUseCase {
  SignInFromStorageUseCase({
    required AuthenticationRepositoryContract authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepositoryContract _authenticationRepository;

  Future<Result<AuthenticationInfo, Exception>> call() async {
    try {
      final authInfo = await _authenticationRepository.readAuthInfo();
      if (authInfo == null) {
        throw Exception('Token not found');
      }
      return Success(authInfo);
    } on Exception catch (e) {
      await _authenticationRepository.eraseAuthInfo();
      return Future(() => Failure(e));
    }
  }
}
