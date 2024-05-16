part of 'catchword_bloc.dart';

enum CatchwordStatus { initial, loading, success, failure }

final class CatchwordState extends Equatable {
  final List<CatchwordEntity> catchwords;
  final List<CategoryEntity> categories;
  final List<CategoryEntity> filteredCategories;
  final List<CategoryEntity> recentlyUsedCatchwords;
  final List<CategoryEntity>? searchedCatchwords;
  final CatchwordStatus status;
  final CatchwordEntity? lastDeletedItem;
  final CategoryEntity? categoryLinkedDeletedCatchword;
  final String? copiedPasscode;
  final int currentIndex;
  final String errorMessage;

  const CatchwordState({
    this.catchwords = const [],
    this.categories = const [],
    this.filteredCategories = const [],
    this.recentlyUsedCatchwords = const [],
    this.status = CatchwordStatus.initial,
    this.lastDeletedItem,
    this.categoryLinkedDeletedCatchword,
    this.copiedPasscode,
    this.currentIndex = -1,
    this.errorMessage = "",
    this.searchedCatchwords,
  });

  CatchwordState copyWith({
    List<CatchwordEntity>? catchwords,
    List<CategoryEntity>? categories,
    List<CategoryEntity>? filteredCategories,
    List<CategoryEntity>? recentlyUsedCatchwords,
    List<CategoryEntity>? Function()? searchedCatchwords,
    CatchwordStatus? status,
    CatchwordEntity? Function()? lastDeletedItem,
    CategoryEntity? categoryLinkedDeletedCatchword,
    String? copiedPasscode,
    int? currentIndex,
    String? errorMessage,
  }) {
    return CatchwordState(
      catchwords: catchwords ?? this.catchwords,
      categories: categories ?? this.categories,
      filteredCategories: filteredCategories ?? this.filteredCategories,
      searchedCatchwords: searchedCatchwords != null
          ? searchedCatchwords()
          : this.searchedCatchwords,
      recentlyUsedCatchwords:
          recentlyUsedCatchwords ?? this.recentlyUsedCatchwords,
      status: status ?? this.status,
      lastDeletedItem:
          lastDeletedItem != null ? lastDeletedItem() : this.lastDeletedItem,
      categoryLinkedDeletedCatchword:
          categoryLinkedDeletedCatchword ?? this.categoryLinkedDeletedCatchword,
      copiedPasscode: copiedPasscode ?? this.copiedPasscode,
      currentIndex: currentIndex ?? this.currentIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        catchwords,
        categories,
        filteredCategories,
        recentlyUsedCatchwords,
        searchedCatchwords,
        status,
        lastDeletedItem,
        copiedPasscode,
        categoryLinkedDeletedCatchword,
        currentIndex,
        errorMessage,
      ];
}
