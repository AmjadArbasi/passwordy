import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:formz/formz.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required UserManagementUsecase userManagementUsecase})
      : _userManagementUsecase = userManagementUsecase,
        super(const SignInState());

  final UserManagementUsecase _userManagementUsecase;

  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username]),
    ));
  }

  Future<void> signInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _userManagementUsecase.logIn(
          state.password.value, state.username.value);
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        username: const Username.pure(),
        password: const Password.pure(),
        isValid: false,
      ));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}