import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationSignInRequestModel extends Equatable {
  final String username;
  final String password;

  const AuthenticationSignInRequestModel({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        password,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'password': password});

    return result;
  }

  String toJson() => json.encode(toMap());
}
