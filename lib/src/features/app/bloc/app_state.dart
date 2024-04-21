part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

final class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.userEntity = UserEntity.empty,
  });

  final AppStatus status;
  final UserEntity userEntity;

  const AppState.authenticated(UserEntity userEntity)
      : this._(
          status: AppStatus.authenticated,
          userEntity: userEntity,
        );
  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  List<Object> get props => [status, userEntity];
}
