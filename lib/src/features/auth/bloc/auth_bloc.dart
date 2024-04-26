import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:logger/logger.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.userManagementUsecase,
  }) : super(const AuthState()) {
    on<AuthUserLogoutRequested>(_onUserLogoutRequested);
    on<AuthCheckingStatusRequested>(_onCheckingStatusRequested);
    on<AuthUserStatusChanged>(_onUserStatusChanged);
    _userSubscription = userManagementUsecase.stream.listen(
      (user) => add(AuthUserStatusChanged(userLocalEntity: user)),
    );
  }

  final UserManagementUsecase userManagementUsecase;
  late final StreamSubscription<UserLocalEntity> _userSubscription;

  Future<void> _onUserStatusChanged(
    AuthUserStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    Logger().f(event.userLocalEntity);
    emit(
      event.userLocalEntity.isNotEmpty
          ? state.copyWith(
              status: AuthStatus.authenticated,
              userLocalEntity: event.userLocalEntity,
            )
          : state.copyWith(status: AuthStatus.unauthenticated),
    );
  }

  Future<void> _onUserLogoutRequested(
    AuthUserLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await userManagementUsecase.logOut();
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  Future<void> _onCheckingStatusRequested(
    AuthCheckingStatusRequested event,
    Emitter<AuthState> emit,
  ) async {
    final user = await userManagementUsecase.reAuthLoggedUser();
    Logger().f(user);
    if (user.isNotEmpty) {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        userLocalEntity: user,
      ));
    } else {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  @override
  Future<void> close() {
    Logger().f('closeUserSubscription');
    _userSubscription.cancel();
    return super.close();
  }
}
