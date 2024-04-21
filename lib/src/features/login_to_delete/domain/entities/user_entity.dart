import 'package:equatable/equatable.dart';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

/// {@template UserEntity}
/// A single catchword object
///
/// Contains [id], [name], [photo],and [email]
///
/// [UserEntity] is immutable and can be copied using [copyWith],
/// {@endtemplate}
class UserEntity extends Equatable implements DataMapperModel<UserModel> {
  const UserEntity({
    required this.id,
    this.name,
    this.email,
    this.photo,
  });

  /// The id of the user
  final String id;

  /// can  be empty
  final String? name;

  /// The email
  /// can  be empty
  final String? email;

  /// The photo of user
  final String? photo;

  @override
  UserModel mapToModel() {
    return UserModel(
      id: id,
      name: name,
      email: email,
      photo: photo,
    );
  }

  static const empty = UserEntity(id: '');

  bool get isNotEmpty => this != UserEntity.empty;
  bool get isEmpty => this == UserEntity.empty;

  @override
  List<Object?> get props => [id, name, email, photo];

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, photo: $photo)';
  }
}
