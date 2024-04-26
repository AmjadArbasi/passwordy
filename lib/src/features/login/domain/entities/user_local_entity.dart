import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/core/utils/mapper/mapper.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserLocalEntity extends Equatable
    implements DataMapperModel<UserLocalModel> {
  const UserLocalEntity({
    this.createdAt,
    this.id,
    this.name,
    this.secret,
    this.lastSuccessfulSignIn,
    this.masterPassword,
  });

  final int? id;
  final String? name;
  final String? masterPassword;
  final String? secret;
  final DateTime? lastSuccessfulSignIn;
  final DateTime? createdAt;

  static const empty = UserLocalEntity();

  bool get isNotEmpty => this != UserLocalEntity.empty;

  bool get isEmpty => this == UserLocalEntity.empty;

  @override
  String toString() {
    return 'UserLocalEntity(id: $id, name: $name, masterPassword: $masterPassword, secret: $secret, lastSuccessfulSignIn: $lastSuccessfulSignIn, createdAt: $createdAt)';
  }

  @override
  UserLocalModel mapToModel() {
    return UserLocalModel(
      id: id,
      name: name,
      masterPassword: masterPassword,
      secret: secret,
      lastSuccessfulSignIn: lastSuccessfulSignIn,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, masterPassword, secret, lastSuccessfulSignIn, createdAt];
}
