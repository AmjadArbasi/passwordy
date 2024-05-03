part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

final class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.unknown,
    this.userLocalEntity = UserLocalEntity.empty,
    this.errorMessage = "",
  });

  final AuthStatus status;
  final UserLocalEntity userLocalEntity;
  final String errorMessage;

  @override
  List<Object> get props => [status, userLocalEntity, errorMessage];

  AuthState copyWith({
    AuthStatus? status,
    UserLocalEntity? userLocalEntity,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      userLocalEntity: userLocalEntity ?? this.userLocalEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
