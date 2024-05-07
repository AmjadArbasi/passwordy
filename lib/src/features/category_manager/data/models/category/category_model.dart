import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class CategoryModel extends DataMapperEntity<CategoryEntity> {
  final int? id;
  @JsonKey(name: 'category_name')
  final String categoryName;
  final List<CatchwordModel> catchwords;
  final int total;

  CategoryModel({
    this.id,
    required this.categoryName,
    required this.catchwords,
    required this.total,
  });

  @override
  CategoryEntity mapToEntity() {
    return CategoryEntity(
      id: id,
      categoryName: categoryName,
      catchwords: catchwords.map((e) => e.mapToEntity()).toList(),
      total: total,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, categoryName: $categoryName, catchwords: $catchwords, total: $total)';
  }
}
