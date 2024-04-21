part of 'user_info_bloc.dart';

enum UserInfoStatus { initial, success, failure, loading }

final class UserInfoState extends Equatable {
  const UserInfoState({
    this.status = UserInfoStatus.initial,
    this.userEntity = const UserFirebaseEntity(
      id: 'id',
      name: 'username',
      email: 'example@domain.com',
      emailVerified: false,
    ),
  });

  final UserInfoStatus status;
  final UserFirebaseEntity userEntity;

  @override
  List<Object> get props => [status, userEntity];

  UserInfoState copyWith({
    UserInfoStatus? status,
    UserFirebaseEntity? userEntity,
  }) {
    return UserInfoState(
      status: status ?? this.status,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
