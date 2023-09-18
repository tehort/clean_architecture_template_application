import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationSignUpResponseModel extends Equatable {
  const AuthenticationSignUpResponseModel({required this.message});

  factory AuthenticationSignUpResponseModel.fromJson(String source) =>
      AuthenticationSignUpResponseModel.fromMap(json.decode(source));

  factory AuthenticationSignUpResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationSignUpResponseModel(
      message: map['message'] ?? '',
    );
  }

  final String message;

  @override
  List<Object> get props => [message];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{'message': message};
    return result;
  }

  String toJson() => json.encode(toMap());
}
