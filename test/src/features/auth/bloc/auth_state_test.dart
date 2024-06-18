import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:flutter_test/flutter_test.dart';

/// 1. [Test Initialization:]
/// Verify that the default values are set correctly.
/// 2. [Test copyWith Method:]
/// Verify that the copyWith method correctly copies the state and overrides only the specified values.
/// 3. [Test Equality:]
/// Verify that two instances with the same values are considered equal.
///

void main() {
  group('AuthState', () {
    group('Test Initialization', () {
      test('initial state has corect values: ', () {
        const authState = AuthState();

        expect(authState.status, AuthStatus.unknown);
        expect(authState.userLocalEntity, UserLocalEntity.empty);
        expect(authState.errorMessage, "");
        expect(authState.onBoardingCompleted, false);
      });
    });

    group('Test copyWith Method', () {
      test('returns a copy with the corect values: ', () {
        const authState = AuthState();

        /// Test the default values all values
        expect(authState.props, const AuthState().copyWith().props);

        /// Test AuthStatus status only
        final authStateStatus =
            authState.copyWith(status: AuthStatus.authenticated);
        expect(authStateStatus.props,
            [AuthStatus.authenticated, UserLocalEntity.empty, "", false]);

        /// Test UserLocalEntity only
        const userLocalEntity = UserLocalEntity(id: 1, username: "username");
        final authStateEntity =
            authState.copyWith(userLocalEntity: userLocalEntity);

        expect(authStateEntity.props,
            [AuthStatus.unknown, userLocalEntity, "", false]);

        /// Test Error Message only
        final authStateErrorMessage = authState.copyWith(errorMessage: "Opps");
        expect(authStateErrorMessage.props,
            [AuthStatus.unknown, UserLocalEntity.empty, "Opps", false]);

        /// Test AuthStatus status only
        final authStateOnBoardingState =
            authState.copyWith(onBoardingCompleted: true);
        expect(authStateOnBoardingState.props,
            [AuthStatus.unknown, UserLocalEntity.empty, "", true]);
      });
    });

    group('Test Equality:', () {
      test('supports equlity two instances', () {
        const authState1 = AuthState(
          status: AuthStatus.authenticated,
          userLocalEntity: UserLocalEntity(username: "username"),
          errorMessage: "",
          onBoardingCompleted: true,
        );
        const authState2 = AuthState(
          status: AuthStatus.authenticated,
          userLocalEntity: UserLocalEntity(username: "username"),
          errorMessage: "",
          onBoardingCompleted: true,
        );

        expect(authState1, equals(authState2));
      });
    });
  });
}
