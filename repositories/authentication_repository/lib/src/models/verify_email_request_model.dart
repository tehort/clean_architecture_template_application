import 'dart:convert';

import 'package:equatable/equatable.dart';

class VerifyEmailRequestModel extends Equatable {
  const VerifyEmailRequestModel({
    required this.token,
  });

  factory VerifyEmailRequestModel.fromJson(String source) => VerifyEmailRequestModel.fromMap(json.decode(source));

  factory VerifyEmailRequestModel.fromMap(Map<String, dynamic> map) {
    return VerifyEmailRequestModel(
      token: map['token'] ?? '',
    );
  }

  final String token;

  @override
  List<Object?> get props => [
        token,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{'token': token};
    return result;
  }

  String toJson() => json.encode(toMap());
}
