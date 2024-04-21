class UserLocalModel {
  final int? id;
  final String? name;
  final String? masterPassword;
  final DateTime? createdAt;

  UserLocalModel({
    this.id,
    required this.name,
    required this.masterPassword,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'UserLocalModel(id: $id, name: $name, masterPassword: $masterPassword, createdAt: $createdAt)';
  }
}
