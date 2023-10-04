import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/user.dart';

class GetUserResponseModel extends Equatable {
  const GetUserResponseModel({
    required this.users,
  });

  factory GetUserResponseModel.fromJson(String source) => GetUserResponseModel.fromMap(json.decode(source));

  factory GetUserResponseModel.fromMap(Map<String, dynamic> map) {
    return GetUserResponseModel(
      users: List<User>.from(map['users']?.map(User.fromMap)),
    );
  }

  final List<User> users;

  @override
  List<Object> get props => [users];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}..addAll({'users': users.map((x) => x.toMap()).toList()});
  }

  String toJson() => json.encode(toMap());
}
