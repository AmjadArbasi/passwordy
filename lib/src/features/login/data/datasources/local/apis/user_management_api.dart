import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

class UserManagementApi implements IUserManagementApi {
  UserManagementApi({
    required Isar isar,
    required SecureStorage secureStorage,
  })  : _isar = isar,
        _secureStorage = secureStorage;

  final Isar _isar;
  final SecureStorage _secureStorage;

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

      final user = UserLocalDto(
        id: userLocalModel.id,
        username: userLocalModel.username,
        salt: salt,
        securityQuestion: userLocalModel.securityQuestion,
        secret: hashedSecret,
        masterPassword: hashedMassterPassword,
        createdAt: userLocalModel.createdAt,
      );
      try {
        await _isar.writeTxn(() async {
          await _isar.userLocalDtos.put(user);
        });
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
          String formattedDate = DateFormat('yyyy-MM-dd–kk:mm').format(
            user.lastSuccessfulSignIn!,
          );
          final userLocalModel = UserLocalModel(
            id: user.id,
            username: user.username,
            lastSuccessfulSignIn: formattedDate,
            createdAt: user.createdAt,
          );
          await _secureStorage.storeToken(key, user.token!);
          return Right(userLocalModel);
        } catch (_) {
          return Left(DatabaseException("Something went wrong, bare with us"));
        }
      }
      return Left(DatabaseException("Username or password incorrect"));
    }
    return Left(
      DatabaseException("Username does not exist or password incorrect"),
    );
  }

  @override
  Future<Either<Failure, UserLocalModel>> updateUserInfo(
    String username,
    String masterPassword,
    String secret,
  ) async {
    if (username.isEmpty && masterPassword.isEmpty && secret.isEmpty) {
      return Left(DatabaseException("Please check your entries!"));
    }

    final checkDuplicateUser = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (checkDuplicateUser != null) {
      return Left(DatabaseException("The username is already used!"));
    }

    try {
      final token = await _secureStorage.getToken(key);
      final user =
          await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

      if (user != null) {
        if (username.isNotEmpty) {
          user.username = username;
        }
        if (masterPassword.isNotEmpty) {
          final salt = _generateSalt(masterPassword.length);
          final hashedMassterPassword = _hash(masterPassword, salt);
          user.masterPassword = hashedMassterPassword;
          user.salt = salt;
        }
        if (secret.isNotEmpty) {
          user.secret = secret;
        }

        try {
          await _isar.writeTxn(() async {
            await _isar.userLocalDtos.put(user);
          });
          final userLocalModel = UserLocalModel(
            id: user.id,
            username: user.username,
            createdAt: user.createdAt,
            lastSuccessfulSignIn: DateFormat('yyyy-MM-dd – kk:mm')
                .format(user.lastSuccessfulSignIn!),
          );
          return Right(userLocalModel);
        } catch (_) {
          return Left(DatabaseException(
              "Something went wrong, Falied to update you information, plase try agian later"));
        }
      }
      return Left(DatabaseException("Username does not exit"));
    } catch (_) {
      return Left(
          DatabaseException("Something went wrong, plase try agian later"));
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

    if (token != null) {
      final user =
          await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

      if (user != null) {
        String formattedDate = DateFormat('yyyy-MM-dd–kk:mm').format(
          user.lastSuccessfulSignIn!,
        );

        final userLocalModel = UserLocalModel(
          id: user.id,
          username: user.username,
          createdAt: user.createdAt,
          lastSuccessfulSignIn: formattedDate,
        );
        return Right(userLocalModel);
      }
      return Left(DatabaseException("User not exit"));
    }
    return Left(DatabaseException("User not authorized"));
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
}
