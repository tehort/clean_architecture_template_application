import 'package:authentication_domain/authentication_domain.dart';
import 'package:core_domain/core_domain.dart';

class RefreshTokenUseCase {
  RefreshTokenUseCase({
    required AuthenticationRepositoryContract authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepositoryContract _authenticationRepository;

  Future<Result<void, Exception>> call() async {
    try {
      final refreshedToken = await _authenticationRepository.refreshToken();
      await _authenticationRepository.storeAuthorizationToken(
        value: refreshedToken.refreshToken,
      );

      return const Success(null);
    } on Exception catch (e) {
      await _authenticationRepository.eraseAuthorizationToken();
      await _authenticationRepository.refreshToken();
      return Future(() => Failure(e));
    }
  }
}
