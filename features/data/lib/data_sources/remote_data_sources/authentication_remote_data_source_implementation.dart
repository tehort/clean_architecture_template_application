import 'package:data/data_sources/core/rest_client.dart';
import 'package:data/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:data/models/authentication_sign_in_request_model.dart';
import 'package:data/models/authentication_sign_in_response_model.dart';
import 'package:data/utils/api_constants.dart';

class AuthenticationRemoteDataSourceImplementation implements AuthenticationRemoteDataSource {
  final RestClient _apiClient;

  AuthenticationRemoteDataSourceImplementation({
    required apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<AuthenticationSignInResponseModel> signIn({required String username, required String password}) async {
    final response = await _apiClient.post(
      baseUrl: ApiEndpointsConstants.baseUrl,
      path: ApiEndpointsConstants.userSignIn,
      data: AuthenticationSignInRequestModel(
        username: username,
        password: password,
      ).toJson(),
    );
    if (response.statusCode == 200) {
      await Future.delayed(Duration(seconds: 1));
      return AuthenticationSignInResponseModel.fromMap(response.data);
    } else {
      throw Exception();
    }
  }
}
