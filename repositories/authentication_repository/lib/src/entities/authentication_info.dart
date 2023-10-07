import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthenticationInfo extends Equatable {
  const AuthenticationInfo({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.created,
    required this.isVerified,
    required this.jwtToken,
    required this.keepSignedIn,
    this.updated,
  });

  factory AuthenticationInfo.fromMap(Map<String, dynamic> map) {
    return AuthenticationInfo(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      created: DateTime.fromMillisecondsSinceEpoch(map['created']),
      updated: map['updated'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated']) : null,
      isVerified: map['isVerified'] ?? false,
      jwtToken: map['jwtToken'] ?? '',
      keepSignedIn: map['keepSignedIn'] ?? false,
    );
  }

  factory AuthenticationInfo.fromJson(String source) => AuthenticationInfo.fromMap(json.decode(source));

  final int id;
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final DateTime created;
  final DateTime? updated;
  final bool isVerified;
  final String jwtToken;
  final bool keepSignedIn;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      firstName,
      lastName,
      email,
      role,
      created,
      updated,
      isVerified,
      jwtToken,
      keepSignedIn,
    ];
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'id': id})
      ..addAll({'title': title})
      ..addAll({'firstName': firstName})
      ..addAll({'lastName': lastName})
      ..addAll({'email': email})
      ..addAll({'role': role})
      ..addAll({'created': created.millisecondsSinceEpoch})
      ..addAll({'isVerified': isVerified})
      ..addAll({'jwtToken': jwtToken})
      ..addAll({'keepSignedIn': keepSignedIn});

    if (updated != null) {
      result.addAll({'updated': updated!.millisecondsSinceEpoch});
    }

    return result;
  }

  String toJson() => json.encode(toMap());
}
