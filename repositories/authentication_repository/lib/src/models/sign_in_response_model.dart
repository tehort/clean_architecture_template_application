import 'dart:convert';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class SignInResponseModel extends Equatable {
  const SignInResponseModel({
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

  factory SignInResponseModel.fromMap(Map<String, dynamic> map) {
    return SignInResponseModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      role: map['role'],
      isVerified: map['isVerified'] ?? false,
      jwtToken: map['jwtToken'],
      created: fromStringToDateTime(map['created'])!,
      updated: map['updated'] != null ? fromStringToDateTime(map['updated']) : null,
    );
  }

  factory SignInResponseModel.fromJson(String source) => SignInResponseModel.fromMap(json.decode(source));

  final int id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? role;
  final bool isVerified;
  final String? jwtToken;
  final DateTime created;
  final DateTime? updated;

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
}
