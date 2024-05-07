import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManagementApi implements IUserManagementApi {
  UserManagementApi({
    required Isar isar,
    required SecureStorage secureStorage,
    required SharedPreferences sharedPreferences,
  })  : _isar = isar,
        _secureStorage = secureStorage,
        _sharedPreferences = sharedPreferences;

  final Isar _isar;
  final SecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  static const String key = "token";

  @override
  Future<Either<Failure, Unit>> signUp(UserLocalModel userLocalModel) async {
    final checkDuplicateUser = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(userLocalModel.username)
        .findFirst();

    if (checkDuplicateUser == null && userLocalModel.username!.isNotEmpty) {
      final salt = _generateSalt(userLocalModel.masterPassword!.length);
      final hashedMassterPassword = _hash(userLocalModel.masterPassword!, salt);
      final hashedSecret = _hash(userLocalModel.secret!, salt);
      final linker = _hash(userLocalModel.username!, salt);

      final user = UserLocalDto(
        id: userLocalModel.id,
        username: userLocalModel.username,
        displayName: userLocalModel.username,
        salt: salt,
        securityQuestion: userLocalModel.securityQuestion,
        secret: hashedSecret,
        linker: linker,
        masterPassword: hashedMassterPassword,
        createdAt: userLocalModel.createdAt,
      );
      final categories = CategoriesDbDto(linker: linker);
      final logs = LogActivitiesDbDto()..linker = linker;
      try {
        await _isar.writeTxn(() async {
          await _isar.userLocalDtos.put(user);
          await _isar.categoriesDbDtos.put(categories);
          await _isar.logActivitiesDbDtos.put(logs);
        });
        await _sharedPreferences.setBool('onboardingCompleted', true);

        return const Right(unit);
      } catch (e) {
        return Left(
            DatabaseException('Failed to add user, please try again later'));
      }
    } else {
      return Left(DatabaseException('User is already exist!'));
    }
  }

  @override
  Future<Either<Failure, UserLocalModel>> signIn(
      String masterPassword, String username) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null) {
      final hashedPasswprd = _hash(masterPassword, user.salt!);

      if (hashedPasswprd == user.masterPassword) {
        user.token = _generateSalt(16);
        user.lastSuccessfulSignIn = DateTime.now();
        try {
          await _isar.writeTxn(() async {
            await _isar.userLocalDtos.put(user);
          });
          String lastSuccessfulSignIn = user.lastSuccessfulSignIn == null
              ? "n/a"
              : DateFormat('yyyy-MM-dd–kk:mm').format(
                  user.lastSuccessfulSignIn!,
                );
          String lastUnsuccessfulSignIn = user.lastUnuccessfulSignIn == null
              ? "n/a"
              : DateFormat('yyyy-MM-dd–kk:mm').format(
                  user.lastUnuccessfulSignIn!,
                );

          final userLocalModel = UserLocalModel(
            id: user.id,
            username: user.username,
            displayName: user.displayName,
            securityQuestion: user.securityQuestion,
            lastSuccessfulSignIn: lastSuccessfulSignIn,
            lastUnsuccessfulSignIn: lastUnsuccessfulSignIn,
            createdAt: user.createdAt,
          );

          await _secureStorage.storeToken(key, user.token!);
          logger.f(userLocalModel);
          return Right(userLocalModel);
        } catch (_) {
          return Left(DatabaseException("Something went wrong, bare with us"));
        }
      } else {
        user.lastUnuccessfulSignIn = DateTime.now();
        await _isar.writeTxn(() async {
          await _isar.userLocalDtos.put(user);
        });

        return Left(DatabaseException("Username or password incorrect"));
      }
    }
    return Left(
      DatabaseException("Username does not exist or password incorrect"),
    );
  }

  @override
  Future<Either<Failure, UserLocalModel>> updateUserInfo(
      UserLocalModel userLocalModel) async {
    if (userLocalModel.isNotEmpty) {
      try {
        final token = await _secureStorage.getToken(key);
        final user =
            await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();
        if (user != null) {
          if (userLocalModel.displayName != null &&
              userLocalModel.displayName!.isNotEmpty) {
            user.displayName = userLocalModel.displayName;
          }
          if (userLocalModel.secret != null &&
              userLocalModel.secret!.isNotEmpty) {
            user.secret = userLocalModel.secret;
          }
          if (userLocalModel.securityQuestion != null &&
              userLocalModel.securityQuestion!.isNotEmpty) {
            user.securityQuestion = userLocalModel.securityQuestion;
          }

          if (userLocalModel.masterPassword != null &&
              userLocalModel.masterPassword!.isNotEmpty) {
            logger.f(userLocalModel.masterPassword);

            final salt = _generateSalt(userLocalModel.masterPassword!.length);
            final hashedMassterPassword =
                _hash(userLocalModel.masterPassword!, salt);
            user.masterPassword = hashedMassterPassword;
            user.salt = salt;
          }
          try {
            await _isar.writeTxn(() async {
              await _isar.userLocalDtos.put(user);
            });
            String lastSuccessfulSignIn = user.lastSuccessfulSignIn == null
                ? "n/a"
                : DateFormat('yyyy-MM-dd–kk:mm').format(
                    user.lastSuccessfulSignIn!,
                  );
            String lastUnsuccessfulSignIn = user.lastUnuccessfulSignIn == null
                ? "n/a"
                : DateFormat('yyyy-MM-dd–kk:mm').format(
                    user.lastUnuccessfulSignIn!,
                  );
            final userLocalModel = UserLocalModel(
              id: user.id,
              username: user.username,
              displayName: user.displayName,
              createdAt: user.createdAt,
              securityQuestion: user.securityQuestion,
              lastSuccessfulSignIn: lastSuccessfulSignIn,
              lastUnsuccessfulSignIn: lastUnsuccessfulSignIn,
            );
            return Right(userLocalModel);
          } catch (_) {
            return Left(DatabaseException(
                "Something went wrong, Falied to update you information, plase try agian later"));
          }
        } else {
          return Left(DatabaseException("Username does not exit"));
        }
      } catch (_) {
        return Left(
            DatabaseException("Something went wrong, plase try agian later"));
      }
    } else {
      return Left(DatabaseException("Please check your entries!"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(
      UserLocalModel userLocalModel) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(userLocalModel.username)
        .findFirst();

    if (user != null) {
      try {
        await _secureStorage.deleteToken(key);
        await _isar.writeTxn(() async {
          _isar.userLocalDtos.deleteByUsername(user.username);
        });
        return const Right(unit);
      } catch (_) {
        return Left(DatabaseException("Something went wrong"));
      }
    }
    return Left(DatabaseException("User not exist"));
  }

  @override
  Future<Either<Failure, UserLocalModel>> reAuthLoggedUser() async {
    final token = await _secureStorage.getToken(key);

    final user =
        await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

    if (token != null && user != null) {
      String lastSuccessfulSignIn = user.lastSuccessfulSignIn == null
          ? "n/a"
          : DateFormat('yyyy-MM-dd–kk:mm').format(
              user.lastSuccessfulSignIn!,
            );
      String lastUnsuccessfulSignIn = user.lastUnuccessfulSignIn == null
          ? "n/a"
          : DateFormat('yyyy-MM-dd–kk:mm').format(
              user.lastUnuccessfulSignIn!,
            );
      try {
        final userLocalModel = UserLocalModel(
          id: user.id,
          username: user.username,
          displayName: user.displayName,
          securityQuestion: user.securityQuestion,
          createdAt: user.createdAt,
          lastSuccessfulSignIn: lastSuccessfulSignIn,
          lastUnsuccessfulSignIn: lastUnsuccessfulSignIn,
        );
        return Right(userLocalModel);
      } catch (_) {
        return Left(
          DatabaseException("Something went wrong, please try again later"),
        );
      }
    } else {
      return Left(DatabaseException("User not authorzied"));
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      await _secureStorage.deleteToken(key);
      return const Right(unit);
    } catch (_) {
      return Left(DatabaseException("Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, Unit>> checkCurrentPassword(
    String masterPassword,
  ) async {
    final token = await _secureStorage.getToken(key);
    final user =
        await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

    if (user != null) {
      final hashedPassword = _hash(masterPassword, user.salt!);
      if (user.masterPassword == hashedPassword) {
        Logger().f(user);

        return const Right(unit);
      }
    }
    return Left(DatabaseException("User not exist"));
  }

  @override
  Future<Either<Failure, Unit>> checkSecret(
      String username, String secret) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null) {
      final hashedSecret = _hash(secret, user.salt!);

      if (hashedSecret == user.secret) {
        return const Right(unit);
      }
    }
    return Left(DatabaseException("User not exist"));
  }

  @override
  Future<Either<Failure, Unit>> updatePassword(
    String username,
    String secret,
    String newPassword,
  ) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null && secret.isNotEmpty && newPassword.isNotEmpty) {
      final hashedSecret = _hash(secret, user.salt!);

      if (hashedSecret == user.secret) {
        final newSalt = _generateSalt(username.length);
        final newPasswordHashed = _hash(newPassword, newSalt);
        final secretHashed = _hash(secret, newSalt);

        user.salt = newSalt;
        user.secret = secretHashed;
        user.masterPassword = newPasswordHashed;

        try {
          await _isar.writeTxn(() async {
            await _isar.userLocalDtos.put(user);
          });
          return const Right(unit);
        } catch (e) {
          return Left(DatabaseException(e.toString()));
        }
      } else {
        return Left(DatabaseException("Secret incorrect"));
      }
    } else {
      return Left(
        DatabaseException("user not found, secret or new password empty"),
      );
    }
  }

  String _generateSalt(int length) {
    final rand = Random.secure();
    final bytes = List<int>.generate(length, (_) => rand.nextInt(256));
    return base64Url.encode(bytes);
  }

  String _hash(String password, String salt) {
    final key = utf8.encode(password);
    final saltBytes = utf8.encode(salt);

    final hmacSha256 = Hmac(sha256, saltBytes);
    final digest = hmacSha256.convert(key);

    return digest.toString();
  }

  @override
  bool checkOnboardingCompleted() {
    final onboardingCompleted =
        _sharedPreferences.getBool('onboardingCompleted') ?? false;

    return onboardingCompleted;
  }
}
