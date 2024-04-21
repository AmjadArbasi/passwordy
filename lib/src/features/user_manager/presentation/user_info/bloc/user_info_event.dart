/// [UserInfoInfoSubscription] : retrieves the user info
/// [UserInfoInfoUpdated] : changes display name and photo url
/// [UserInfoResetPasswordRequested] : requests change password
/// [UserInfoDeleteUserRequested] : requests delete the signed in user
/// [UserInfoChangeEmailReqeuted] : requests change an email

part of 'user_info_bloc.dart';

sealed class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object> get props => [];
}

final class UserInfoSubscription extends UserInfoEvent {
  const UserInfoSubscription();

  @override
  List<Object> get props => [];
}
