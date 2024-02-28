import 'package:rest_data_source_adapter/rest_adapter.dart';
import 'package:user_domain/user_domain.dart';
import 'package:user_repository/src/models/create_user_request_model.dart';
import 'package:user_repository/src/models/delete_user_request_model.dart';
import 'package:user_repository/src/utils/rest_api_constants.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser({
    required User user,
  });

  Future<void> deleteUser({
    required int id,
  });

  Future<List<User>> getUsers();

  Future<User> getUser({
    required int id,
  });

  Future<void> updateUser({
    required User user,
  });
}

class UserRemoteDataSourceImplementation implements UserRemoteDataSource {
  UserRemoteDataSourceImplementation({
    required RestAdapter apiClient,
  }) : _apiClient = apiClient;

  final RestAdapter _apiClient;

  @override
  Future<void> createUser({
    required User user,
  }) async {
    final response = await _apiClient.post(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.postAccount,
      data: CreateUserRequestModel(user: user).toMap(),
    );
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<void> deleteUser({
    required int id,
  }) async {
    final response = await _apiClient.delete(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.deleteUser(id: id),
      data: DeleteUserRequestModel(id: id).toMap(),
    );
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<User> getUser({
    required int id,
  }) async {
    final response = await _apiClient.get(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.getUser(id: id),
    );
    if (response.statusCode == 200) {
      return User.fromMap(response.data!);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<User>> getUsers() async {
    final response = await _apiClient.get(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.getAccounts,
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map(
            (e) => User.fromMap(e as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> updateUser({
    required User user,
  }) async {
    final response = await _apiClient.put(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.putUser(id: user.id),
      data: CreateUserRequestModel(user: user).toMap(),
    );
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
