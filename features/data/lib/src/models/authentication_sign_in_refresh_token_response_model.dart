import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationSignInRefreshTokenResponseModel extends Equatable {
  const AuthenticationSignInRefreshTokenResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.jwtToken,
    required this.title,
    required this.email,
    required this.role,
    required this.isVerified,
  });

  factory AuthenticationSignInRefreshTokenResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationSignInRefreshTokenResponseModel(
      id: map['id']?.toDouble() ?? 0.0,
      title: map['title'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      isVerified: map['isVerified'] ?? false,
      jwtToken: map['jwtToken'] ?? '',
    );
  }

  factory AuthenticationSignInRefreshTokenResponseModel.fromJson(String source) =>
      AuthenticationSignInRefreshTokenResponseModel.fromMap(json.decode(source));

  final double id;
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final bool isVerified;
  final String jwtToken;

  @override
  List<Object?> get props => [
        id,
        title,
        firstName,
        lastName,
        email,
        role,
        isVerified,
        jwtToken,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'id': id})
      ..addAll({'title': title})
      ..addAll({'firstName': firstName})
      ..addAll({'lastName': lastName})
      ..addAll({'email': email})
      ..addAll({'role': role})
      ..addAll({'isVerified': isVerified})
      ..addAll({'jwtToken': jwtToken});

    return result;
  }

  String toJson() => json.encode(toMap());
}
