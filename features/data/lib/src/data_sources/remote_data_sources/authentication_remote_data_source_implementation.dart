import 'package:data/src/core/rest_adapter.dart';
import 'package:data/src/data_sources/remote_data_sources/authentication_remote_data_source.dart';
import 'package:data/src/models/authentication_sign_in_request_model.dart';
import 'package:data/src/models/authentication_sign_in_response_model.dart';
import 'package:data/src/models/authentication_sign_up_request_model.dart';
import 'package:data/src/models/authentication_sign_up_response_model.dart';
import 'package:data/src/models/authentication_verify_email_request_model.dart';
import 'package:data/src/models/authentication_verify_email_response_model.dart';
import 'package:data/src/utils/rest_api_constants.dart';

class AuthenticationRemoteDataSourceImplementation implements AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImplementation({
    required RestAdapter apiClient,
  }) : _apiClient = apiClient;

  final RestAdapter _apiClient;

  @override
  Future<AuthenticationSignInResponseModel> signIn({
    required String username,
    required String password,
  }) async {
    final response = await _apiClient.post(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.userSignIn,
      data: AuthenticationSignInRequestModel(
        email: username,
        password: password,
      ).toJson(),
    );

    if (response.statusCode == 200) {
      return AuthenticationSignInResponseModel.fromMap(
        response.data!,
      );
    } else {
      throw Exception();
    }
  }

  @override
  Future<AuthenticationSignUpResponseModel> signUp({
    required String title,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  }) async {
    final response = await _apiClient.post(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.userSignUp,
      data: AuthenticationSignUpRequestModel(
        title: title,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        acceptTerms: acceptTerms,
      ).toJson(),
    );

    if (response.statusCode == 200) {
      return AuthenticationSignUpResponseModel.fromMap(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<AuthenticationVerifyEmailResponseModel> verifyEmail({required String token}) async {
    final response = await _apiClient.post(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.verifyEmailDialog,
      data: AuthenticationVerifyEmailRequestModel(
        token: token,
      ).toJson(),
    );

    if (response.statusCode == 200) {
      return AuthenticationVerifyEmailResponseModel.fromMap(response.data);
    } else {
      throw Exception();
    }
  }
}
