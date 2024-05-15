import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
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
  Future<Either<Failure, CatchwordEntity>> addCatchword(
          CatchwordEntity catchword, CategoryEntity category) =>
      _api.addCatchword(catchword, category);

  /// edit a [catchword]
  Future<Either<Failure, CatchwordEntity>> editCatchword(
          CatchwordEntity catchword, CategoryEntity category) =>
      _api.editCatchword(catchword, category);

  /// Edit or add a caterory
  Future<Either<Failure, CategoryEntity>> saveCategory(
          CategoryEntity category) =>
      _api.saveCategory(category);

  /// delete a specific catchword based on [categoryId] and [catchwordId]
  Future<Either<Failure, Unit>> deleteCatchword(
          int catchwordId, int categoryId) =>
      _api.deleteCatchword(catchwordId, categoryId);

  /// delete a category
  /// when the catchwords contains data
  /// its data will merge to `All` category
  /// otherwise will delete
  Future<Either<Failure, Unit>> deleteCategory(int id) =>
      _api.deleteCategory(id);

  /// returns a list of searched catchwords based on [value]
  Future<List<CategoryEntity>> searchCatchword(String value) =>
      _api.searchCatchword(value);

  Future<Either<Failure, Unit>> addWhenUsedDateTime(int catchwordId) =>
      _api.addWhenUsedDateTime(catchwordId);

  List<CategoryEntity> sortCatchwordsCategoriesBasedOnDateTime(
    List<CategoryEntity> categories,
  ) =>
      _api.sortCatchwordsCategoriesBasedOnDateTime(categories);

  Future<void> refreshData() async => await _api.refreshData();
}
