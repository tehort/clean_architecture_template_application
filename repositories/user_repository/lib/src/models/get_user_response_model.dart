import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/user.dart';

class GetUserResponseModel extends Equatable {
  const GetUserResponseModel({
    required this.user,
  });

  factory GetUserResponseModel.fromMap(Map<String, dynamic> map) {
    return GetUserResponseModel(
      user: User.fromMap(map['user']),
    );
  }

  factory GetUserResponseModel.fromJson(
    String source,
  ) =>
      GetUserResponseModel.fromMap(json.decode(source));

  final User user;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}..addAll({'user': user.toMap()});
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [user];
}
