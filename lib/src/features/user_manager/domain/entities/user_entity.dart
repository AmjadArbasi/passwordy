import 'package:equatable/equatable.dart';

class UserFirebaseEntity extends Equatable {
  const UserFirebaseEntity({
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
  List<Object?> get props => [id, name, email, emailVerified];

  @override
  String toString() {
    return 'UserFirebaseEntity(id: $id, name: $name, email: $email, emailVerified: $emailVerified)';
  }

  UserFirebaseEntity copyWith({
    String? id,
    String? name,
    String? email,
    bool? emailVerified,
  }) {
    return UserFirebaseEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
    );
  }
}
