import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required LogInUsecase logInUsecase})
      : _logInUsecase = logInUsecase,
        super(const SignInState());

  final LogInUsecase _logInUsecase;

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

    final loginParms = LoginParms(
      username: state.username.value,
      password: state.password.value,
    );

    final failureOrUser = await _logInUsecase.call(loginParms);

    failureOrUser.fold(
      (failure) {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            signInErrorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          password: const Password.pure(),
          isValid: false,
        ));
      },
    );
  }
}
