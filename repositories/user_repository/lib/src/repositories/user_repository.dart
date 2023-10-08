import 'package:usecases/usecases.dart';
import 'package:user_repository/src/data_sources/user_remote_data_source.dart';

abstract class UserRepository {
  Future<void> createUser({
    required User user,
  });

  Future<void> updateUser({
    required User user,
  });

  Future<void> deleteUser({
    required int id,
  });

  Future<User> getSingleUser({
    required int id,
  });

  Future<List<User>> getAllUsers();
}

class UserRepositoryImplementation extends UserRepository {
  UserRepositoryImplementation({
    required UserRemoteDataSource userRemoteDataSource,
  }) : _userRemoteDataSource = userRemoteDataSource;

  final UserRemoteDataSource _userRemoteDataSource;

  @override
  Future<void> createUser({
    required User user,
  }) async {
    await _userRemoteDataSource.createUser(user: user);
  }

  @override
  Future<void> deleteUser({
    required int id,
  }) async {
    await _userRemoteDataSource.deleteUser(id: id);
  }

  @override
  Future<List<User>> getAllUsers() async {
    return _userRemoteDataSource.getUsers();
  }

  @override
  Future<User> getSingleUser({
    required int id,
  }) async {
    return _userRemoteDataSource.getUser(id: id);
  }

  @override
  Future<void> updateUser({
    required User user,
  }) async {
    await _userRemoteDataSource.updateUser(user: user);
  }
}
