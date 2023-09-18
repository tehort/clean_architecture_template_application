import 'package:data/models/authentication_sign_in_response_model.dart';
import 'package:data/models/authentication_sign_up_response_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthenticationSignInResponseModel> signIn({
    required String username,
    required String password,
  });

  Future<AuthenticationSignUpResponseModel> signUp({
    required String title,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptTerms,
  });
}
