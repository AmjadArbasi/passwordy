import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/failure.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

abstract class ICategoryManagerApi {
  Future<Either<Failure, List<CategoryModel>>> loadAllValues();

  Future<Either<Failure, CatchwordModel>> addCatchword(
    CatchwordModel catchwordModel,
    CategoryModel categoryModel,
  );

  Future<Either<Failure, CatchwordModel>> editCatchword(
    CatchwordModel catchwordModel,
    CategoryModel categoryModel,
  );

  Future<Either<Failure, CategoryModel>> saveCategory(CategoryModel category);

  Future<Either<Failure, Unit>> deleteCatchword(
      int catchwordId, int categoryId);

  Future<Either<Failure, Unit>> deleteCategory(int categoryId);

  Future<Either<Failure, Unit>> addCurrentDateTimeWhenUsed(int id);
}
