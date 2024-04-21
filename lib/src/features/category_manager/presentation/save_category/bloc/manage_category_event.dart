part of 'manage_category_bloc.dart';

///[ManageCategorySubscribed] : subscribe to streams
///[ManageCategoryNameChanged] : updates the name of category
///[ManageCategoryDeleted] : delete category
///[ManageCategorySubmitted] : submit the value

sealed class ManageCategoryEvent extends Equatable {
  const ManageCategoryEvent();

  @override
  List<Object> get props => [];
}

final class ManageCategorySubscribed extends ManageCategoryEvent {
  const ManageCategorySubscribed();
}

final class ManageCategoryNameChanged extends ManageCategoryEvent {
  const ManageCategoryNameChanged(this.categoryName);

  final String categoryName;

  @override
  List<Object> get props => [categoryName];
}

final class ManageCategoryDeleted extends ManageCategoryEvent {
  const ManageCategoryDeleted(this.categoryId);

  final int categoryId;

  @override
  List<Object> get props => [categoryId];
}

final class ManageCategoryEdited extends ManageCategoryEvent {
  const ManageCategoryEdited(this.categoryEdited);

  final CategoryEntity categoryEdited;

  @override
  List<Object> get props => [categoryEdited];
}

final class ManageCategoryEditCleared extends ManageCategoryEvent {}

final class ManageCategorySubmitted extends ManageCategoryEvent {
  const ManageCategorySubmitted();

  @override
  List<Object> get props => [];
}
