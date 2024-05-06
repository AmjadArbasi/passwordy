import 'package:flutter_application_passmanager/src/features/category_manager/data/datasources/local/models/models.dart';
import 'package:isar/isar.dart';

part 'categories_db_dto.g.dart';

@collection
class CategoriesDbDto {
  CategoriesDbDto({
    this.id,
    required this.linker,
  });

  Id? id = Isar.autoIncrement;

  // @Index(unique: true)
  String linker;

  final categories = IsarLinks<CategoryDbDto>();

  @override
  String toString() => 'CategoriesDbDto(id: $id, linker: $linker)';
}
