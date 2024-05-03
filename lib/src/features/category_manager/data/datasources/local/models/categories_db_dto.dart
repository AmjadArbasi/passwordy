import 'package:flutter_application_passmanager/src/features/category_manager/data/datasources/local/models/models.dart';
import 'package:isar/isar.dart';

part 'categories_db_dto.g.dart';

@collection
class CategoriesDbDto {
  CategoriesDbDto({
    this.id,
    required this.username,
  });

  Id? id = Isar.autoIncrement;

  // @Index(unique: true)
  String username;

  final categories = IsarLinks<CategoryDbDto>();

  @override
  String toString() => 'CategoriesDbDto(id: $id, username: $username)';
}
