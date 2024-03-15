import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationInfo extends Equatable {
  const AuthenticationInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.jwtToken,
    required this.refreshToken,
    required this.keepSignedIn,
  });

  factory AuthenticationInfo.fromMap(Map<String, dynamic> map) {
    return AuthenticationInfo(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      username: map['username'] ?? '',
      jwtToken: map['jwtToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      keepSignedIn: map['keepSignedIn'] ?? false,
    );
  }

  factory AuthenticationInfo.fromJson(String source) => AuthenticationInfo.fromMap(json.decode(source));

  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String jwtToken;
  final String refreshToken;
  final bool keepSignedIn;

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      username,
      jwtToken,
      refreshToken,
      keepSignedIn,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}
      ..addAll({'id': id})
      ..addAll({'firstName': firstName})
      ..addAll({'lastName': lastName})
      ..addAll({'username': username})
      ..addAll({'jwtToken': jwtToken})
      ..addAll({'refreshToken': refreshToken})
      ..addAll({'keepSignedIn': keepSignedIn});
  }

  String toJson() => json.encode(toMap());
}
