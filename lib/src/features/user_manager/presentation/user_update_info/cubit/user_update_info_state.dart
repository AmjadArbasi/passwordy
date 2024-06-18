part of 'user_update_info_cubit.dart';

final class UserUpdateInfoState extends Equatable {
  const UserUpdateInfoState({
    this.status = FormzSubmissionStatus.initial,
    this.displayName = const Username.pure(),
    this.currentPassword = const Password.pure(),
    this.securityQuestion,
    this.secret = const Secret.pure(),
    this.newPassword = const Password.pure(),
    this.isValid = false,
    this.errorMessage = "",
  });

  final FormzSubmissionStatus status;
  final Username displayName;
  final Password currentPassword;
  final String? securityQuestion;
  final Secret secret;
  final Password newPassword;
  final bool isValid;
  final String errorMessage;

  @override
  List<Object?> get props => [
        status,
        displayName,
        currentPassword,
        securityQuestion,
        secret,
        newPassword,
        isValid,
        errorMessage,
      ];

  UserUpdateInfoState copyWith({
    FormzSubmissionStatus? status,
    Username? displayName,
    Password? currentPassword,
    String? Function()? securityQuestion,
    Secret? secret,
    Password? newPassword,
    bool? isValid,
    String? errorMessage,
  }) {
    return UserUpdateInfoState(
      status: status ?? this.status,
      displayName: displayName ?? this.displayName,
      currentPassword: currentPassword ?? this.currentPassword,
      securityQuestion:
          securityQuestion != null ? securityQuestion() : this.securityQuestion,
      secret: secret ?? this.secret,
      newPassword: newPassword ?? this.newPassword,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
