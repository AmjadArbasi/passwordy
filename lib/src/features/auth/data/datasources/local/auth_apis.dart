import 'dart:async';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/auth/data/datasources/local/i_auth_apis.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApis implements IAuthApis {
  AuthApis({
    required Isar isar,
    required SecureStorage secureStorage,
    required SharedPreferences sharedPreferences,
    PasswordyHash? passwordyHash,
  })  : _isar = isar,
        _secureStorage = secureStorage,
        _sharedPreferences = sharedPreferences,
        _passwordyHash = passwordyHash ?? PasswordyHash();

  final Isar _isar;
  final SecureStorage _secureStorage;
  final PasswordyHash _passwordyHash;
  final SharedPreferences _sharedPreferences;

  static const _keySession = GlobalVar.keySession;

  @override
  Future<UserLocalModel> logIn(String username, String password) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null) {
      final hashedPassword = _passwordyHash.hash(password);

      if (hashedPassword == user.masterPassword) {
        user.lastSuccessfulSignIn = DateTime.now();

        try {
          await _isar.writeTxn(() async {
            await _isar.userLocalDtos.put(user);
          });

          final lastSuccessfulSignIn =
              TimeFormatter.dateFormatter(user.lastSuccessfulSignIn);

          final lastUnsuccessfulSignIn =
              TimeFormatter.dateFormatter(user.lastUnuccessfulSignIn);

          final userLocalModel = UserLocalModel(
            id: user.id,
            username: user.username,
            displayName: user.displayName,
            securityQuestion: user.securityQuestion,
            lastSuccessfulSignIn: lastSuccessfulSignIn,
            lastUnsuccessfulSignIn: lastUnsuccessfulSignIn,
            createdAt: user.createdAt,
            onboardingCompleted: user.onboardingCompleted,
          );

          final session = user.username!;

          await _secureStorage.storeToken(_keySession, session);

          return userLocalModel;
        } catch (e) {
          throw (DatabaseException("operation-not-allowed"));
        }
      } else {
        user.lastUnuccessfulSignIn = DateTime.now();
        await _isar.writeTxn(() async {
          await _isar.userLocalDtos.put(user);
        });

        throw (DatabaseException("wrong-password"));
      }
    } else {
      throw (DatabaseException("user-not-found"));
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _secureStorage.deleteToken(_keySession);
    } catch (_) {
      throw DatabaseException("something-went-wrong");
    }
  }

  @override
  Future<UserLocalModel> checkSession() async {
    final session = await _secureStorage.getToken(_keySession);

    if (session != null) {
      final user = await _isar.userLocalDtos.getByUsername(session);

      if (user != null) {
        final lastSuccessfulSignIn =
            TimeFormatter.dateFormatter(user.lastSuccessfulSignIn);

        final lastUnsuccessfulSignIn =
            TimeFormatter.dateFormatter(user.lastUnuccessfulSignIn);

        final userModel = UserLocalModel(
          id: user.id,
          displayName: user.displayName,
          username: user.username,
          securityQuestion: user.securityQuestion,
          createdAt: user.createdAt,
          lastSuccessfulSignIn: lastSuccessfulSignIn,
          lastUnsuccessfulSignIn: lastUnsuccessfulSignIn,
          onboardingCompleted: user.onboardingCompleted,
        );
        return userModel;
      } else {
        throw DatabaseException("uesr-not-authorized");
      }
    } else {
      throw DatabaseException("invalid-session");
    }
  }

  @override
  bool checkOnboardingCompleted() {
    final onboardingCompleted =
        _sharedPreferences.getBool('onboardingCompleted') ?? false;

    return onboardingCompleted;
  }
}
