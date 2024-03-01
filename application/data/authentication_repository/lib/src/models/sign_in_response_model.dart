import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignInResponseModel extends Equatable {
  const SignInResponseModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.jwtToken,
  });

  factory SignInResponseModel.fromMap(Map<String, dynamic> map) {
    return SignInResponseModel(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'],
      lastName: map['lastName'],
      username: map['username'],
      jwtToken: map['jwtToken'],
    );
  }

  factory SignInResponseModel.fromJson(String source) => SignInResponseModel.fromMap(json.decode(source));

  final int id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? jwtToken;

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      username,
      jwtToken,
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
    if (jwtToken != null) {
      result.addAll({'jwtToken': jwtToken});
    }
    result.addAll({'id': id});

    return result;
  }

  String toJson() => json.encode(toMap());
}