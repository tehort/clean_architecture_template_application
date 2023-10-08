import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';
import 'package:usecases/src/authentication/entities/authentication_info.dart';

class SignInWithTokenUseCase {
  SignInWithTokenUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

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
