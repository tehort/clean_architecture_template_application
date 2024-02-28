import 'package:authentication_domain/authentication_domain.dart';
import 'package:core/core.dart';

class RefreshTokenUseCase {
  RefreshTokenUseCase({
    required AuthenticationRepositoryContract authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepositoryContract _authenticationRepository;

  Future<Result<void, Exception>> call() async {
    try {
      final refreshedToken = await _authenticationRepository.refreshToken();
      await _authenticationRepository.storeAuthInfo(
        value: refreshedToken,
      );
      return const Success(null);
    } on Exception catch (e) {
      await _authenticationRepository.eraseAuthInfo();
      return Future(() => Failure(e));
    }
  }
}
