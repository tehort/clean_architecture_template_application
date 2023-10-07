import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';

class SignInWithTokenUsecase {
  SignInWithTokenUsecase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  Future<Result<AuthenticationInfo, Exception>> call() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final result = await _authenticationRepository.readAuthenticationInfo();
      if (result == null) {
        throw Exception('Token not found');
      }
      final authenticationInfo = AuthenticationInfo.fromJson(result);
      return Success(authenticationInfo);
    } on Exception catch (e) {
      return Future(() => Failure(e));
    }
  }
}
