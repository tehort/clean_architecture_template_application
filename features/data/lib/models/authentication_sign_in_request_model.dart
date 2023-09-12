import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationSignInRequestModel extends Equatable {
  const AuthenticationSignInRequestModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [
        username,
        password,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    return result
      ..addAll({'username': username})
      ..addAll({'password': password});
  }

  String toJson() => json.encode(toMap());
}
