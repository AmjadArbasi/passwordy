part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

final class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.userLocalEntity = UserLocalEntity.empty,
  });

  final AuthStatus status;
  final UserLocalEntity userLocalEntity;

  @override
  List<Object> get props => [status, userLocalEntity];

  AuthState copyWith({
    AuthStatus? status,
    UserLocalEntity? userLocalEntity,
  }) {
    return AuthState(
      status: status ?? this.status,
      userLocalEntity: userLocalEntity ?? this.userLocalEntity,
    );
  }
}
