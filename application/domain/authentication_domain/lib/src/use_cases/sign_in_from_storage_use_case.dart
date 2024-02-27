import 'package:authentication_domain/authentication_domain.dart';
import 'package:core/core.dart';

class SignInFromStorageUseCase {
  SignInFromStorageUseCase({
    required AuthenticationRepositoryContract authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepositoryContract _authenticationRepository;

  Future<Result<AuthenticationInfo, Exception>> call() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final authInfo = await _authenticationRepository.readAuthenticationInfo();
      if (authInfo == null) {
        throw Exception('Token not found');
      }
      return Success(authInfo);
    } on Exception catch (e) {
      return Future(() => Failure(e));
    }
  }
}
