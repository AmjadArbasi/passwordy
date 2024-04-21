import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationUsecases authenticationUsecases})
      : _authenticationUsecases = authenticationUsecases,
        super(
          authenticationUsecases.currentUser.isNotEmpty
              ? AppState._(
                  status: AppStatus.authenticated,
                  userEntity: authenticationUsecases.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppLogoutRequested>(_onLogoutRequest);
    on<AppUserChanged>(_onUserChanged);
    _userSubscription = _authenticationUsecases.user.listen(
      (user) => add(
        AppUserChanged(userEntity: user),
      ),
    );
  }
  final AuthenticationUsecases _authenticationUsecases;
  late final StreamSubscription<UserEntity> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.userEntity.isNotEmpty
          ? AppState.authenticated(event.userEntity)
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequest(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationUsecases.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
