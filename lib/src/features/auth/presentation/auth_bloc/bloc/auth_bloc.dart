import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/auth/domain/domain.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// This code snippet is defining an `AuthBloc` class
  /// in Dart that extends `Bloc<AuthEvent,
  /// AuthState>`. Let's break down what the code is
  /// doing:

  AuthBloc({
    required this.categoryManagerUsecase,
    required LogOutUsecase logOutUsecase,
    required GetStreamUsecase streamUsecase,
    required DisposeUsecase disposeUsecase,
    required CheckSessionUsecase checkSessionUsecase,
    required CheckOnboardingUsecase checkOnboardingUsecase,
  })  : _logOutUsecase = logOutUsecase,
        _streamUsecase = streamUsecase,
        _disposeUsecase = disposeUsecase,
        _checkSessionUsecase = checkSessionUsecase,
        _checkOnboardingUsecase = checkOnboardingUsecase,
        super(const AuthState()) {
    on<AuthUserLogoutRequested>(_onUserLogoutRequested);
    on<AuthCheckingStatusRequested>(_onCheckingStatusRequested);
    on<AuthUserStatusChanged>(_onUserStatusChanged);
    _streamUsecase.streamController.listen(
      (user) => add(AuthUserStatusChanged(userLocalEntity: user)),
    );
  }

  final CategoryManagerUsecase categoryManagerUsecase;
  final LogOutUsecase _logOutUsecase;
  final GetStreamUsecase _streamUsecase;
  final DisposeUsecase _disposeUsecase;
  final CheckSessionUsecase _checkSessionUsecase;
  final CheckOnboardingUsecase _checkOnboardingUsecase;

  // late final StreamSubscription<UserLocalEntity> _userSubscription;

  /// The function `_onUserStatusChanged` updates the authentication state based on the user status change
  /// event.
  ///
  /// Args:
  ///   event (AuthUserStatusChanged): The `event` parameter is of type `AuthUserStatusChanged`, which is
  /// an event that represents a change in the user's authentication status.
  ///   emit (Emitter<AuthState>): The `emit` parameter in the `_onUserStatusChanged` function is an
  /// `Emitter` object that is used to emit new states in the state management system. In this context, it
  /// is used to emit a new `AuthState` based on the changes in the user status.
  Future<void> _onUserStatusChanged(
    AuthUserStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    // await categoryManagerUsecase.refreshData();
    emit(
      event.userLocalEntity.isNotEmpty
          ? state.copyWith(
              status: AuthStatus.authenticated,
              userLocalEntity: event.userLocalEntity,
            )
          : state.copyWith(status: AuthStatus.unauthenticated),
    );
  }

  /// This function logs out the user and updates the authentication state to unauthenticated.
  ///
  /// Args:
  ///   event (AuthUserLogoutRequested): The `event` parameter is of type `AuthUserLogoutRequested` and
  /// represents an event that triggers the user logout process.
  ///   emit (Emitter<AuthState>): The `emit` parameter in the `_onUserLogoutRequested` function is an
  /// `Emitter` object that is used to emit a new state in the state management system. In this case, it
  /// is used to emit a new `AuthState` with the status set to `AuthStatus.unauthenticated`
  Future<void> _onUserLogoutRequested(
    AuthUserLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _logOutUsecase.call(NoParams());
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  /// This function checks the status of the user authentication and updates the state accordingly.
  ///
  /// Args:
  ///   event (AuthCheckingStatusRequested): AuthCheckingStatusRequested event is an event that triggers
  /// the checking of the authentication status.
  ///   emit (Emitter<AuthState>): The `emit` parameter in the `_onCheckingStatusRequested` function is an
  /// `Emitter<AuthState>` type. It is used to emit a new state after processing the authentication status
  /// check. In this case, the function emits a new state with updated authentication status and user
  /// information based on the result

  Future<void> _onCheckingStatusRequested(
    AuthCheckingStatusRequested event,
    Emitter<AuthState> emit,
  ) async {
    final failureOrUser = await _checkSessionUsecase.call(NoParams());
    final onboardingCompletion = _checkOnboardingUsecase.call(NoParams());

    AuthStatus? onBoarding;

    if (!onboardingCompletion) {
      onBoarding = AuthStatus.onboarding;
    }

    failureOrUser.fold(
      (failure) {
        emit(state.copyWith(
          errorMessage: failure.message,
          status: onBoarding ?? AuthStatus.unauthenticated,
        ));
      },
      (userLocalEntity) {
        emit(state.copyWith(
          status: onBoarding ?? AuthStatus.authenticated,
          userLocalEntity: userLocalEntity,
        ));
      },
    );
  }

  /// The `close` function logs a message, cancels a subscription, and then calls the superclass `close`
  /// method.
  ///
  /// Returns:
  ///   The `close()` method is returning a `Future<void>`.
  @override
  Future<void> close() {
    // _userSubscription.cancel();
    _disposeUsecase.call(NoParams());
    return super.close();
  }
}
