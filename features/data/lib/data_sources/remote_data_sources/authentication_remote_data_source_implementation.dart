import 'package:data/core/rest_client.dart';
import 'package:data/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:data/models/authentication_sign_in_request_model.dart';
import 'package:data/models/authentication_sign_in_response_model.dart';
import 'package:data/utils/rest_api_constants.dart';

class AuthenticationRemoteDataSourceImplementation implements AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImplementation({
    required RestClient apiClient,
  }) : _apiClient = apiClient;

  final RestClient _apiClient;

  @override
  Future<AuthenticationSignInResponseModel> signIn({
    required String username,
    required String password,
  }) async {
    final response = await _apiClient.post<AuthenticationSignInResponseModel>(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.userSignIn,
      data: AuthenticationSignInRequestModel(
        username: username,
        password: password,
      ).toJson(),
    );

    if (response.statusCode == 200) {
      return response.data!;
    } else {
      throw Exception();
    }
  }
}
