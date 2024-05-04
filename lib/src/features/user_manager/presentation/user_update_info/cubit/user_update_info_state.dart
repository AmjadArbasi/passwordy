part of 'user_update_info_cubit.dart';

final class UserUpdateInfoState extends Equatable {
  const UserUpdateInfoState({
    this.status = FormzSubmissionStatus.initial,
    this.displayName = const Username.pure(),
    this.currentPassword = const Password.pure(),
    this.secret = const Secret.pure(),
    this.newPassword = const Password.pure(),
    this.isValid = false,
    this.checkCurrentPassword = false,
    this.errorMessage = "",
  });

  final FormzSubmissionStatus status;
  final Username displayName;
  final Password currentPassword;
  final Secret secret;
  final Password newPassword;
  final bool isValid;
  final bool checkCurrentPassword;
  final String errorMessage;

  @override
  List<Object?> get props => [
        status,
        displayName,
        currentPassword,
        secret,
        newPassword,
        isValid,
        checkCurrentPassword,
        errorMessage,
      ];

  UserUpdateInfoState copyWith({
    FormzSubmissionStatus? status,
    Username? displayName,
    Password? currentPassword,
    Secret? secret,
    Password? newPassword,
    bool? isValid,
    bool? checkCurrentPassword,
    String? errorMessage,
  }) {
    return UserUpdateInfoState(
      status: status ?? this.status,
      displayName: displayName ?? this.displayName,
      currentPassword: currentPassword ?? this.currentPassword,
      secret: secret ?? this.secret,
      newPassword: newPassword ?? this.newPassword,
      isValid: isValid ?? this.isValid,
      checkCurrentPassword: checkCurrentPassword ?? this.checkCurrentPassword,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
