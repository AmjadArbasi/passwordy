import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:isar/isar.dart';

class CategoryManagerApi implements ICategoryManagerApi {
  CategoryManagerApi({
    required this.categoryConverterDbDTOModel,
    required this.catchwordConverterDbDTOModel,
    required this.isar,
    required SecureStorage secureStorage,
    CacheClient? cache,
  })  : _secureStorage = secureStorage,
        _cache = cache ?? CacheClient();

  final CategoryConverterDbDTOModel categoryConverterDbDTOModel;
  final CatchwordConverterDbDTOModel catchwordConverterDbDTOModel;
  final Isar isar;
  final SecureStorage _secureStorage;
  final CacheClient _cache;

  final keyToken = GlobalVar.keyToken;

  static const usernameCategories = GlobalVar.usernameCategories;
  static const logsDBuser = GlobalVar.logsDBuser;

  CategoriesDbDto get categoryListUsername {
    final categoriesDbDto = _cache.read(key: usernameCategories);

    if (categoriesDbDto == null) {
      throw CategoryManagerException("user-not-authorized");
    }
    return categoriesDbDto as CategoriesDbDto;
  }

  LogActivitiesDbDto get logsDbUser {
    final logActivitiesDbDto = _cache.read(key: logsDBuser);
    if (logActivitiesDbDto == null) {
      throw CategoryManagerException("logs-not-allowed");
    }
    return logActivitiesDbDto as LogActivitiesDbDto;
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> loadAllValues() async {
    final token = await _secureStorage.getToken(keyToken);
    final user =
        await isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

    if (user != null && token != null) {
      final linker = user.linker;
      final usernameLinkedCategories = await isar.categoriesDbDtos
          .filter()
          .linkerEqualTo(linker!)
          .findFirst();

      final logs = await isar.logActivitiesDbDtos
          .filter()
          .linkerEqualTo(linker)
          .findFirst();

      if (usernameLinkedCategories != null && logs != null) {
        _cache.write(key: usernameCategories, value: usernameLinkedCategories);

        _cache.write(key: logsDBuser, value: logs);

        try {
          final categoriesDbDto =
              await usernameLinkedCategories.categories.filter().findAll();

          final categoriesModel = <CategoryModel>[];
          for (var category in categoriesDbDto) {
            categoriesModel.add(await categoryConverterDbDTOModel
                .categoryDbDtoToModel(category));
          }
          return Right(categoriesModel);
        } catch (e) {
          GlobalVar.logger.e("something-went-wrong", error: e.toString());
          return Left(CategoryManagerException("something-went-wrong"));
        }
      } else {
        return Left(CategoryManagerException("operation-not-allowed"));
      }
    } else {
      return Left(CategoryManagerException("user-not-authorized"));
    }
  }

  @override
  Future<Either<Failure, Unit>> addCatchword(
    CatchwordModel catchwordModel,
    CategoryModel categoryModel,
  ) async {
    final catchwordDbDto =
        await catchwordConverterDbDTOModel.convertModelToDbDto(catchwordModel);

    if (categoryModel.id != null) {
      final category = await isar.categoryDbDtos.get(categoryModel.id!);

      final log = LogActivityDbDto()
        ..name = "Catchword ${catchwordModel.name}"
        ..operation = "add"
        ..pathImage = ImagesMap.images["create"]
        ..dateTime = DateTime.now();

      if (category != null) {
        try {
          await isar.writeTxn(() async {
            // Ensure the new catchword are added
            await isar.catchwordDbDtos.put(catchwordDbDto);

            // Now, add the new catchword /s to the category's existing catchword link
            category.catchwords.add(catchwordDbDto);

            category.total += 1;

            await isar.categoryDbDtos.put(category);
            // Save its relation
            await category.catchwords.save();

            /// logging
            await isar.logActivityDbDtos.put(log);

            logsDbUser.logActivities.add(log);

            await logsDbUser.logActivities.save();
          });

          return const Right(unit);
        } catch (e) {
          GlobalVar.logger.e("something-went-wrong", error: e);
          return Left(CategoryManagerException("something-went-wrong"));
        }
      } else {
        return Left(CategoryManagerException("category-not-found"));
      }
    } else {
      return Left(CategoryManagerException("category-not-found"));
    }
  }

  @override
  Future<Either<Failure, Unit>> editCatchword(
    CatchwordModel catchwordModel,
    CategoryModel categoryModel,
  ) async {
    final catchwordDbDto =
        await catchwordConverterDbDTOModel.convertModelToDbDto(catchwordModel);

    final category = await isar.categoryDbDtos.get(categoryModel.id!);

    final log = LogActivityDbDto()
      ..name = "Catchword ${catchwordModel.name}"
      ..operation = "edit"
      ..pathImage = ImagesMap.images["update"]
      ..dateTime = DateTime.now();

    if (category != null) {
      try {
        await isar.writeTxn(() async {
          // Ensure the new catchword are added
          await isar.catchwordDbDtos.put(catchwordDbDto);

          // Now, add the new catchword /s to the category's existing catchword link
          category.catchwords.add(catchwordDbDto);

          await isar.categoryDbDtos.put(category);
          // Save its relation
          await category.catchwords.save();

          /// logging
          await isar.logActivityDbDtos.put(log);

          logsDbUser.logActivities.add(log);

          await logsDbUser.logActivities.save();
        });

        return const Right(unit);
      } catch (e) {
        GlobalVar.logger.e("something-went-wrong", error: e);
        return Left(CategoryManagerException("something-went-wrong"));
      }
    } else {
      return Left(CategoryManagerException("category-not-found"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCatchword(
      int catchwordId, int categoryId) async {
    final category = await isar.categoryDbDtos.get(categoryId);
    final catchword = await isar.catchwordDbDtos.get(catchwordId);

    final log = LogActivityDbDto()
      ..name = "Catchword ${catchword?.name}"
      ..operation = "delete"
      ..pathImage = ImagesMap.images["delete"]
      ..dateTime = DateTime.now();

    if (category != null && catchword != null) {
      try {
        await isar.writeTxn(() async {
          await isar.catchwordDbDtos.delete(catchwordId);
          category.total -= 1;
          await isar.categoryDbDtos.put(category);

          /// logging
          await isar.logActivityDbDtos.put(log);

          logsDbUser.logActivities.add(log);

          await logsDbUser.logActivities.save();
        });
        return const Right(unit);
      } catch (e) {
        GlobalVar.logger.e("something-went-wrong", error: e);
        return Left(CategoryManagerException("something-went-wrong"));
      }
    } else {
      return Left(CategoryManagerException("catchword-category-not-found"));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveCategory(CategoryModel category) async {
    final newCategory = CategoryDbDto(
      id: category.id,
      categoryName: category.categoryName,
      total: category.total,
    );

    if (category.categoryName.isNotEmpty) {
      final categoryList = categoryListUsername;

      final LogActivityDbDto log;

      if (category.id == null) {
        log = LogActivityDbDto()
          ..name = "Category ${category.categoryName}"
          ..operation = "add"
          ..pathImage = ImagesMap.images["create"]
          ..dateTime = DateTime.now();
      } else {
        log = LogActivityDbDto()
          ..name = "Category-${category.categoryName}"
          ..operation = "edit"
          ..pathImage = ImagesMap.images["update"]
          ..dateTime = DateTime.now();
      }

      final count = await isar.categoryDbDtos
          .filter()
          .categoryNameEqualTo(category.categoryName)
          .count();

      if (count == 0) {
        try {
          await isar.writeTxn(() async {
            await isar.categoryDbDtos.put(newCategory);
            categoryList.categories.add(newCategory);
            await isar.categoriesDbDtos.put(categoryList);
            await categoryList.categories.save();

            /// logging
            await isar.logActivityDbDtos.put(log);

            logsDbUser.logActivities.add(log);

            await logsDbUser.logActivities.save();
          });

          return const Right(unit);
        } catch (e) {
          GlobalVar.logger.e("something-went-error", error: e);
          return Left(CategoryManagerException("something-went-error"));
        }
      } else {
        return Left(CategoryManagerException("category-name-duplicate-found"));
      }
    } else {
      return Left(CategoryManagerException("category-name-empty"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCategory(int categoryId) async {
    final category = await isar.categoryDbDtos.get(categoryId);

    if (category != null) {
      final log = LogActivityDbDto()
        ..name = "Category ${category.categoryName}"
        ..operation = "delete"
        ..pathImage = ImagesMap.images["delete"]
        ..dateTime = DateTime.now();
      try {
        await isar.writeTxn(() async {
          final success = await isar.categoryDbDtos.delete(categoryId);
          GlobalVar.logger.i('Delete a category $success');

          /// logging
          await isar.logActivityDbDtos.put(log);

          logsDbUser.logActivities.add(log);

          await logsDbUser.logActivities.save();
        });
        return const Right(unit);
      } catch (e) {
        GlobalVar.logger.e("something-went-error", error: e);
        return Left(CategoryManagerException("something-went-wrong"));
      }
    } else {
      return Left(CategoryManagerException("category-not-found"));
    }
  }

  @override
  Future<Either<Failure, Unit>> addCurrentDateTimeWhenUsed(int id) async {
    final catchword = await isar.catchwordDbDtos.get(id);

    if (catchword != null) {
      catchword.whenUsed = DateTime.now();
      await isar.writeTxn(() async => isar.catchwordDbDtos.put(catchword));
      return const Right(unit);
    } else {
      return Left(CategoryManagerException("catchword-not-found"));
    }
  }
}
