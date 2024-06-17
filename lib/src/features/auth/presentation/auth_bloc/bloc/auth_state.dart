part of 'auth_bloc.dart';

final class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.unknown,
    this.userLocalEntity = UserLocalEntity.empty,
    this.errorMessage = "",
    this.onBoardingCompleted = false,
  });

  final AuthStatus status;
  final UserLocalEntity userLocalEntity;
  final bool onBoardingCompleted;
  final String errorMessage;

  @override
  List<Object> get props =>
      [status, userLocalEntity, errorMessage, onBoardingCompleted];

  AuthState copyWith({
    AuthStatus? status,
    UserLocalEntity? userLocalEntity,
    String? errorMessage,
    bool? onBoardingCompleted,
  }) {
    return AuthState(
      status: status ?? this.status,
      userLocalEntity: userLocalEntity ?? this.userLocalEntity,
      errorMessage: errorMessage ?? this.errorMessage,
      onBoardingCompleted: onBoardingCompleted ?? this.onBoardingCompleted,
    );
  }
}
