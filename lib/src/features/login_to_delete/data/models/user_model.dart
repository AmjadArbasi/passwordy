import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserModel extends Equatable implements DataMapperEntity<UserEntity> {
  const UserModel({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  final String id;
  final String? email;
  final String? name;
  final String? photo;

  static const empty = UserModel(id: '');

  bool get isNotEmpty => this != UserModel.empty;
  bool get isEmpty => this == UserModel.empty;

  @override
  List<Object?> get props => [id, email, name, photo];

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, photo: $photo)';
  }

  @override
  UserEntity mapToEntity() {
    return UserEntity(id: id, name: name, email: email, photo: photo);
  }
}
