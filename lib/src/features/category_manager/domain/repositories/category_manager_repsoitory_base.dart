import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

/// {@template catchwords_api}
/// The interface and models for an API providing access to Passwords
/// {@endtemplate}
abstract class CategoryManagerRepositryBase {
  /// {@macro catchwords_api}
  const CategoryManagerRepositryBase();

  /// Returns a stream of Catories List that every one of them has
  /// a id, name_category, catchwords have (CatchwordEntity) and total
  Stream<List<CategoryEntity>> categoriesList();

  /// Load all categories
  Future<void> loadAllCategories();

  /// Adds a Catchword
  Future<Either<Failure, Unit>> addCatchword(
      CatchwordEntity catchwordEntity, CategoryEntity categoryEntity);

  /// Edits a catchword
  Future<Either<Failure, Unit>> editCatchword(
      CatchwordEntity catchwordEntity, CategoryEntity categoryEntity);

  /// Edit or Add a category
  /// search for the category through that gave
  /// when find it either updated or add
  Future<Either<Failure, Unit>> saveCategory(CategoryEntity category);

  /// Delete a catchword
  /// the catchwords list from given category
  /// delete the catchword then,
  /// updates the given category.
  /// throws an exception if its an empty
  Future<Either<Failure, Unit>> deleteCatchword(
      int catchwordId, int categoryId);

  /// Delete a category
  /// from the stream find related category
  ///
  Future<Either<Failure, Unit>> deleteCategory(int id);

  /// search for a spicific catchword from the catchwords
  /// based on the value => value=Password service name,
  ///  value=Service id
  /// returns null if there is no Catchword match!
  Future<List<CategoryEntity>> searchCatchword(String value);

  Future<Either<Failure, Unit>> addWhenUsedDateTime(int catchwordId);

  List<CategoryEntity> sortCatchwordsCategoriesBasedOnDateTime(
      List<CategoryEntity> categories);

  Future<Either<Failure, List<CategoryModel>>> refreshData();

  Future<Either<Failure, Unit>> changeEncryptionKey(String username);
}
