import 'package:data/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:domain/core/result.dart';
import 'package:domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImplementation({required this.authenticationRemoteDataSource});

  @override
  Future<Result<void, Exception>> signIn({required String username, required String password}) async {
    try {
      await authenticationRemoteDataSource.signIn(username: username, password: password);
      return Success();
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
