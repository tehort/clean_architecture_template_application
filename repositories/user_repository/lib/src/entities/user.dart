import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.created,
    required this.updated,
    required this.isVerified,
  });

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      created: DateTime.fromMillisecondsSinceEpoch(map['created']),
      updated: DateTime.fromMillisecondsSinceEpoch(map['updated']),
      isVerified: map['isVerified'] ?? false,
    );
  }

  final int id;
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final DateTime created;
  final DateTime updated;
  final bool isVerified;

  @override
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}
      ..addAll({'id': id})
      ..addAll({'title': title})
      ..addAll({'firstName': firstName})
      ..addAll({'lastName': lastName})
      ..addAll({'email': email})
      ..addAll({'role': role})
      ..addAll({'created': created.millisecondsSinceEpoch})
      ..addAll({'updated': updated.millisecondsSinceEpoch})
      ..addAll({'isVerified': isVerified});
  }

  String toJson() => json.encode(toMap());
}
