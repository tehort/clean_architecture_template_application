import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignUpRequestModel extends Equatable {
  const SignUpRequestModel({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.acceptTerms,
  });

  factory SignUpRequestModel.fromJson(String source) => SignUpRequestModel.fromMap(json.decode(source));

  factory SignUpRequestModel.fromMap(Map<String, dynamic> map) {
    return SignUpRequestModel(
      title: map['title'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      confirmPassword: map['confirmPassword'] ?? '',
      acceptTerms: map['acceptTerms'] ?? false,
    );
  }

  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool acceptTerms;

  @override
  List<Object> get props {
    return [
      title,
      firstName,
      lastName,
      email,
      password,
      confirmPassword,
      acceptTerms,
    ];
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    return result
      ..addAll({'title': title})
      ..addAll({'firstName': firstName})
      ..addAll({'lastName': lastName})
      ..addAll({'email': email})
      ..addAll({'password': password})
      ..addAll({'confirmPassword': confirmPassword})
      ..addAll({'acceptTerms': acceptTerms});
  }

  String toJson() => json.encode(toMap());
}
