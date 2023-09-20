import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationSignInRequestModel extends Equatable {
  const AuthenticationSignInRequestModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'email': email})
      ..addAll({'password': password});

    return result;
  }

  String toJson() {
    return json.encode(toMap());
  }
}
