import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:formz/formz.dart';
import 'package:logger/logger.dart';

part 'user_update_info_state.dart';

class UserUpdateInfoCubit extends Cubit<UserUpdateInfoState> {
  UserUpdateInfoCubit({required UserManagerUsecase userManagerUsecase})
      : _userManagerUsecase = userManagerUsecase,
        super(const UserUpdateInfoState());

  final UserManagerUsecase _userManagerUsecase;

  void nameChanged(String newName) {
    final name = Name.dirty(newName);
    emit(state.copyWith(name: name, isValid: Formz.validate([name])));
  }

  Future<void> submitted() async {
    Logger().f('here');
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _userManagerUsecase.updateUserInfo(state.name.value);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          name: const Name.pure(),
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
