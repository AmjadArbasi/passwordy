import 'package:isar/isar.dart';

part 'user_local_dto.g.dart';

// @collection
class UserLocalDto {
  UserLocalDto({
    this.id,
    this.username,
    this.masterPassword,
    this.salt,
    this.token,
    this.securityQuestion,
    this.secret,
    this.lastSuccessfulSignIn,
    this.lastUnuccessfulSignIn,
    this.createdAt,
  });

  Id? id = Isar.autoIncrement;
  @Index(unique: true)
  String? username;
  String? masterPassword;
  String? salt;
  String? token;
  String? securityQuestion;
  String? secret;
  DateTime? lastSuccessfulSignIn;
  DateTime? lastUnuccessfulSignIn;
  DateTime? createdAt;

  @override
  String toString() {
    return 'UserLocalDto(username: $username, masterPassword: $masterPassword, salt: $salt, token: $token, securityQuestion: $securityQuestion, secret: $secret, lastSuccessfulSignIn: $lastSuccessfulSignIn, lastUnuccessfulSignIn: $lastUnuccessfulSignIn, createdAt: $createdAt)';
  }
}
