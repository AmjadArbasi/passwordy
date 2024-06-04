import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/failure.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

abstract class ICategoryManagerApi {
  Future<Either<Failure, List<CategoryModel>>> loadAllValues();

  Future<Either<Failure, Unit>> addCatchword(
    CatchwordModel catchwordModel,
    CategoryModel categoryModel,
  );

  Future<Either<Failure, Unit>> editCatchword(
    CatchwordModel catchwordModel,
    CategoryModel categoryModel,
  );

  Future<Either<Failure, Unit>> saveCategory(CategoryModel category);

  Future<Either<Failure, Unit>> deleteCatchword(
      int catchwordId, int categoryId);

  Future<Either<Failure, Unit>> deleteCategory(int categoryId);

  Future<Either<Failure, Unit>> addCurrentDateTimeWhenUsed(int id);

  Future<Either<Failure, Unit>> changeEncryptionKey(String username);

  // BehaviorSubject<List<CategoryEntity>> get listCategoriesController;

  // Stream<List<CategoryEntity>> get myModelStream;
}
