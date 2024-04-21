import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:rxdart/rxdart.dart';

/// {@template category_manager_repository_impl}
/// A flutter implementation of the CatchwordsApi that uses local storage
/// {@endtemplate}
class CategoryManagerRepsoitoryImpl extends CategoryManagerRepositryBase {
  /// {@macro category_manager_repository_impl}
  CategoryManagerRepsoitoryImpl({
    required AppLocalDatabase appLocalDatabase,
  }) : _appLocalDatabase = appLocalDatabase {
    _init();
  }

  final AppLocalDatabase _appLocalDatabase;

  final _categoriesListController = BehaviorSubject<List<CategoryEntity>>();

  _init() async {
    final categories = await _appLocalDatabase.loadAllValues();
    if (categories.isEmpty) {
      _categoriesListController.add(const []);
    } else {
      _categoriesListController.add(categories);
    }
  }

  _keepStreamFresh() async {
    final categories = await _appLocalDatabase.loadAllValues();
    _categoriesListController.add(categories);
  }

  @override
  Stream<List<CategoryEntity>> categoriesList() => _categoriesListController;

  @override
  Future<void> deleteCatchword(int catchwordId, int categoryId) async {
    await _keepStreamFresh();
    final categories = [..._categoriesListController.value];
    final indexCategory =
        categories.indexWhere((element) => element.id == categoryId);
    if (indexCategory != -1) {
      final category = categories[indexCategory];
      final catchwords = category.catchwords;
      final indexCatchword =
          catchwords.indexWhere((element) => element.id == catchwordId);

      if (indexCatchword != -1) {
        await _appLocalDatabase.deleteCatchword(catchwordId, categoryId);
        await _keepStreamFresh();
      } else {
        throw CatchwordNotFoundException();
      }
    } else {
      throw CategoryNotFoundException();
    }
  }

  @override
  Future<List<CategoryEntity>> searchCatchword(String value) async {
    await _keepStreamFresh();
    final categoriesList = [..._categoriesListController.value];
    final result = <CategoryEntity>[];

    for (final category in categoriesList) {
      final matchingCatchwords = category.catchwords
          .where(
            (element) =>
                element.name.toLowerCase().contains(value.toLowerCase()) ||
                element.accountId.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
      if (matchingCatchwords.isNotEmpty) {
        result.add(
          CategoryEntity(
            id: category.id,
            categoryName: category.categoryName,
            catchwords: matchingCatchwords,
            total: matchingCatchwords.length,
          ),
        );
      }
    }
    return result;
  }

  @override
  Future<void> saveCategory(CategoryEntity category) async {
    await _keepStreamFresh();
    final categories = [..._categoriesListController.value];
    final duplicateCategoryName = categories.any(
      (element) => element.categoryName == category.categoryName,
    );
    if (!duplicateCategoryName) {
      final categoryModel = category.mapToModel();
      await _appLocalDatabase.saveCategory(categoryModel);
      await _keepStreamFresh();
    } else {
      throw CategoryCantBeDuplicated();
    }
  }

  @override
  Future<void> deleteCategory(int id) async {
    await _keepStreamFresh();
    final categories = [..._categoriesListController.value];
    final indexCategory =
        categories.indexWhere((category) => category.id == id);

    if (indexCategory != -1) {
      /// If the [category] has an empty catchwords just delete it
      if (categories[indexCategory].catchwords.isEmpty) {
        await _appLocalDatabase.deleteCategory(id);
        await _keepStreamFresh();
        return;
      } else {
        /// If the category has catchwords unlinks them from it
        /// and link them to `uncategorized` category
        final indexUncateorizedCategory = categories.indexWhere(
          (element) => element.categoryName.toLowerCase() == 'uncategorized',
        );
        // hold up catchwords from deleted category
        final catchwords = categories[indexCategory].catchwords;
        // check it the uncategorized exist or not
        // if exist
        if (indexUncateorizedCategory != -1) {
          for (final catchword in catchwords) {
            /// Adds a catchword to the specified category. Assumes categories index is valid.
            await addCatchword(
                catchword, categories[indexUncateorizedCategory]);
          }
        } else {
          // if not exist create it
          const unCategorized = CategoryEntity();
          await saveCategory(unCategorized);
          //. Assuming 'catchwords' is a list of catchword and 'categories' is a list of categories
          /// 'indexUncategorizedCategoryAfterAdded' is the index of the uncategorized category to which we are adding catchwords
          final categoriesNew = [..._categoriesListController.value];
          final indexUncateorizedCategoryAfterAdded = categoriesNew.indexWhere(
            (category) =>
                category.categoryName.toLowerCase() == 'uncategorized',
          );
          for (final catchword in catchwords) {
            /// Adds a catchword to the specified category. Assumes categories index is valid.
            await addCatchword(
                catchword, categoriesNew[indexUncateorizedCategoryAfterAdded]);
          }
        }
        await _appLocalDatabase.deleteCategory(id);
        await _keepStreamFresh();
      }
    } else {
      throw CategoryNotFoundException();
    }
  }

  @override
  Future<void> addCatchword(
    CatchwordEntity catchwordEntity,
    CategoryEntity categoryEntity,
  ) async {
    await _keepStreamFresh();
    final categories = [..._categoriesListController.value];

    final indexCategory =
        categories.indexWhere((category) => category.id == categoryEntity.id);
    if (indexCategory != -1) {
      final categoryModel = categoryEntity.mapToModel();
      final catchwordModel = catchwordEntity.mapToModel();

      await _appLocalDatabase.addCatchword(catchwordModel, categoryModel);
      await _keepStreamFresh();
    } else {
      throw CategoryNotFoundException();
    }
  }

  @override
  Future<void> editCatchword(
    CatchwordEntity catchwordEntity,
    CategoryEntity categoryEntity,
  ) async {
    await _keepStreamFresh();
    final categories = [..._categoriesListController.value];

    final indexNewCategory =
        categories.indexWhere((category) => category.id == categoryEntity.id);
    final indexOldCategory = categories.indexWhere(
      (category) =>
          category.catchwords
              .any((catchword) => catchword.id == catchwordEntity.id) ==
          true,
    );
    if (indexNewCategory != -1 || indexOldCategory != -1) {
      final categoryModel = categoryEntity.mapToModel();
      final catchwordModel = catchwordEntity.mapToModel();
      if (categories[indexOldCategory].id != categories[indexNewCategory].id) {
        await _appLocalDatabase.deleteCatchword(
          catchwordEntity.id!,
          categories[indexOldCategory].id!,
        );
        await _appLocalDatabase.addCatchword(catchwordModel, categoryModel);
      } else {
        await _appLocalDatabase.editCatchword(catchwordModel, categoryModel);
      }
      await _keepStreamFresh();
    } else {
      throw CategoryNotFoundException();
    }
  }
}
