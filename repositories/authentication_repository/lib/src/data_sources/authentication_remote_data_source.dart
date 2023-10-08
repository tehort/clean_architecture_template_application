import 'package:authentication_repository/src/models/sign_in_request_model.dart';
import 'package:authentication_repository/src/models/sign_in_response_model.dart';
import 'package:authentication_repository/src/models/sign_up_request_model.dart';
import 'package:authentication_repository/src/models/sign_up_response_model.dart';
import 'package:authentication_repository/src/models/verify_email_request_model.dart';
import 'package:authentication_repository/src/models/verify_email_response_model.dart';
import 'package:authentication_repository/src/utils/rest_api_constants.dart';
import 'package:rest_data_source_adapter/rest_adapter.dart';

abstract class AuthenticationRemoteDataSource {
  Future<SignInResponseModel> signIn({
    required String username,
    required String password,
  });

  Future<SignUpResponseModel> signUp({
    required String title,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  });

  Future<VerifyEmailResponseModel> verifyEmail({
    required String token,
  });
}

class AuthenticationRemoteDataSourceImplementation implements AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImplementation({
    required RestAdapter apiClient,
  }) : _apiClient = apiClient;

  final RestAdapter _apiClient;

  @override
  Future<SignInResponseModel> signIn({
    required String username,
    required String password,
  }) async {
    final response = await _apiClient.post(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.signIn,
      data: SignInRequestModel(
        email: username,
        password: password,
      ).toJson(),
    );

    if (response.statusCode == 200) {
      return SignInResponseModel.fromMap(
        response.data!,
      );
    } else {
      throw Exception();
    }
  }

  @override
  Future<SignUpResponseModel> signUp({
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
      path: RestApiEndpointsConstants.signUp,
      data: SignUpRequestModel(
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
      return SignUpResponseModel.fromMap(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<VerifyEmailResponseModel> verifyEmail({
    required String token,
  }) async {
    final response = await _apiClient.post(
      baseUrl: RestApiEndpointsConstants.baseUrl,
      path: RestApiEndpointsConstants.verifyEmail,
      data: VerifyEmailRequestModel(
        token: token,
      ).toJson(),
    );

    if (response.statusCode == 200) {
      return VerifyEmailResponseModel.fromMap(response.data);
    } else {
      throw Exception();
    }
  }
}
