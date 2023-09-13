import 'package:data/models/authentication_sign_in_response_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthenticationSignInResponseModel> signIn({
    required String username,
    required String password,
  });
}
