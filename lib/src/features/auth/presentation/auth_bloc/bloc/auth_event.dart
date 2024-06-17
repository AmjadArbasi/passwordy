part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthUserLogoutRequested extends AuthEvent {
  const AuthUserLogoutRequested();
}

final class AuthCheckingStatusRequested extends AuthEvent {
  const AuthCheckingStatusRequested();
}

final class AuthUserStatusChanged extends AuthEvent {
  final UserLocalEntity userLocalEntity;

  const AuthUserStatusChanged({required this.userLocalEntity});

  @override
  List<Object> get props => [userLocalEntity];
}
