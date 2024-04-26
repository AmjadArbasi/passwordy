part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable {
  const SignUpState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.secret = const Secret.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final Username username;
  final Password password;
  final ConfirmPassword confirmPassword;
  final Secret secret;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        username,
        password,
        confirmPassword,
        secret,
        status,
        isValid,
        errorMessage
      ];

  SignUpState copyWith({
    Username? username,
    Password? password,
    ConfirmPassword? confirmPassword,
    Secret? secret,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return SignUpState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      secret: secret ?? this.secret,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
