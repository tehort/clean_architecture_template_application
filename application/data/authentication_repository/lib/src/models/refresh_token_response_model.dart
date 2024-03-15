import 'dart:convert';

import 'package:equatable/equatable.dart';

class RefreshTokenResponseModel extends Equatable {
  const RefreshTokenResponseModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.jwtToken,
    this.refreshToken,
  });

  factory RefreshTokenResponseModel.fromMap(Map<String, dynamic> map) {
    return RefreshTokenResponseModel(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'],
      lastName: map['lastName'],
      username: map['username'],
      jwtToken: map['jwtToken'],
      refreshToken: map['refreshToken'],
    );
  }

  factory RefreshTokenResponseModel.fromJson(String source) => RefreshTokenResponseModel.fromMap(json.decode(source));

  final int id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? jwtToken;
  final String? refreshToken;

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      username,
      jwtToken,
      refreshToken,
    ];
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }
    if (username != null) {
      result.addAll({'email': username});
    }
    result.addAll({'id': id});

    return result;
  }

  String toJson() => json.encode(toMap());
}
