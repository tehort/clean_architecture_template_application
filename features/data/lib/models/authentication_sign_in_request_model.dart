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
    final result = <String, dynamic>{};

    return result
      ..addAll({'email': email})
      ..addAll({'password': password});
  }

  String toJson() {
    return json.encode(toMap());
  }
}
