import 'dart:convert';

import 'package:equatable/equatable.dart';

class GetUserRequestModel extends Equatable {
  const GetUserRequestModel({
    required this.id,
  });

  factory GetUserRequestModel.fromMap(Map<String, dynamic> map) {
    return GetUserRequestModel(
      id: map['id']?.toInt() ?? 0,
    );
  }

  factory GetUserRequestModel.fromJson(String source) => GetUserRequestModel.fromMap(json.decode(source));

  final int id;

  @override
  List<Object> get props => [id];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}..addAll({'id': id});
  }

  String toJson() => json.encode(toMap());
}
