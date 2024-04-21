import 'package:isar/isar.dart';

import 'package:flutter_application_passmanager/src/features/category_manager/data/datasources/datasources.dart';

part 'category_db_dto.g.dart';

@collection
class CategoryDbDto {
  CategoryDbDto({
    this.id,
    required this.categoryName,
    required this.total,
  });

  Id? id = Isar.autoIncrement;

  // @Index(unique: true)
  String categoryName;

  final catchwords = IsarLinks<CatchwordDbDto>();

  int total;

  @override
  String toString() =>
      'CategoryDbDto(id: $id, categoryName: $categoryName, total: $total)';
}
