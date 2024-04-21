import 'package:flutter_application_passmanager/src/core/utils/mapper/mapper.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserLocalEntity extends DataMapperModel<UserLocalModel> {
  UserLocalEntity({
    this.createdAt,
    this.id,
    this.name,
    this.masterPassword,
  });

  final int? id;
  final String? name;
  final String? masterPassword;
  final DateTime? createdAt;

  @override
  String toString() {
    return 'UserLocalEntity(id: $id, name: $name, masterPassword: $masterPassword, createdAt: $createdAt)';
  }

  @override
  UserLocalModel mapToModel() {
    return UserLocalModel(
      id: id,
      name: name,
      masterPassword: masterPassword,
      createdAt: createdAt,
    );
  }
}
