part of 'user_request_deletion_cubit.dart';

enum UserRequestDeletionStatus { initial, failure, success, loading }

final class UserRequestDeletionState extends Equatable {
  const UserRequestDeletionState({
    this.errorMessage = "",
    this.status = UserRequestDeletionStatus.initial,
  });

  final String errorMessage;
  final UserRequestDeletionStatus status;

  @override
  List<Object> get props => [errorMessage, status];

  UserRequestDeletionState copyWith({
    String? errorMessage,
    UserRequestDeletionStatus? status,
  }) {
    return UserRequestDeletionState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
