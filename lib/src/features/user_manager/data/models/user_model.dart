import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

class UserFirebaseModel extends DataMapperEntity<UserFirebaseEntity> {
  UserFirebaseModel({
    required this.id,
    this.name,
    this.email,
    this.emailVerified,
  });

  final String id;
  final String? name;
  final String? email;
  final bool? emailVerified;

  @override
  String toString() {
    return 'UserFirebaseModel(id: $id, name: $name, email: $email, emailVerified: $emailVerified)';
  }

  UserFirebaseModel copyWith({
    String? id,
    String? name,
    String? email,
    bool? emailVerified,
  }) {
    return UserFirebaseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
    );
  }

  @override
  UserFirebaseEntity mapToEntity() {
    return UserFirebaseEntity(
      id: id,
      email: email,
      name: name,
      emailVerified: emailVerified,
    );
  }
}
