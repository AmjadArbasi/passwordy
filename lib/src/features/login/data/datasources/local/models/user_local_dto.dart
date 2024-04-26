import 'package:isar/isar.dart';

part 'user_local_dto.g.dart';

@collection
class UserLocalDto {
  UserLocalDto({
    this.id,
    this.username,
    this.masterPassword,
    this.salt,
    this.token,
    this.secret,
    this.lastSuccessfulSignIn,
    this.createdAt,
  });

  Id? id = Isar.autoIncrement;
  @Index(unique: true)
  String? username;
  String? masterPassword;
  String? salt;
  String? token;
  String? secret;
  DateTime? lastSuccessfulSignIn;
  DateTime? createdAt;

  @override
  String toString() {
    return "UserLocalDto(id: $id, username: $username, masterPassword: $masterPassword, salt: $salt, token: $token, secret: $secret, lastSuccessfulSignIn: $lastSuccessfulSignIn, createdAt: $createdAt)";
  }
}
