import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_list_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  final List<CategoryModel> categories;
  CategoriesModel({
    required this.categories,
  });

  /// Deserializes the given [Map<String, dynamic>] into a [Category] model.
  static CategoriesModel fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  /// Converts this [Category] model into a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

  expand(Function(dynamic element) param0) {}
}
