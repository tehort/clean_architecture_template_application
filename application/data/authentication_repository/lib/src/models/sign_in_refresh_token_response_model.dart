import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignInRefreshTokenResponseModel extends Equatable {
  const SignInRefreshTokenResponseModel({
    required this.id,
    required this.isVerified,
    required this.created,
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.jwtToken,
    this.updated,
  });

  factory SignInRefreshTokenResponseModel.fromMap(Map<String, dynamic> map) {
    return SignInRefreshTokenResponseModel(
      id: map['id']?.toDouble() ?? 0.0,
      title: map['title'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      role: map['role'],
      isVerified: map['isVerified'] ?? false,
      jwtToken: map['jwtToken'],
      created: DateTime.fromMillisecondsSinceEpoch(map['created']),
      updated: map['updated'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated']) : null,
    );
  }

  factory SignInRefreshTokenResponseModel.fromJson(String source) =>
      SignInRefreshTokenResponseModel.fromMap(json.decode(source));

  final double id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? role;
  final bool isVerified;
  final String? jwtToken;
  final DateTime created;
  final DateTime? updated;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (title != null) {
      result.addAll({'title': title});
    }
    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (role != null) {
      result.addAll({'role': role});
    }
    result.addAll({'isVerified': isVerified});
    if (jwtToken != null) {
      result.addAll({'jwtToken': jwtToken});
    }
    result.addAll({'created': created.millisecondsSinceEpoch});
    if (updated != null) {
      result.addAll({'updated': updated!.millisecondsSinceEpoch});
    }
    result.addAll({'id': id});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      title,
      firstName,
      lastName,
      email,
      role,
      isVerified,
      jwtToken,
      created,
      updated,
    ];
  }
}
