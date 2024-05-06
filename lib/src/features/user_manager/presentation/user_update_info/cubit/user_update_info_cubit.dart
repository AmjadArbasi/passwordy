import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:formz/formz.dart';

part 'user_update_info_state.dart';

class UserUpdateInfoCubit extends Cubit<UserUpdateInfoState> {
  UserUpdateInfoCubit({required this.userManagementUsecase})
      : super(const UserUpdateInfoState());

  final UserManagementUsecase userManagementUsecase;

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
    emit(state.copyWith(securityQuestion: value));
  }

  void secretChanged(String value) {
    final secret = Secret.dirty(value);

    emit(state.copyWith(secret: secret, isValid: Formz.validate([secret])));
  }

  Future<void> currentPasswordChecked(String masterPassword) async {
    final failureOrSuccess =
        await userManagementUsecase.checkCurrentPassword(masterPassword);

    failureOrSuccess.fold((failure) {
      emit(state.copyWith(checkCurrentPassword: false));
    }, (_) {
      emit(state.copyWith(checkCurrentPassword: true));
    });
  }

  Future<void> updateUserInfoSubmitted() async {
    if (state.isValid && state.checkCurrentPassword) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      final userLocalEntiry = UserLocalEntity(
        displayName: state.displayName.value,
        masterPassword: state.newPassword.value,
        securityQuestion: state.securityQuestion,
        secret: state.secret.value,
      );

      final failureOrUser =
          await userManagementUsecase.updateInfo(userLocalEntiry);

      failureOrUser.fold(
        (failure) {
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              errorMessage: failure.message,
            ),
          );
        },
        (userLocalEntity) {
          emit(state.copyWith(
            status: FormzSubmissionStatus.success,
            isValid: false,
          ));
        },
      );
    } else {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: "Password incorrect",
        ),
      );
    }
  }
}
