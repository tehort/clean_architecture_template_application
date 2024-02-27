import 'package:authentication_domain/authentication_domain.dart';
import 'package:core/core.dart';

class SignUpUseCase {
  SignUpUseCase({
    required AuthenticationRepositoryContract authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepositoryContract _authenticationRepository;

  Future<Result<String, Exception>> call({
    required String title,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  }) async {
    try {
      final confirmationMessage = await _authenticationRepository.signUp(
        title: title,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        acceptTerms: acceptTerms,
      );
      return Success(confirmationMessage);
    } on Exception catch (e) {
      return Future(() => Failure(e));
    }
  }
}
