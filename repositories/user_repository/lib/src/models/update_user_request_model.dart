import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:usecases/usecases.dart';

class UpdateUserRequestModel extends Equatable {
  const UpdateUserRequestModel({
    required this.user,
  });

  factory UpdateUserRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateUserRequestModel(
      user: User.fromMap(map['user']),
    );
  }

  factory UpdateUserRequestModel.fromJson(
    String source,
  ) =>
      UpdateUserRequestModel.fromMap(json.decode(source));

  final User user;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}..addAll({'user': user.toMap()});
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [user];
}
