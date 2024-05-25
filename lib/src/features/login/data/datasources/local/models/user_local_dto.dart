import 'package:isar/isar.dart';

part 'user_local_dto.g.dart';

@collection
class UserLocalDto {
  UserLocalDto({
    this.id,
    this.username,
    this.displayName,
    this.masterPassword,
    this.salt,
    this.token,
    this.linker,
    this.securityQuestion,
    this.secret,
    this.iv,
    this.lastSuccessfulSignIn,
    this.lastUnuccessfulSignIn,
    this.createdAt,
  });

  Id? id = Isar.autoIncrement;
  @Index(unique: true)
  String? username;
  String? displayName;
  String? masterPassword;
  String? salt;
  String? token;
  String? linker;
  String? securityQuestion;
  String? secret;
  String? iv;
  DateTime? lastSuccessfulSignIn;
  DateTime? lastUnuccessfulSignIn;
  DateTime? createdAt;

  @override
  String toString() {
    return 'UserLocalDto(username: $username, displayName: $displayName, masterPassword: $masterPassword, salt: $salt, token: $token, linker: $linker, securityQuestion: $securityQuestion, secret: $secret, iv: $iv, lastSuccessfulSignIn: $lastSuccessfulSignIn, lastUnuccessfulSignIn: $lastUnuccessfulSignIn, createdAt: $createdAt)';
  }
}
