part of 'create_uesr_cubit.dart';

final class CreateUserState extends Equatable {
  const CreateUserState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.secret = const Secret.pure(),
    this.securityQuestion = "",
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage = "",
  });

  final Username username;
  final Password password;
  final ConfirmPassword confirmPassword;
  final Secret secret;
  final String? securityQuestion;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String errorMessage;

  @override
  List<Object?> get props => [
        username,
        password,
        confirmPassword,
        secret,
        securityQuestion,
        status,
        isValid,
        errorMessage
      ];

  CreateUserState copyWith({
    Username? username,
    Password? password,
    ConfirmPassword? confirmPassword,
    Secret? secret,
    String? Function()? securityQuestion,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return CreateUserState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      secret: secret ?? this.secret,
      securityQuestion:
          securityQuestion != null ? securityQuestion() : this.securityQuestion,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
