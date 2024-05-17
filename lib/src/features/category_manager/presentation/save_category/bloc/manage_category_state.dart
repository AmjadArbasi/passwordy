part of 'manage_category_bloc.dart';

enum ManageCategoryStatus { initial, loading, success, failure, cancel }

final class ManageCategoryState extends Equatable {
  const ManageCategoryState({
    this.categories = const [],
    this.categoryEdit,
    this.categoryName = '',
    this.status = ManageCategoryStatus.initial,
    this.errorMessage = "",
  });

  final List<CategoryEntity> categories;
  final CategoryEntity? categoryEdit;
  final ManageCategoryStatus status;
  final String categoryName;
  final String errorMessage;

  @override
  List<Object?> get props =>
      [categoryEdit, status, categories, categoryName, errorMessage];

  ManageCategoryState copyWith({
    List<CategoryEntity>? categories,
    CategoryEntity? Function()? categoryEdit,
    ManageCategoryStatus? status,
    String? categoryName,
    String? errorMessage,
  }) {
    return ManageCategoryState(
      categories: categories ?? this.categories,
      categoryEdit: categoryEdit != null ? categoryEdit() : this.categoryEdit,
      status: status ?? this.status,
      categoryName: categoryName ?? this.categoryName,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
