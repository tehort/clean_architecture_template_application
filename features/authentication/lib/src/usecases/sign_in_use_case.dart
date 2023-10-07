import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';

class SignInUsecase {
  SignInUsecase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

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
      await _authenticationRepository.writeAuthenticationInfo(
        authenticationInfo: response,
      );

      final a = await _authenticationRepository.readAuthenticationInfo();

      return Success(response);
    } on Exception catch (e) {
      await _authenticationRepository.deleteAuthenticationInfo();
      return Future(() => Failure(e));
    }
  }
}
