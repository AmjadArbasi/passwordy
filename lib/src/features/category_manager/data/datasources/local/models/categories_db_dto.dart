import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:isar/isar.dart';

part 'categories_db_dto.g.dart';

@collection
class CategoriesDbDto {
  CategoriesDbDto();

  Id? id = Isar.autoIncrement;

  final categories = IsarLinks<CategoryDbDto>();
  final user = IsarLink<UserLocalDto>();

  @override
  String toString() =>
      'CategoriesDbDto(id: $id, categories: $categories, user: $user)';
}
