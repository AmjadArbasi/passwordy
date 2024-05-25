import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

part 'catchword_event.dart';
part 'catchword_state.dart';

class CatchwordBloc extends Bloc<CatchwordEvent, CatchwordState> {
  CatchwordBloc({required CategoryManagerUsecase categoryManagerUsecase})
      : _categoryManagerUsecase = categoryManagerUsecase,
        super(const CatchwordState()) {
    on<CatchwordsSubscriptionRequested>(_onSubscriptionRequested);
    on<CatchwordsDeleteRequested>(_onDeleteRequested);
    on<CatchwrodsUndoDeleteRequested>(_onUndoDeleteRequested);
    on<CatchwordsCopyPressed>(_onCopyPressed);
    on<CatchwordsUpdateCategoriesRequested>(_onUpdateCategoriesRequested);
    on<CatchwordsResultSearchReturned>(_onResultSearchReturned);
    on<CatchwordsPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<CatchwordsRefreshRequested>(_onRefreshRequested);
    on<CatchwordsUsingTrigger>(_onUsingTrigger);
    on<CatchwordsValueCopied>(_onValueCopied);
    on<CatchwordsSortRequested>(_onSortRequest);
  }

  final CategoryManagerUsecase _categoryManagerUsecase;

  Future<void> _onSubscriptionRequested(
    CatchwordsSubscriptionRequested event,
    Emitter<CatchwordState> emit,
  ) async {
    emit(state.copyWith(status: CatchwordStatus.loading));
    await emit.forEach<List<CategoryEntity>>(
      _categoryManagerUsecase.getCategoriesList(),
      onData: (data) => state.copyWith(
        status: CatchwordStatus.success,
        categories: data,
        catchwords: data.expand((e) => e.catchwords).toList(),
        filteredCategories: data,
        recentlyUsedCatchwords: data,
      ),
      onError: (_, __) => state.copyWith(status: CatchwordStatus.failure),
    );
  }

  Future<void> _onDeleteRequested(
    CatchwordsDeleteRequested event,
    Emitter<CatchwordState> emit,
  ) async {
    emit(state.copyWith(
      lastDeletedItem: () => event.catchword,
      categoryLinkedDeletedCatchword: event.category,
    ));
    final failureOrSuccess = await _categoryManagerUsecase.deleteCatchword(
        event.catchword.id!, event.category.id!);

    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          status: CatchwordStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (_) {},
    );
  }

  Future<void> _onUndoDeleteRequested(
    CatchwrodsUndoDeleteRequested event,
    Emitter<CatchwordState> emit,
  ) async {
    final catchword = state.lastDeletedItem!;
    final category = state.categoryLinkedDeletedCatchword!;
    emit(state.copyWith(
      lastDeletedItem: () => null,
      categoryLinkedDeletedCatchword: null,
    ));
    final failureOrSuccess =
        await _categoryManagerUsecase.addCatchword(catchword, category);

    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          status: CatchwordStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (_) {},
    );
  }

  Future<void> _onCopyPressed(
    CatchwordsCopyPressed event,
    Emitter<CatchwordState> emit,
  ) async {
    final copiedPasscode = event.copiedPasscode;

    Clipboard.setData(ClipboardData(text: copiedPasscode));

    emit(state.copyWith(copiedPasscode: copiedPasscode));
  }

  Future<void> _onUpdateCategoriesRequested(
      CatchwordsUpdateCategoriesRequested event,
      Emitter<CatchwordState> emit) async {
    emit(
      state.copyWith(
        filteredCategories: event.filteredCategories,
        currentIndex: event.currentIndex,
        searchedCatchwords: () => null,
      ),
    );
  }

  Future<void> _onResultSearchReturned(CatchwordsResultSearchReturned event,
      Emitter<CatchwordState> emit) async {
    final categories =
        await _categoryManagerUsecase.searchCatchword(event.value);
    if (event.value.isNotEmpty) {
      emit(state.copyWith(searchedCatchwords: () => categories));
    } else {
      emit(state.copyWith(searchedCatchwords: () => null));
    }
  }

  Future<void> _onPasswordVisibilityToggled(
      CatchwordsPasswordVisibilityToggled event,
      Emitter<CatchwordState> emit) async {
    final newCatchword = event.catchwordEntity
        .copyWith(isVisible: !event.catchwordEntity.isVisible);

    final failureOrSuccess = await _categoryManagerUsecase.editCatchword(
      newCatchword,
      event.categoryEntity,
    );

    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          status: CatchwordStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (_) {},
    );
  }

  Future<void> _onRefreshRequested(
    CatchwordsRefreshRequested event,
    Emitter<CatchwordState> emit,
  ) async {
    final result = await _categoryManagerUsecase.refreshData();
    result.fold(
      (failure) => emit(state.copyWith(
          status: CatchwordStatus.failure, errorMessage: failure.message)),
      (r) => null,
    );
  }

  Future<void> _onUsingTrigger(
    CatchwordsUsingTrigger event,
    Emitter<CatchwordState> emit,
  ) async {
    final failureOrSuccess =
        await _categoryManagerUsecase.addWhenUsedDateTime(event.id);

    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.message));
      },
      (_) {},
    );
  }

  Future<void> _onValueCopied(
    CatchwordsValueCopied event,
    Emitter<CatchwordState> emit,
  ) async {
    Clipboard.setData(ClipboardData(text: event.value));
  }

  Future<void> _onSortRequest(
      CatchwordsSortRequested event, Emitter<CatchwordState> emit) async {
    final categories = state.recentlyUsedCatchwords;
    final sortCategories = _categoryManagerUsecase
        .sortCatchwordsCategoriesBasedOnDateTime(categories);

    emit(state.copyWith(recentlyUsedCatchwords: sortCategories));
  }
}
