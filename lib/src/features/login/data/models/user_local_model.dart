import 'package:flutter_application_passmanager/src/core/utils/utils.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserLocalModel implements DataMapperEntity<UserLocalEntity> {
  const UserLocalModel({
    this.id,
    this.name,
    this.masterPassword,
    this.secret,
    this.lastSuccessfulSignIn,
    this.createdAt,
  });

  final int? id;
  final String? name;
  final String? masterPassword;
  final String? secret;
  final String? lastSuccessfulSignIn;
  final DateTime? createdAt;

  static const empty = UserLocalModel();

  bool get isNotEmpty => this != UserLocalModel.empty;

  bool get isEmpty => this == UserLocalModel.empty;

  @override
  String toString() {
    return 'UserLocalModel(id: $id, name: $name, masterPassword: $masterPassword, secret: $secret, lastSuccessfulSignIn: $lastSuccessfulSignIn, createdAt: $createdAt)';
  }

  @override
  UserLocalEntity mapToEntity() {
    return UserLocalEntity(
      id: id,
      name: name,
      masterPassword: masterPassword,
      secret: secret,
      lastSuccessfulSignIn: lastSuccessfulSignIn,
      createdAt: createdAt,
    );
  }
}
