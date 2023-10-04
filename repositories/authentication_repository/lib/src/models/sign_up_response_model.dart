import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignUpResponseModel extends Equatable {
  const SignUpResponseModel({required this.message});

  factory SignUpResponseModel.fromJson(String source) => SignUpResponseModel.fromMap(json.decode(source));

  factory SignUpResponseModel.fromMap(Map<String, dynamic> map) {
    return SignUpResponseModel(
      message: map['message'] ?? '',
    );
  }

  final String message;

  @override
  List<Object> get props => [message];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{'message': message};
    return result;
  }

  String toJson() => json.encode(toMap());
}
