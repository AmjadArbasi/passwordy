import 'package:flutter_application_passmanager/src/core/utils/utils.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserLocalModel implements DataMapperEntity<UserLocalEntity> {
  const UserLocalModel({
    this.id,
    this.username,
    this.displayName,
    this.masterPassword,
    this.secret,
    this.securityQuestion,
    this.lastSuccessfulSignIn,
    this.lastUnsuccessfulSignIn,
    this.createdAt,
    this.onboardingCompleted,
    this.isAuthorized,
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
  final bool? onboardingCompleted;
  final bool? isAuthorized;

  static const empty = UserLocalModel();

  bool get isNotEmpty => this != UserLocalModel.empty;

  bool get isEmpty => this == UserLocalModel.empty;

  @override
  UserLocalEntity mapToEntity() {
    return UserLocalEntity(
      id: id,
      username: username,
      displayName: displayName,
      masterPassword: masterPassword,
      secret: secret,
      securityQuestion: securityQuestion,
      lastSuccessfulSignIn: lastSuccessfulSignIn,
      lastUnsuccessfulSignIn: lastUnsuccessfulSignIn,
      createdAt: createdAt,
      onboardingCompleted: onboardingCompleted,
      isAuthorized: isAuthorized,
    );
  }

  @override
  String toString() {
    return 'UserLocalModel(id: $id, username: $username, displayName: $displayName, masterPassword: $masterPassword, secret: $secret, securityQuestion: $securityQuestion, lastSuccessfulSignIn: $lastSuccessfulSignIn, lastUnsuccessfulSignIn: $lastUnsuccessfulSignIn, createdAt: $createdAt, onboardingCompleted: $onboardingCompleted, isAuthorized: $isAuthorized)';
  }
}
