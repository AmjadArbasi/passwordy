import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/core/constants/constants.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

part 'reset_master_passcode_state.dart';

class ResetMasterPasscodeCubit extends Cubit<ResetMasterPasscodeState> {
  ResetMasterPasscodeCubit({
    required CategoryManagerUsecase categoryManagerUsecase,
    required ResetMasterPasswordUsecase resetMasterPasswordUsecase,
  })  : _categoryManagerUsecase = categoryManagerUsecase,
        _resetMasterPasswordUsecase = resetMasterPasswordUsecase,
        super(const ResetMasterPasscodeState());

  final CategoryManagerUsecase _categoryManagerUsecase;
  final ResetMasterPasswordUsecase _resetMasterPasswordUsecase;

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

  void secretChanged(String value) {
    final secret = Secret.dirty(value);

    emit(state.copyWith(
      secret: secret,
      isValid: Formz.validate([
        state.username,
        state.newPassword,
        state.confirmNewPassword,
        secret
      ]),
    ));
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

    GlobalVar.logger.f(confirmNewPassword.value);
    GlobalVar.logger.f(state.newPassword.value);

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
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final params = ResetMasterPasswordParams(
      newMasterPassword: state.newPassword.value,
      secret: state.secret.value,
      username: state.username.value,
    );

    final result = await _resetMasterPasswordUsecase.call(params);

    result.fold((failure) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: failure.message,
        isValid: false,
      ));
    }, (_) async {
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        isValid: false,
        newPassword: const Password.pure(),
        confirmNewPassword: const ConfirmPassword.pure(),
        secret: const Secret.pure(),
        username: const Username.pure(),
      ));
      final changeEncryptionKey = await _categoryManagerUsecase
          .changeEncryptionKey(state.username.value);
      changeEncryptionKey.fold(
        (failure) => emit(state.copyWith(errorMessage: failure.message)),
        (_) => null,
      );
      Get.offAllNamed(AppRoutes.signIn);
    });
  }
}
