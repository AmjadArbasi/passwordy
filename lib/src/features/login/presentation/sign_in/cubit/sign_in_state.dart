part of 'sign_in_cubit.dart';

final class SignInState extends Equatable {
  const SignInState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
    this.signInErrorMessage,
  });

  final Username username;
  final Password password;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
  final String? signInErrorMessage;

  @override
  List<Object?> get props =>
      [username, password, status, isValid, errorMessage, signInErrorMessage];

  SignInState copyWith({
    Username? username,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
    String? signInErrorMessage,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      signInErrorMessage: signInErrorMessage ?? this.signInErrorMessage,
    );
  }
}
