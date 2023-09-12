import 'package:equatable/equatable.dart';

class AuthenticationSignInResponseModel extends Equatable {
  final double id;
  final String firstName;
  final String lastName;
  final String username;
  final String token;

  const AuthenticationSignInResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.token,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        username,
        token,
      ];

  factory AuthenticationSignInResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationSignInResponseModel(
      id: map['id']?.toDouble() ?? 0.0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      username: map['username'] ?? '',
      token: map['token'] ?? '',
    );
  }
}
