import 'package:isar/isar.dart';

part 'user_local_dto.g.dart';

@collection
class UserLocalDto {
  UserLocalDto({
    this.id,
    this.username,
    this.masterPassword,
    this.salt,
    this.createdAt,
  });

  Id? id = Isar.autoIncrement;
  @Index(unique: true)
  String? username;
  String? masterPassword;
  String? salt;
  DateTime? createdAt;
}
