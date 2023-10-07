import 'dart:convert';

import 'package:equatable/equatable.dart';

class VerifyEmailResponseModel extends Equatable {
  const VerifyEmailResponseModel({
    required this.message,
  });

  factory VerifyEmailResponseModel.fromJson(String source) => VerifyEmailResponseModel.fromMap(json.decode(source));

  factory VerifyEmailResponseModel.fromMap(Map<String, dynamic> map) {
    return VerifyEmailResponseModel(
      message: map['message'] ?? '',
    );
  }

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  String toJson() => json.encode(toMap());
}
