import 'package:authentication_repository/authentication_repository.dart';
import 'package:core/core.dart';
import 'package:usecases/usecases.dart';
import 'package:user_repository/user_repository.dart';

class GetLoggedUserUseCase {
  GetLoggedUserUseCase({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository;

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Future<Result<User, Exception>> call() async {
    try {
      final authInfo = await _authenticationRepository.readAuthenticationInfo();
      if (authInfo == null) {
        throw Exception('Token not found');
      }
      final response = await _userRepository.getSingleUser(id: authInfo.id);
      return Success(response);
    } on Exception catch (e) {
      return Future(() => Failure(e));
    }
  }
}
