import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

part 'manage_category_event.dart';
part 'manage_category_state.dart';

class ManageCategoryBloc
    extends Bloc<ManageCategoryEvent, ManageCategoryState> {
  ManageCategoryBloc({required CategoryManagerUsecase categoryManagerUsecase})
      : _categoryManagerUsecase = categoryManagerUsecase,
        super(const ManageCategoryState()) {
    on<ManageCategorySubscribed>(_onSubscripted);
    on<ManageCategoryNameChanged>(_onNameChanged);
    on<ManageCategoryDeleted>(_onDeleted);
    on<ManageCategoryEdited>(_onEdited);
    on<ManageCategoryEditCleared>(_onEditCleared);
    on<ManageCategorySubmitted>(_onSubmitted);
  }

  final CategoryManagerUsecase _categoryManagerUsecase;

  Future<void> _onSubscripted(
    ManageCategorySubscribed event,
    Emitter<ManageCategoryState> emit,
  ) async {
    emit(state.copyWith(status: ManageCategoryStatus.loading));
    await _categoryManagerUsecase.loadAllCategories();
    await emit.forEach<List<CategoryEntity>>(
      _categoryManagerUsecase.getCategoriesList(),
      onData: (data) => state.copyWith(
        status: ManageCategoryStatus.success,
        categories: data,
      ),
      onError: (_, __) => state.copyWith(status: ManageCategoryStatus.failure),
    );
  }

  Future<void> _onNameChanged(ManageCategoryNameChanged event,
      Emitter<ManageCategoryState> emit) async {
    emit(
      state.copyWith(categoryName: event.categoryName),
    );
  }

  Future<void> _onDeleted(
      ManageCategoryDeleted event, Emitter<ManageCategoryState> emit) async {
    emit(state.copyWith(status: ManageCategoryStatus.loading));

    final failureOrSuccess =
        await _categoryManagerUsecase.deleteCategory(event.categoryId);

    return failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          status: ManageCategoryStatus.cancel,
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(status: ManageCategoryStatus.success));
      },
    );
  }

  Future<void> _onEdited(
      ManageCategoryEdited event, Emitter<ManageCategoryState> emit) async {
    emit(state.copyWith(categoryEdit: () => event.categoryEdited));
  }

  Future<void> _onEditCleared(ManageCategoryEditCleared event,
      Emitter<ManageCategoryState> emit) async {
    emit(state.copyWith(categoryEdit: () => null));
  }

  Future<void> _onSubmitted(
    ManageCategorySubmitted event,
    Emitter<ManageCategoryState> emit,
  ) async {
    emit(state.copyWith(status: ManageCategoryStatus.loading));
    final category = (state.categoryEdit ?? const CategoryEntity())
        .copyWith(categoryName: state.categoryName);
    final failureOrSuccess =
        await _categoryManagerUsecase.saveCategory(category);

    return failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          status: ManageCategoryStatus.cancel,
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(status: ManageCategoryStatus.success));
      },
    );
  }
}
