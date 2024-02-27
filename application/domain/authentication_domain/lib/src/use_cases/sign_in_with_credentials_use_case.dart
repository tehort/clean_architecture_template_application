import 'package:authentication_domain/authentication_domain.dart';
import 'package:core/core.dart';

class SignInWithCredentialsUseCase {
  SignInWithCredentialsUseCase({
    required AuthenticationRepositoryContract authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepositoryContract _authenticationRepository;

  Future<Result<AuthenticationInfo, Exception>> call({
    required String username,
    required String password,
    required bool keepSignedIn,
  }) async {
    try {
      final response = await _authenticationRepository.signIn(
        username: username,
        password: password,
        keepSignedIn: keepSignedIn,
      );
      await _authenticationRepository.storeAuthenticationInfo(
        authenticationInfo: response,
      );
      return Success(response);
    } on Exception catch (e) {
      await _authenticationRepository.eraseAuthenticationInfo();
      return Future(() => Failure(e));
    }
  }
}
