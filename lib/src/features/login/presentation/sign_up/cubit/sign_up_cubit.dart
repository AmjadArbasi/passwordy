import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:formz/formz.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required UserManagementUsecase userManagementUsecase})
      : _userManagementUsecase = userManagementUsecase,
        super(const SignUpState());

  final UserManagementUsecase _userManagementUsecase;

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
      username: username,
      isValid:
          Formz.validate([username, state.password, state.confirmPassword]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmPassword = ConfirmPassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(
      password: password,
      confirmPassword: confirmPassword,
      isValid: Formz.validate([state.username, password, confirmPassword]),
    ));
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      isValid:
          Formz.validate([state.username, state.password, confirmPassword]),
    ));
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final user = UserLocalEntity(
        name: state.username.value,
        masterPassword: state.password.value,
        createdAt: DateTime.now(),
      );
      await _userManagementUsecase.signUp(user);
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        username: const Username.pure(),
        password: const Password.pure(),
        confirmPassword: const ConfirmPassword.pure(),
        isValid: false,
      ));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
