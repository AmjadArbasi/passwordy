import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:logger/logger.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc({required UserManagerUsecase userManagerUsecase})
      : _userInfoUsercase = userManagerUsecase,
        super(const UserInfoState()) {
    on<UserInfoSubscription>(_onInfoSubscription);
    // on<UserInfoInfoUpdated>(_onInfoUpdated);
    // on<UserInfoResetPasswordRequested>(_onResetPasswordRequested);
    // on<UserInfoDeleteUserRequested>(_onDeleteUserRequested);
    // on<UserInfoChangeEmailReqeuted>(_onChangeEmailReqeuted);
  }

  final UserManagerUsecase _userInfoUsercase;

  Future<void> _onInfoSubscription(
    UserInfoSubscription event,
    Emitter<UserInfoState> emit,
  ) async {
    emit(state.copyWith(status: UserInfoStatus.loading));
    try {
      final user = await _userInfoUsercase.getUserInfo();
      emit(state.copyWith(status: UserInfoStatus.success, userEntity: user));
      Logger().f(state);
    } catch (_) {
      emit(state.copyWith(status: UserInfoStatus.failure));
      Logger().f(state);
    }
  }

  // void _onInfoUpdated(
  //   UserInfoInfoUpdated event,
  //   Emitter<UserInfoState> emit,
  // ) {}

  // void _onResetPasswordRequested(
  //   UserInfoResetPasswordRequested event,
  //   Emitter<UserInfoState> emit,
  // ) {}

  // Future<void> _onDeleteUserRequested(
  //   UserInfoDeleteUserRequested event,
  //   Emitter<UserInfoState> emit,
  // ) async {
  //   emit(state.copyWith(status: UserInfoStatus.loading));
  //   try {
  //     await _userInfoUsercase.deleteUser();
  //     emit(state.copyWith(status: UserInfoStatus.success));
  //   } catch (_) {
  //     emit(state.copyWith(status: UserInfoStatus.failure));
  //   }
  // }

  // void _onChangeEmailReqeuted(
  //   UserInfoChangeEmailReqeuted event,
  //   Emitter<UserInfoState> emit,
  // ) {}
}
