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

      final failureOrUser = await userManagementUsecase.updateInfo(
        state.username.value,
        state.newPassword.value,
        state.secret.value,
      );
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
