import 'package:user_domain/user_domain.dart';

abstract class UserRepositoryContract {
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
