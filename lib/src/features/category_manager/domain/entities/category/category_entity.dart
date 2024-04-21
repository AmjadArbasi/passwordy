import 'package:equatable/equatable.dart';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

///{@template CategoriesEntity}
/// The category model is repsonisble to parsing
/// the category object from json
/// it has [id], [categoryName], [catchwords] and [total]
/// [Category] is immutable and can be copied using [copyWith],
///{@endtemplate}
class CategoryEntity extends Equatable
    implements DataMapperModel<CategoryModel> {
  ///{@macro categoryEntity}
  const CategoryEntity({
    this.categoryName = 'uncategorized',
    this.catchwords = const [],
    this.total = 0,
    this.id,
  });

  /// Uniqe id for every ones
  /// cant be empty
  final int? id;

  /// The name of the category
  /// the default value if the user does not assign
  /// is default
  final String categoryName;

  /// A list of Catchword
  /// can be empty
  final List<CatchwordEntity> catchwords;

  /// The total of category
  final int total;

  /// {@macro category}
  /// returns the updated copy of the instance
  CategoryEntity copyWith({
    int? id,
    String? categoryName,
    List<CatchwordEntity>? catchwords,
    int? total,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      catchwords: catchwords ?? this.catchwords,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [id, categoryName, catchwords, total];

  @override
  CategoryModel mapToModel() {
    return CategoryModel(
      id: id,
      categoryName: categoryName,
      catchwords: catchwords.map((e) => e.mapToModel()).toList(),
      total: total,
    );
  }

  @override
  String toString() {
    return 'CategoryEntity(id: $id, categoryName: $categoryName, catchwords: $catchwords, total: $total)';
  }
}
