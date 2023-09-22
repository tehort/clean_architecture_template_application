import 'package:domain/src/entities/result.dart';
import 'package:domain/src/repositories/authentication_repository.dart';
import 'package:domain/src/repositories/preferences_repository.dart';

class AuthenticationSignInFromTokenUsecase {
  AuthenticationSignInFromTokenUsecase({
    required AuthenticationRepository authenticationRepository,
    required PreferencesRepository preferencesRepository,
  })  : _authenticationRepository = authenticationRepository,
        _preferencesRepository = preferencesRepository;

  final AuthenticationRepository _authenticationRepository;
  final PreferencesRepository _preferencesRepository;

  Future<Result<void, Exception>> call({
  }) async {
    try {
      final token = await _preferencesRepository.getToken();
      
      if(token == null) {
        return const Success(null);
      }

       await _authenticationRepository.signInWithToken(
      );
      return const Success(null);
    } on Exception catch (e) {
      await _preferencesRepository.deleteToken();
      return Future(() => Failure(e));
    }
  }
}
