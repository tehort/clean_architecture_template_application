import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignInRequestModel extends Equatable {
  const SignInRequestModel({
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
    return <String, dynamic>{}
      ..addAll({'username': username})
      ..addAll({'password': password});
  }

  String toJson() {
    return json.encode(toMap());
  }
}
