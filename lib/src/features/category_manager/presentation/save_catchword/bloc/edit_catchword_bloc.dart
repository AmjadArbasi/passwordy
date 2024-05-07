import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

part 'edit_catchword_event.dart';
part 'edit_catchword_state.dart';

class EditCatchwordBloc extends Bloc<EditCatchwordEvent, EditCatchwordState> {
  EditCatchwordBloc({
    required CategoryManagerUsecase categoryManagerUsecase,
    required CatchwordEntity? catchword,
    required CategoryEntity category,
  })  : _categoryManagerUsecase = categoryManagerUsecase,
        super(
          EditCatchwordState(
            name: catchword?.name ?? '',
            accountId: catchword?.accountId ?? '',
            passcode: catchword?.passcode ?? '',
            initCatchword: catchword,
            category: category,
          ),
        ) {
    on<EditCatchwordNameChanged>(_onNameChanged);
    on<EditCatchwordAccountIdChanged>(_onAccountIdChanged);
    on<EditCatchwordPasscodeChanged>(_onPasscodeChanged);
    on<EditCatchwordNoteChanged>(_onNoteChanged);
    on<EditCatchwordValueCopied>(_onValueCopied);
    on<EditCatchwordCategoryChanged>(_onCategoryChanged);
    on<EditCatchwordSubmitted>(_onSubmitted);
  }

  final CategoryManagerUsecase _categoryManagerUsecase;

  Future<void> _onNameChanged(
    EditCatchwordNameChanged event,
    Emitter<EditCatchwordState> emit,
  ) async {
    emit(state.copyWith(name: event.name));
  }

  Future<void> _onAccountIdChanged(
    EditCatchwordAccountIdChanged event,
    Emitter<EditCatchwordState> emit,
  ) async {
    emit(state.copyWith(accountId: event.accountId));
  }

  Future<void> _onPasscodeChanged(
    EditCatchwordPasscodeChanged event,
    Emitter<EditCatchwordState> emit,
  ) async {
    emit(state.copyWith(passcode: event.passcode));
  }

  Future<void> _onNoteChanged(
    EditCatchwordNoteChanged event,
    Emitter<EditCatchwordState> emit,
  ) async {
    emit(state.copyWith(note: event.note));
  }

  Future<void> _onValueCopied(
      EditCatchwordValueCopied event, Emitter<EditCatchwordState> emit) async {
    emit(state.copyWith(valueCopied: event.valueCopied));
  }

  Future<void> _onCategoryChanged(EditCatchwordCategoryChanged event,
      Emitter<EditCatchwordState> emit) async {
    emit(state.copyWith(category: event.category));
  }

  Future<void> _onSubmitted(
    EditCatchwordSubmitted event,
    Emitter<EditCatchwordState> emit,
  ) async {
    emit(state.copyWith(status: EditCatchwordStatus.loading));
    final newCatchword = (state.initCatchword ??
            CatchwordEntity(
              name: '',
              accountId: '',
              passcode: '',
              note: '',
            ))
        .copyWith(
      name: state.name,
      accountId: state.accountId,
      passcode: state.passcode,
      note: state.note,
    );
    try {
      if (newCatchword.id == null) {
        _categoryManagerUsecase.addCatchword(newCatchword, state.category);
      } else {
        _categoryManagerUsecase.editCatchword(newCatchword, state.category);
      }
      emit(state.copyWith(status: EditCatchwordStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EditCatchwordStatus.failure));
    }
  }
}
