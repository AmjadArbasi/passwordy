import 'dart:async';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/auth/data/datasources/local/i_auth_apis.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:isar/isar.dart';

class AuthApis implements IAuthApis {
  AuthApis({
    required Isar isar,
    required SecureStorage secureStorage,
    Hash? hash,
  })  : _isar = isar,
        _secureStorage = secureStorage,
        _hash = hash ?? Hash();

  final Isar _isar;
  final SecureStorage _secureStorage;
  final Hash _hash;

  static const _keySession = GlobalVar.keySession;

  @override
  Future<UserLocalModel> logIn(String username, String password) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null) {
      final hashedPassword = _hash.hash(password);

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
}
