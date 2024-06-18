part of 'show_user_info_cubit.dart';

final class ShowUserInfoState extends Equatable {
  const ShowUserInfoState({
    this.user = UserLocalEntity.empty,
  });

  final UserLocalEntity user;

  @override
  List<Object> get props => [user];

  ShowUserInfoState copyWith({
    UserLocalEntity? user,
  }) {
    return ShowUserInfoState(
      user: user ?? this.user,
    );
  }
}
