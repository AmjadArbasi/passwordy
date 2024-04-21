part of 'password_visibilty_bloc.dart';

sealed class PasswordVisibiltyEvent extends Equatable {
  const PasswordVisibiltyEvent();

  @override
  List<Object> get props => [];
}

final class PasswordVisibitlyToggled extends PasswordVisibiltyEvent {
  const PasswordVisibitlyToggled();

  @override
  List<Object> get props => [];
}
