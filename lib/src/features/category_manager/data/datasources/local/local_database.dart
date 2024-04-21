import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

class AppLocalDatabase {
  AppLocalDatabase({
    required this.categoryModelToDbDtoConverter,
    required this.categoryDbDtoToModelConverter,
    required this.catchwordDbDtoToModelConverter,
    required this.catchwordModelToDbDtoConverter,
    required this.isar,
  });

  final CategoryModelToDbDtoConverter categoryModelToDbDtoConverter;
  final CategoryDbDtoToModelConverter categoryDbDtoToModelConverter;
  final CatchwordModelToDbDtoConverter catchwordModelToDbDtoConverter;
  final CatchwordDbDtoToModelConverter catchwordDbDtoToModelConverter;
  final Isar isar;

  var logger = Logger();

  Future<List<CategoryEntity>> loadAllValues() async {
    final categoriesDbDto = await isar.categoryDbDtos.where().findAll();
    final categoriesModel = categoriesDbDto
        .map(
          (e) => categoryDbDtoToModelConverter.convert(e),
        )
        .toList();
    categoriesDbDto.map((e) {
      e.catchwords.map(
        (e) => logger.f(e),
      );
    });
    return categoriesModel.map((e) => e.mapToEntity()).toList();
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
    await isar.writeTxn(
      () async => isar.categoryDbDtos.put(newCategory),
    );
    return categoryDbDtoToModelConverter.convert(newCategory);
  }
}
