import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:formz/formz.dart';
import 'package:logger/logger.dart';

part 'user_update_info_state.dart';

class UserUpdateInfoCubit extends Cubit<UserUpdateInfoState> {
  UserUpdateInfoCubit({required this.userManagementUsecase})
      : super(const UserUpdateInfoState());

  final UserManagementUsecase userManagementUsecase;

  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(
      state.copyWith(username: username, isValid: Formz.validate([username])),
    );
  }

  void newPasswordChanged(String value) {
    final newPassword = Password.dirty(value);

    emit(
      state.copyWith(
        newPassword: newPassword,
        isValid: Formz.validate([newPassword]),
      ),
    );
  }

  void secretChanged(String value) {
    final secret = Secret.dirty(value);

    emit(state.copyWith(secret: secret, isValid: Formz.validate([secret])));
  }

  Future<void> currentPasswordChecked(String masterPassword) async {
    final status =
        await userManagementUsecase.checkCurrentPassword(masterPassword);

    emit(state.copyWith(checkCurrentPassword: status));
    Logger().f(status);
  }

  Future<void> updateUserInfoSubmitted() async {
    final status = state.checkCurrentPassword;

    if (status) {
      if (!state.isValid) return;
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await userManagementUsecase.updateInfo(
          state.username.value,
          state.newPassword.value,
          state.secret.value,
        );
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          isValid: false,
        ));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    } else {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: "Change user info failed",
        ),
      );
    }
  }
}
