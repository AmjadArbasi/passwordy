part of 'reset_master_passcode_cubit.dart';

final class ResetMasterPasscodeState extends Equatable {
  const ResetMasterPasscodeState({
    this.username = const Username.pure(),
    this.newPassword = const Password.pure(),
    this.confirmNewPassword = const ConfirmPassword.pure(),
    this.secret = const Secret.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.secertIsCorrect = false,
    this.errorMessage = "",
  });

  final Username username;
  final Password newPassword;
  final ConfirmPassword confirmNewPassword;
  final Secret secret;
  final FormzSubmissionStatus status;
  final bool isValid;
  final bool secertIsCorrect;
  final String errorMessage;

  @override
  List<Object?> get props => [
        username,
        newPassword,
        confirmNewPassword,
        secret,
        status,
        isValid,
        secertIsCorrect,
        errorMessage
      ];

  ResetMasterPasscodeState copyWith({
    Username? username,
    Password? newPassword,
    ConfirmPassword? confirmNewPassword,
    Secret? secret,
    FormzSubmissionStatus? status,
    bool? isValid,
    bool? secertIsCorrect,
    String? errorMessage,
  }) {
    return ResetMasterPasscodeState(
      username: username ?? this.username,
      newPassword: newPassword ?? this.newPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
      secret: secret ?? this.secret,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      secertIsCorrect: secertIsCorrect ?? this.secertIsCorrect,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
