import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignInRequestModel extends Equatable {
  const SignInRequestModel({
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
    return <String, dynamic>{}
      ..addAll({'email': email})
      ..addAll({'password': password});
  }

  String toJson() {
    return json.encode(toMap());
  }
}
