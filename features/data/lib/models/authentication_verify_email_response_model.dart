import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationVerifyEmailResponseModel extends Equatable {
  const AuthenticationVerifyEmailResponseModel({
    required this.message,
  });

  factory AuthenticationVerifyEmailResponseModel.fromJson(String source) =>
      AuthenticationVerifyEmailResponseModel.fromMap(json.decode(source));

  factory AuthenticationVerifyEmailResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationVerifyEmailResponseModel(
      message: map['message'] ?? '',
    );
  }

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{'message': message};
    return result;
  }

  String toJson() => json.encode(toMap());
}
