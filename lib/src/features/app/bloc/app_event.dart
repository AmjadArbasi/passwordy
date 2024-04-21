part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class AppLogoutRequested extends AppEvent {}

final class AppUserChanged extends AppEvent {
  final UserEntity userEntity;

  const AppUserChanged({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}
