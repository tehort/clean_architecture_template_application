import 'package:authentication_domain/authentication_domain.dart';
import 'package:core_domain/core_domain.dart';
import 'package:user_domain/user_domain.dart';

class GetLoggedUserUseCase {
  GetLoggedUserUseCase({
    required AuthenticationRepositoryContract authenticationRepository,
    required UserRepositoryContract userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository;

  final AuthenticationRepositoryContract _authenticationRepository;
  final UserRepositoryContract _userRepository;

  Future<Result<User, Exception>> call() async {
    try {
      final authInfo = await _authenticationRepository.readStoredUserInfo();
      if (authInfo == null) {
        throw Exception();
      }

      final response = await _userRepository.getSingleUser(
        id: authInfo.id,
      );
      return Success(response);
    } on Exception catch (e) {
      return Future(() => Failure(e));
    }
  }
}
