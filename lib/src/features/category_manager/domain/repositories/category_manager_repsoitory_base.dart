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

  /// Adds a Catchword
  Future<void> addCatchword(
      CatchwordEntity catchwordEntity, CategoryEntity categoryEntity);

  /// Edits a catchword
  Future<void> editCatchword(
      CatchwordEntity catchwordEntity, CategoryEntity categoryEntity);

  /// Edit or Add a category
  /// search for the category through that gave
  /// when find it either updated or add
  Future<void> saveCategory(CategoryEntity category);

  /// Delete a catchword
  /// the catchwords list from given category
  /// delete the catchword then,
  /// updates the given category.
  /// throws an exception if its an empty
  Future<void> deleteCatchword(int catchwordId, int categoryId);

  /// Delete a category
  /// from the stream find related category
  ///
  Future<void> deleteCategory(int id);

  /// search for a spicific catchword from the catchwords
  /// based on the value => value=Password service name,
  ///  value=Service id
  /// returns null if there is no Catchword match!
  Future<List<CategoryEntity>> searchCatchword(String value);

  Future<void> addWhenUsedDateTime(int catchwordId);

  List<CategoryEntity> sortCatchwordsCategoriesBasedOnDateTime(
    List<CategoryEntity> categories,
  );
}

/// Throws an excpetion if there is no cathword
final class CatchwordNotFoundException implements Exception {}

/// Throws an excpetion if there is no category
final class CategoryNotFoundException implements Exception {}

/// Throws an excpetion if there are no match in all categories
final class CatchwordSearchedResultWasNotFound implements Exception {}

/// Throws an exception if the number of categories equal one
/// which means there is only one category and you cant delete it
final class CategoryCantDeleteLastOne implements Exception {}

/// Throws an exception if there is category name already added
/// Not allowed duplicate category
final class CategoryCantBeDuplicated implements Exception {}
