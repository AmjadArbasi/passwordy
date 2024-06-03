import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:rxdart/rxdart.dart';

/// {@template category_manager_repository_impl}
/// A flutter implementation of the CatchwordsApi that uses local storage
/// {@endtemplate}
class CategoryManagerRepsoitoryImpl extends CategoryManagerRepositryBase {
  /// {@macro category_manager_repository_impl}
  CategoryManagerRepsoitoryImpl({
    required ICategoryManagerApi categoryManagerApi,
  }) : _categoryManagerApi = categoryManagerApi {
    _init();
  }

  final ICategoryManagerApi _categoryManagerApi;

  final _categoriesListController = BehaviorSubject<List<CategoryEntity>>();

  @override
  Stream<List<CategoryEntity>> categoriesList() => _categoriesListController;

  _init() async {
    final result = await _categoryManagerApi.loadAllValues();

    result.fold(
      (failure) {
        GlobalVar.logger.e(failure.message);
        _categoriesListController.add(const []);
      },
      (categories) {
        final list = categories.map((e) => e.mapToEntity()).toList();
        if (list.isEmpty) {
          _categoriesListController.add(const []);
        } else {
          _categoriesListController.add(list);
        }
      },
    );
  }

  Future<Either<Failure, List<CategoryModel>>> _keepStreamFresh() async {
    final failureOrSuccess = await _categoryManagerApi.loadAllValues();

    return failureOrSuccess.fold(
      (failure) {
        GlobalVar.logger.e(failure.message);
        return Left(failure);
      },
      (categories) {
        final list = categories.map((e) => e.mapToEntity()).toList();
        _categoriesListController.add(list);
        return Right(categories);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> addCatchword(
    CatchwordEntity catchwordEntity,
    CategoryEntity categoryEntity,
  ) async {
    final categoryModel = categoryEntity.mapToModel();
    final catchwordModel = catchwordEntity.mapToModel();

    final failureOrSuccess =
        await _categoryManagerApi.addCatchword(catchwordModel, categoryModel);

    return failureOrSuccess.fold(
      (failure) => Left(failure),
      (category) async {
        await _keepStreamFresh();
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> editCatchword(
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
    final categoryModel = categoryEntity.mapToModel();
    final catchwordModel = catchwordEntity.mapToModel();

    if (categories[indexOldCategory].id != categories[indexNewCategory].id) {
      final failureOrSuccess = await _categoryManagerApi.deleteCatchword(
        catchwordEntity.id!,
        categories[indexOldCategory].id!,
      );

      failureOrSuccess.fold(
        (failure) => GlobalVar.logger.e(failure.message),
        (_) => const Right(unit),
      );
      final result = await _categoryManagerApi.addCatchword(
        catchwordModel,
        categoryModel,
      );

      return result.fold(
        (failure) => Left(failure),
        (category) async {
          await _keepStreamFresh();
          return const Right(unit);
        },
      );
    } else {
      final failureOrSuccess = await _categoryManagerApi.editCatchword(
        catchwordModel,
        categoryModel,
      );

      return failureOrSuccess.fold(
        (failure) => Left(failure),
        (category) async {
          await _keepStreamFresh();
          return const Right(unit);
        },
      );
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> refreshData() async =>
      await _keepStreamFresh();

  @override
  Future<Either<Failure, Unit>> deleteCatchword(
      int catchwordId, int categoryId) async {
    final failureOrSuccess =
        await _categoryManagerApi.deleteCatchword(catchwordId, categoryId);

    return failureOrSuccess.fold(
      (failure) => Left(failure),
      (category) async {
        await _keepStreamFresh();
        return const Right(unit);
      },
    );
  }

  @override
  Future<List<CategoryEntity>> searchCatchword(String value) async {
    await _keepStreamFresh();
    final categoriesList = [..._categoriesListController.value];
    final result = <CategoryEntity>[];
    if (value.isNotEmpty) {
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
    }
    return result;
  }

  @override
  List<CategoryEntity> sortCatchwordsCategoriesBasedOnDateTime(
      List<CategoryEntity> categories) {
    final catchwordsWithCategories =
        <MapEntry<CatchwordEntity, CategoryEntity>>[];

    final result = <CategoryEntity>[];
    const limit = 7;

    for (var category in categories) {
      for (var catchword in category.catchwords) {
        catchwordsWithCategories.add(MapEntry(catchword, category));
      }
    }

    /// Sorting based on whenUsed
    catchwordsWithCategories
        .sort((a, b) => b.key.whenUsed.compareTo(a.key.whenUsed));

    /// Outputting the sorted list
    for (var entry in catchwordsWithCategories) {
      final category = CategoryEntity(
        id: entry.value.id,
        categoryName: entry.value.categoryName,
        catchwords: [entry.key],
        total: entry.value.total,
      );
      result.add(category);
    }
    return result.sublist(0, limit < result.length ? limit : result.length);
  }

  @override
  Future<Either<Failure, Unit>> saveCategory(CategoryEntity category) async {
    final categoryModel = category.mapToModel();
    final failureOrSuccess =
        await _categoryManagerApi.saveCategory(categoryModel);
    return failureOrSuccess.fold(
      (failure) => Left(failure),
      (category) async {
        await _keepStreamFresh();
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteCategory(int id) async {
    await _keepStreamFresh();
    final categories = [..._categoriesListController.value];
    final indexCategory =
        categories.indexWhere((category) => category.id == id);

    /// If the [category] has an empty catchwords just delete it
    if (categories[indexCategory].catchwords.isEmpty) {
      final failureOrSuccess = await _categoryManagerApi.deleteCategory(id);
      return failureOrSuccess.fold(
        (failure) => Left(failure),
        (_) async {
          await _keepStreamFresh();
          return const Right(unit);
        },
      );
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
          await addCatchword(catchword, categories[indexUncateorizedCategory]);
        }
      } else {
        // if not exist create it
        const unCategorized = CategoryEntity();
        await saveCategory(unCategorized);
        //. Assuming 'catchwords' is a list of catchword and 'categories' is a list of categories
        /// 'indexUncategorizedCategoryAfterAdded' is the index of the uncategorized category to which we are adding catchwords
        final categoriesNew = [..._categoriesListController.value];
        final indexUncateorizedCategoryAfterAdded = categoriesNew.indexWhere(
          (category) => category.categoryName.toLowerCase() == 'uncategorized',
        );
        for (final catchword in catchwords) {
          /// Adds a catchword to the specified category. Assumes categories index is valid.
          await addCatchword(
            catchword,
            categoriesNew[indexUncateorizedCategoryAfterAdded],
          );
        }
      }
      final failureOrSuccess = await _categoryManagerApi.deleteCategory(id);
      return failureOrSuccess.fold(
        (failure) => Left(failure),
        (_) async {
          await _keepStreamFresh();
          return const Right(unit);
        },
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> addWhenUsedDateTime(int catchwordId) async {
    return await _categoryManagerApi.addCurrentDateTimeWhenUsed(catchwordId);
  }
}
