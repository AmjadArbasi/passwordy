import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:formz/formz.dart';

part 'reset_master_passcode_state.dart';

class ResetMasterPasscodeCubit extends Cubit<ResetMasterPasscodeState> {
  ResetMasterPasscodeCubit(
      {required UserManagementUsecase userManagementUsecase})
      : _userManagementUsecase = userManagementUsecase,
        super(const ResetMasterPasscodeState());

  final UserManagementUsecase _userManagementUsecase;

  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([
          username,
          state.newPassword,
          state.confirmNewPassword,
          state.secret
        ]),
      ),
    );
  }

  Future<void> secretChecked(String value) async {
    final username = state.username.value;
    final secret = Secret.dirty(value);
    final result =
        await _userManagementUsecase.checkSecret(username, secret.value);

    result.fold((failure) {
      emit(
        state.copyWith(secertIsCorrect: false, errorMessage: failure.message),
      );
    }, (_) {
      emit(state.copyWith(secertIsCorrect: true, secret: secret));
    });
  }

  void newPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    final confirmNewPassword = ConfirmPassword.dirty(
      password: newPassword.value,
      value: state.confirmNewPassword.value,
    );

    emit(
      state.copyWith(
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
        isValid: Formz.validate([
          state.username,
          newPassword,
          confirmNewPassword,
          state.secret,
        ]),
      ),
    );
  }

  void confirmNewPasswordhanged(String value) {
    final confirmNewPassword = ConfirmPassword.dirty(
      password: state.newPassword.value,
      value: value,
    );

    emit(
      state.copyWith(
        confirmNewPassword: confirmNewPassword,
        isValid: Formz.validate([
          state.username,
          state.newPassword,
          confirmNewPassword,
          state.secret
        ]),
      ),
    );
  }

  Future<void> resetMasterPasscodeSubmitted() async {
    if (!state.isValid || !state.secertIsCorrect) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final result = await _userManagementUsecase.updatePassword(
      state.username.value,
      state.secret.value,
      state.newPassword.value,
    );
    result.fold((failure) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: failure.message,
      ));
    }, (_) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        isValid: false,
      ));
    });
  }
}
