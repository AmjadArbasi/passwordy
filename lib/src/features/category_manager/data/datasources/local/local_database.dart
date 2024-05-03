import 'package:flutter_application_passmanager/src/core/services/services.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

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

  var logger = Logger();

  CategoriesDbDto? get categoryListUsername {
    return _cache.read(key: usernameCategories);
  }

  Future<List<CategoryEntity>> loadAllValues() async {
    final token = await _secureStorage.getToken(key);
    final categoriesList = <CategoryEntity>[];

    if (token != null) {
      final user =
          await isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();
      if (user != null) {
        final username = user.username;
        final usernameLinkedCategories = await isar.categoriesDbDtos
            .filter()
            .usernameEqualTo(username!)
            .findFirst();
        if (usernameLinkedCategories != null) {
          _cache.write(
              key: usernameCategories, value: usernameLinkedCategories);

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
    await isar.writeTxn(() async {
      final success = await isar.catchwordDbDtos.delete(catchwordId);
      category?.total -= 1;
      await isar.categoryDbDtos.put(category!);
      logger.i('Delete a catchword $success');
    });
  }

  Future<void> deleteCategory(int categoryId) async {
    await isar.writeTxn(() async {
      final success = await isar.categoryDbDtos.delete(categoryId);
      logger.i('Delete a category $success');
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
      dateTime: catchwordModel.createdAt,
      isVisibile: catchwordModel.isVisible,
      whenUsed: catchwordModel.whenUsed,
    );

    final category = await isar.categoryDbDtos.get(categoryModel.id!);
    await isar.writeTxn(() async {
      // Ensure the new catchword are added
      await isar.catchwordDbDtos.put(newCatchword);

      // Now, add the new catchword /s to the category's existing catchword link
      category!.catchwords.add(newCatchword);

      category.total += 1;

      await isar.categoryDbDtos.put(category);
      // Save its relation
      await category.catchwords.save();
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
      dateTime: catchwordModel.createdAt,
      isVisibile: catchwordModel.isVisible,
      whenUsed: catchwordModel.whenUsed,
    );

    final category = await isar.categoryDbDtos.get(categoryModel.id!);
    await isar.writeTxn(() async {
      // Ensure the new catchword are added
      await isar.catchwordDbDtos.put(newCatchword);

      // Now, add the new catchword /s to the category's existing catchword link
      category!.catchwords.add(newCatchword);

      await isar.categoryDbDtos.put(category);
      // Save its relation
      await category.catchwords.save();
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

    if (categoryList == null) {
      final token = await _secureStorage.getToken(key);

      final user =
          await isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

      if (user != null) {
        final registerUser = CategoriesDbDto(username: user.username!);
        await isar.writeTxn(() async {
          await isar.categoryDbDtos.put(newCategory);
          registerUser.categories.add(newCategory);
          await isar.categoriesDbDtos.put(registerUser);
          await registerUser.categories.save();
        });
      }
    } else {
      await isar.writeTxn(() async {
        await isar.categoryDbDtos.put(newCategory);
        categoryList.categories.add(newCategory);
        await isar.categoriesDbDtos.put(categoryList);
        await categoryList.categories.save();
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
