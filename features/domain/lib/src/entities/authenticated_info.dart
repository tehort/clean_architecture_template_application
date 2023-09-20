import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationInfo extends Equatable {
  const AuthenticationInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.token,
  });

  factory AuthenticationInfo.fromMap(Map<String, dynamic> map) {
    return AuthenticationInfo(
      id: map['id'] ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      username: map['username'] ?? '',
      token: map['token'] ?? '',
    );
  }

  factory AuthenticationInfo.fromJson(String source) {
    return AuthenticationInfo.fromMap(json.decode(source));
  }

  final num id;
  final String firstName;
  final String lastName;
  final String username;
  final String token;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        username,
        token,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    return result
      ..addAll({'id': id})
      ..addAll({'firstName': firstName})
      ..addAll({'lastName': lastName})
      ..addAll({'username': username})
      ..addAll({'token': token});
  }

  String toJson() => json.encode(toMap());
}
