import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:usecases/usecases.dart';

class CreateUserRequestModel extends Equatable {
  const CreateUserRequestModel({
    required this.user,
  });

  factory CreateUserRequestModel.fromMap(Map<String, dynamic> map) {
    return CreateUserRequestModel(
      user: User.fromMap(map['user']),
    );
  }

  factory CreateUserRequestModel.fromJson(
    String source,
  ) =>
      CreateUserRequestModel.fromMap(json.decode(source));

  final User user;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{}..addAll({'user': user.toMap()});
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [user];
}
