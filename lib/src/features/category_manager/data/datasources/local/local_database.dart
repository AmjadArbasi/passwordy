import 'package:flutter_application_passmanager/src/core/constants/constants.dart';
import 'package:flutter_application_passmanager/src/core/services/services.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:isar/isar.dart';

class AppLocalDatabase {
  AppLocalDatabase({
    required this.categoryModelToDbDtoConverter,
    required this.categoryDbDtoToModelConverter,
    required this.catchwordDbDtoToModelConverter,
    required this.catchwordModelToDbDtoConverter,
    required this.isar,
    required SecureStorage secureStorage,
    CacheClient? cacheClient,
  })  : _secureStorage = secureStorage,
        _cache = cacheClient ?? CacheClient();

  final CategoryModelToDbDtoConverter categoryModelToDbDtoConverter;
  final CategoryDbDtoToModelConverter categoryDbDtoToModelConverter;
  final CatchwordModelToDbDtoConverter catchwordModelToDbDtoConverter;
  final CatchwordDbDtoToModelConverter catchwordDbDtoToModelConverter;
  final Isar isar;
  final SecureStorage _secureStorage;
  final CacheClient _cache;

  static const String key = "token";

  static const usernameCategories = '__user_categories_cache_key__';
  static const logsDBuser = '__logs_db_user_cache_key__';

  CategoriesDbDto? get categoryListUsername =>
      _cache.read(key: usernameCategories);

  LogActivitiesDbDto? get logsDbUser => _cache.read(key: logsDBuser);

  Future<List<CategoryEntity>> loadAllValues() async {
    final token = await _secureStorage.getToken(key);
    final categoriesList = <CategoryEntity>[];

    if (token != null) {
      final user =
          await isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();
      if (user != null) {
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
          _cache.write(
              key: usernameCategories, value: usernameLinkedCategories);

          _cache.write(key: logsDBuser, value: logs);

          final categoriesDbDto =
              await usernameLinkedCategories.categories.filter().findAll();

          final categoriesModel = categoriesDbDto
              .map((e) => categoryDbDtoToModelConverter.convert(e))
              .toList();

          return categoriesModel.map((e) => e.mapToEntity()).toList();
        } else {
          return categoriesList;
        }
      }
    }
    return categoriesList;
  }

  Future<void> deleteCatchword(int catchwordId, int categoryId) async {
    final category = await isar.categoryDbDtos.get(categoryId);
    final catchword = await isar.catchwordDbDtos.get(catchwordId);

    final log = LogActivityDbDto()
      ..name = "Catchword ${catchword?.name}"
      ..operation = "delete"
      ..pathImage = ImagesMap.images["delete"]
      ..dateTime = DateTime.now();

    await isar.writeTxn(() async {
      final success = await isar.catchwordDbDtos.delete(catchwordId);
      category?.total -= 1;
      await isar.categoryDbDtos.put(category!);

      GlobalVar.logger.i('Delete a catchword $success');

      /// logging
      await isar.logActivityDbDtos.put(log);

      logsDbUser!.logActivities.add(log);

      await logsDbUser!.logActivities.save();
    });
  }

  Future<void> deleteCategory(int categoryId) async {
    final category = await isar.categoryDbDtos.get(categoryId);

    final log = LogActivityDbDto()
      ..name = "Category ${category?.categoryName}"
      ..operation = "delete"
      ..pathImage = ImagesMap.images["delete"]
      ..dateTime = DateTime.now();

    await isar.writeTxn(() async {
      final success = await isar.categoryDbDtos.delete(categoryId);
      GlobalVar.logger.i('Delete a category $success');

      /// logging
      await isar.logActivityDbDtos.put(log);

      logsDbUser!.logActivities.add(log);

      await logsDbUser!.logActivities.save();
    });
  }

  Future<CatchwordModel> addCatchword(
    CatchwordModel catchwordModel,
    CategoryModel categoryModel,
  ) async {
    final newCatchword = CatchwordDbDto(
      id: catchwordModel.id,
      name: catchwordModel.name,
      accountId: catchwordModel.accountId,
      passcode: catchwordModel.passcode,
      note: catchwordModel.note,
      dateTime: catchwordModel.createdAt,
      isVisibile: catchwordModel.isVisible,
      whenUsed: catchwordModel.whenUsed,
    );

    final category = await isar.categoryDbDtos.get(categoryModel.id!);

    final log = LogActivityDbDto()
      ..name = "Catchword ${catchwordModel.name}"
      ..operation = "add"
      ..pathImage = ImagesMap.images["create"]
      ..dateTime = DateTime.now();

    await isar.writeTxn(() async {
      // Ensure the new catchword are added
      await isar.catchwordDbDtos.put(newCatchword);

      // Now, add the new catchword /s to the category's existing catchword link
      category!.catchwords.add(newCatchword);

      category.total += 1;

      await isar.categoryDbDtos.put(category);
      // Save its relation
      await category.catchwords.save();

      /// logging
      await isar.logActivityDbDtos.put(log);

      logsDbUser!.logActivities.add(log);

      await logsDbUser!.logActivities.save();
    });
    return catchwordDbDtoToModelConverter.convert(newCatchword);
  }

  Future<CatchwordModel> editCatchword(
    CatchwordModel catchwordModel,
    CategoryModel categoryModel,
  ) async {
    final newCatchword = CatchwordDbDto(
      id: catchwordModel.id,
      name: catchwordModel.name,
      accountId: catchwordModel.accountId,
      passcode: catchwordModel.passcode,
      note: catchwordModel.note,
      dateTime: catchwordModel.createdAt,
      isVisibile: catchwordModel.isVisible,
      whenUsed: catchwordModel.whenUsed,
    );

    final category = await isar.categoryDbDtos.get(categoryModel.id!);

    final log = LogActivityDbDto()
      ..name = "Catchword ${catchwordModel.name}"
      ..operation = "Edit"
      ..pathImage = ImagesMap.images["update"]
      ..dateTime = DateTime.now();

    await isar.writeTxn(() async {
      // Ensure the new catchword are added
      await isar.catchwordDbDtos.put(newCatchword);

      // Now, add the new catchword /s to the category's existing catchword link
      category!.catchwords.add(newCatchword);

      await isar.categoryDbDtos.put(category);
      // Save its relation
      await category.catchwords.save();

      /// logging
      await isar.logActivityDbDtos.put(log);

      logsDbUser!.logActivities.add(log);

      await logsDbUser!.logActivities.save();
    });
    return catchwordDbDtoToModelConverter.convert(newCatchword);
  }

  Future<CategoryModel> saveCategory(CategoryModel category) async {
    final newCategory = CategoryDbDto(
      id: category.id,
      categoryName: category.categoryName,
      total: category.total,
    );
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
        ..operation = "update"
        ..pathImage = ImagesMap.images["update"]
        ..dateTime = DateTime.now();
    }

    if (categoryList != null) {
      await isar.writeTxn(() async {
        await isar.categoryDbDtos.put(newCategory);
        categoryList.categories.add(newCategory);
        await isar.categoriesDbDtos.put(categoryList);
        await categoryList.categories.save();

        /// logging
        await isar.logActivityDbDtos.put(log);

        logsDbUser!.logActivities.add(log);

        await logsDbUser!.logActivities.save();
      });
    }

    return categoryDbDtoToModelConverter.convert(newCategory);
  }

  Future<void> addCurrentDateTimeWhenUsed(int id) async {
    final catchword = await isar.catchwordDbDtos.get(id);

    if (catchword != null) {
      catchword.whenUsed = DateTime.now();
      await isar.writeTxn(() async => isar.catchwordDbDtos.put(catchword));
    }
  }
}
