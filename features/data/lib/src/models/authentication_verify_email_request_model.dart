import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationVerifyEmailRequestModel extends Equatable {
  const AuthenticationVerifyEmailRequestModel({
    required this.token,
  });

  factory AuthenticationVerifyEmailRequestModel.fromJson(String source) =>
      AuthenticationVerifyEmailRequestModel.fromMap(json.decode(source));

  factory AuthenticationVerifyEmailRequestModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationVerifyEmailRequestModel(
      token: map['token'] ?? '',
    );
  }

  final String token;

  @override
  List<Object?> get props => [
        token,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{'token': token};
    return result;
  }

  String toJson() => json.encode(toMap());
}
