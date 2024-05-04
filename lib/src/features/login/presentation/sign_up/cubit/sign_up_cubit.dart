import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/core/constants/constants.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

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
      isValid: Formz.validate(
          [username, state.password, state.confirmPassword, state.secret]),
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
      isValid: Formz.validate(
          [state.username, password, confirmPassword, state.secret]),
    ));
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      isValid: Formz.validate(
          [state.username, state.password, confirmPassword, state.secret]),
    ));
  }

  void secretChanged(String value) {
    final secret = Secret.dirty(value);
    emit(state.copyWith(
      secret: secret,
      isValid: Formz.validate(
          [state.username, state.password, state.confirmPassword, secret]),
    ));
  }

  void securityQuestionChanged(String value) {
    emit(state.copyWith(securityQuestion: value));
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final user = UserLocalEntity(
      username: state.username.value,
      masterPassword: state.password.value,
      secret: state.secret.value,
      securityQuestion: state.securityQuestion,
      createdAt: DateTime.now(),
    );
    final failureOrSuccess = await _userManagementUsecase.signUp(user);
    failureOrSuccess.fold((failure) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: failure.message,
      ));
    }, (r) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        isValid: false,
      ));
      Get.offAllNamed(AppRoutes.signIn);
    });
  }
}
