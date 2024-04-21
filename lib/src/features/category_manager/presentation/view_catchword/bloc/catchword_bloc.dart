import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    await _categoryManagerUsecase.deleteCatchword(
        event.catchword.id!, event.category.id!);
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
    await _categoryManagerUsecase.addCatchword(catchword, category);
  }

  Future<void> _onCopyPressed(
    CatchwordsCopyPressed event,
    Emitter<CatchwordState> emit,
  ) async {
    final copiedPasscode = event.copiedPasscode;
    emit(state.copyWith(
      copiedPasscode: copiedPasscode,
    ));
  }

  Future<void> _onUpdateCategoriesRequested(
      CatchwordsUpdateCategoriesRequested event,
      Emitter<CatchwordState> emit) async {
    emit(
      state.copyWith(
        filteredCategories: event.filteredCategories,
        currentIndex: event.currentIndex,
      ),
    );
  }

  Future<void> _onResultSearchReturned(CatchwordsResultSearchReturned event,
      Emitter<CatchwordState> emit) async {
    final categories =
        await _categoryManagerUsecase.searchCatchword(event.value);
    emit(
      state.copyWith(filteredCategories: categories),
    );
  }

  Future<void> _onPasswordVisibilityToggled(
      CatchwordsPasswordVisibilityToggled event,
      Emitter<CatchwordState> emit) async {
    final newCatchword = event.catchwordEntity
        .copyWith(isVisible: !event.catchwordEntity.isVisible);
    logger.f(newCatchword);
    await _categoryManagerUsecase.editCatchword(
        newCatchword, event.categoryEntity);
  }
}
