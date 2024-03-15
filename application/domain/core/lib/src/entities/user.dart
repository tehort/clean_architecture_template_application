import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
  });

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      username: map['username'] ?? '',
    );
  }

  final int id;
  final String firstName;
  final String lastName;
  final String username;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        username,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}
      ..addAll({'id': id})
      ..addAll({'firstName': firstName})
      ..addAll({'lastName': lastName})
      ..addAll({'username': username});
  }

  String toJson() => json.encode(toMap());
}
