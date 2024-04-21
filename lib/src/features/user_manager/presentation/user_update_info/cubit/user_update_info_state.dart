part of 'user_update_info_cubit.dart';

final class UserUpdateInfoState extends Equatable {
  const UserUpdateInfoState({
    this.name = const Name.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final Name name;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object?> get props => [name, status, isValid, errorMessage];

  UserUpdateInfoState copyWith({
    Name? name,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return UserUpdateInfoState(
      name: name ?? this.name,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

final class UserUpdateInfoInitial extends UserUpdateInfoState {}
