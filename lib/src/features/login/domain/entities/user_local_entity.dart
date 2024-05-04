import 'package:equatable/equatable.dart';

import 'package:flutter_application_passmanager/src/core/utils/mapper/mapper.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserLocalEntity extends Equatable
    implements DataMapperModel<UserLocalModel> {
  const UserLocalEntity({
    this.createdAt,
    this.id,
    this.username,
    this.displayName,
    this.secret,
    this.securityQuestion,
    this.lastSuccessfulSignIn,
    this.lastUnsuccessfulSignIn,
    this.masterPassword,
  });

  final int? id;
  final String? username;
  final String? displayName;
  final String? masterPassword;
  final String? secret;
  final String? securityQuestion;
  final String? lastSuccessfulSignIn;
  final String? lastUnsuccessfulSignIn;
  final DateTime? createdAt;

  static const empty = UserLocalEntity();

  bool get isNotEmpty => this != UserLocalEntity.empty;

  bool get isEmpty => this == UserLocalEntity.empty;

  @override
  UserLocalModel mapToModel() {
    return UserLocalModel(
      id: id,
      username: username,
      displayName: displayName,
      masterPassword: masterPassword,
      secret: secret,
      securityQuestion: securityQuestion,
      lastSuccessfulSignIn: lastSuccessfulSignIn,
      lastUnsuccessfulSignIn: lastUnsuccessfulSignIn,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        username,
        displayName,
        masterPassword,
        secret,
        securityQuestion,
        lastSuccessfulSignIn,
        lastUnsuccessfulSignIn,
        createdAt
      ];

  @override
  String toString() {
    return 'UserLocalEntity(id: $id, username: $username, displayName: $displayName, masterPassword: $masterPassword, secret: $secret, securityQuestion: $securityQuestion, lastSuccessfulSignIn: $lastSuccessfulSignIn, lastUnsuccessfulSignIn: $lastUnsuccessfulSignIn, createdAt: $createdAt)';
  }
}
