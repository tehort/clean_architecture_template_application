import 'dart:convert';

import 'package:core_domain/core_domain.dart';
import 'package:equatable/equatable.dart';

class GetUsersResponseModel extends Equatable {
  const GetUsersResponseModel({
    required this.users,
  });

  factory GetUsersResponseModel.fromJson(String source) => GetUsersResponseModel.fromMap(json.decode(source));

  factory GetUsersResponseModel.fromMap(Map<String, dynamic> map) {
    return GetUsersResponseModel(
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
