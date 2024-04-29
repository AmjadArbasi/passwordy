import 'package:flutter_application_passmanager/src/core/utils/utils.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserLocalModel implements DataMapperEntity<UserLocalEntity> {
  const UserLocalModel({
    this.id,
    this.name,
    this.masterPassword,
    this.secret,
    this.securityQuestion,
    this.lastSuccessfulSignIn,
    this.lastUnsuccessfulSignIn,
    this.createdAt,
  });

  final int? id;
  final String? name;
  final String? masterPassword;
  final String? secret;
  final String? securityQuestion;
  final String? lastSuccessfulSignIn;
  final String? lastUnsuccessfulSignIn;
  final DateTime? createdAt;

  static const empty = UserLocalModel();

  bool get isNotEmpty => this != UserLocalModel.empty;

  bool get isEmpty => this == UserLocalModel.empty;

  @override
  UserLocalEntity mapToEntity() {
    return UserLocalEntity(
      id: id,
      name: name,
      masterPassword: masterPassword,
      secret: secret,
      securityQuestion: securityQuestion,
      lastSuccessfulSignIn: lastSuccessfulSignIn,
      lastUnsuccessfulSignIn: lastUnsuccessfulSignIn,
      createdAt: createdAt,
    );
  }

  @override
  String toString() {
    return 'UserLocalModel(id: $id, name: $name, masterPassword: $masterPassword, secret: $secret, securityQuestion: $securityQuestion, lastSuccessfulSignIn: $lastSuccessfulSignIn, lastUnsuccessfulSignIn: $lastUnsuccessfulSignIn, createdAt: $createdAt)';
  }
}
