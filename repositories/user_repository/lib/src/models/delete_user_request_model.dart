import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeleteUserRequestModel extends Equatable {
  const DeleteUserRequestModel({
    required this.id,
  });

  factory DeleteUserRequestModel.fromMap(Map<String, dynamic> map) {
    return DeleteUserRequestModel(
      id: map['id']?.toInt() ?? 0,
    );
  }

  factory DeleteUserRequestModel.fromJson(String source) => DeleteUserRequestModel.fromMap(json.decode(source));

  final int id;

  @override
  List<Object> get props => [id];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}..addAll({'id': id});
  }

  String toJson() => json.encode(toMap());
}
