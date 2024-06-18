import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:formz/formz.dart';

part 'user_update_info_state.dart';

class UserUpdateInfoCubit extends Cubit<UserUpdateInfoState> {
  UserUpdateInfoCubit({
    required this.categoryManagerUsecase,
    required UpdateUserinfoUsecase updateUserinfoUsecase,
    required GetStreamUsecase streamUsecase,
  })  : _updateUserinfoUsecase = updateUserinfoUsecase,
        _streamUsecase = streamUsecase,
        super(const UserUpdateInfoState());

  final UpdateUserinfoUsecase _updateUserinfoUsecase;
  final CategoryManagerUsecase categoryManagerUsecase;
  final GetStreamUsecase _streamUsecase;

  void displayNameChanged(String value) {
    final displayName = Username.dirty(value);

    emit(
      state.copyWith(
          displayName: displayName, isValid: Formz.validate([displayName])),
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

  void changeSecurityQuestion(String value) {
    emit(state.copyWith(securityQuestion: () => value, isValid: true));
  }

  void secretChanged(String value) {
    final secret = Secret.dirty(value);

    emit(state.copyWith(secret: secret, isValid: Formz.validate([secret])));
  }

  void currentPassword(String masterPassword) {
    final currentPassword = Password.dirty(masterPassword);
    emit(state.copyWith(currentPassword: currentPassword));
  }

  Future<void> updateUserInfoSubmitted(String username) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      final params = UpdateUserInfoParams(
        displayName: state.displayName.value,
        newMasterPassword: state.newPassword.value,
        newSecurityQuestion: state.securityQuestion,
        newSecret: state.secret.value,
        masterPassword: state.currentPassword.value,
      );

      final failureOrUser = await _updateUserinfoUsecase.call(params);

      failureOrUser.fold(
        (failure) => emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            errorMessage: failure.message,
          ),
        ),
        (user) async {
          emit(state.copyWith(
            status: FormzSubmissionStatus.success,
            isValid: false,
            displayName: const Username.pure(),
            newPassword: const Password.pure(),
            secret: const Secret.pure(),
            securityQuestion: null,
          ));
          if (state.newPassword.value.isNotEmpty) {
            final changeEncryptionKey =
                await categoryManagerUsecase.changeEncryptionKey(username);
            changeEncryptionKey.fold(
              (failure) => emit(state.copyWith(errorMessage: failure.message)),
              (_) => null,
            );
          }
          _streamUsecase.streamController.sink.add(user);
        },
      );
    }
  }
}
