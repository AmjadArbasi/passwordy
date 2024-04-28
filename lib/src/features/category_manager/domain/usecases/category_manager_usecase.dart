import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

/// {@template CategoryApi_repository}
/// A repository that handles catchwords related request
/// {@endtemplate}
class CategoryManagerUsecase {
  /// {@macro catchwords_repository}
  CategoryManagerUsecase({required CategoryManagerRepositryBase api})
      : _api = api;

  final CategoryManagerRepositryBase _api;

  /// provides a [Stream] of all catchwords
  Stream<List<CategoryEntity>> getCategoriesList() => _api.categoriesList();

  ///  add a [catchword]
  Future<void> addCatchword(
          CatchwordEntity catchword, CategoryEntity category) =>
      _api.addCatchword(catchword, category);

  /// edit a [catchword]
  Future<void> editCatchword(
          CatchwordEntity catchword, CategoryEntity category) =>
      _api.editCatchword(catchword, category);

  /// Edit or add a caterory
  Future<void> saveCategory(CategoryEntity category) =>
      _api.saveCategory(category);

  /// delete a specific catchword based on [categoryId] and [catchwordId]
  Future<void> deleteCatchword(int catchwordId, int categoryId) =>
      _api.deleteCatchword(catchwordId, categoryId);

  /// delete a category
  /// when the catchwords contains data
  /// its data will merge to `All` category
  /// otherwise will delete
  Future<void> deleteCategory(int id) => _api.deleteCategory(id);

  /// returns a list of searched catchwords based on [value]
  Future<List<CategoryEntity>> searchCatchword(String value) =>
      _api.searchCatchword(value);

  Future<void> addWhenUsedDateTime(int catchwordId) =>
      _api.addWhenUsedDateTime(catchwordId);

  List<CategoryEntity> sortCatchwordsCategoriesBasedOnDateTime(
    List<CategoryEntity> categories,
  ) =>
      _api.sortCatchwordsCategoriesBasedOnDateTime(categories);
}
