import 'package:domain/src/core/result.dart';
import 'package:domain/src/repositories/authentication_repository.dart';
import 'package:domain/src/repositories/preferences_repository.dart';

class AuthenticationSignInUsecase {
  AuthenticationSignInUsecase({
    required AuthenticationRepository authenticationRepository,
    required PreferencesRepository preferencesRepository,
  })  : _authenticationRepository = authenticationRepository,
        _preferencesRepository = preferencesRepository;

  final AuthenticationRepository _authenticationRepository;
  final PreferencesRepository _preferencesRepository;

  Future<Result<void, Exception>> call({
    required String username,
    required String password,
  }) async {
    try {
      final authToken = await _authenticationRepository.signIn(
        username: username,
        password: password,
      );
      await _preferencesRepository.writeToken(authToken);
      return const Success(null);
    } on Exception catch (e) {
      await _preferencesRepository.deleteToken();
      return Future(() => Failure(e));
    }
  }
}
