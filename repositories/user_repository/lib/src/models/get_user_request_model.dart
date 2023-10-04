import 'dart:convert';

import 'package:equatable/equatable.dart';

class GetUserResponseModel extends Equatable {
  const GetUserResponseModel({
    required this.id,
  });

  factory GetUserResponseModel.fromMap(Map<String, dynamic> map) {
    return GetUserResponseModel(
      id: map['id']?.toInt() ?? 0,
    );
  }

  factory GetUserResponseModel.fromJson(String source) => GetUserResponseModel.fromMap(json.decode(source));

  final int id;

  @override
  List<Object> get props => [id];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}..addAll({'id': id});
  }

  String toJson() => json.encode(toMap());
}
