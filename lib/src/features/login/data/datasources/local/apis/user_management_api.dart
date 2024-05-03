import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_application_passmanager/src/core/services/services.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class UserManagementApi implements IUserManagementApi {
  UserManagementApi({
    required Isar isar,
    required SecureStorage secureStorage,
  })  : _isar = isar,
        _secureStorage = secureStorage;

  final Isar _isar;
  final SecureStorage _secureStorage;

  final _behaviorSubject = BehaviorSubject<UserLocalModel>();

  Stream<UserLocalModel> get userStream => _behaviorSubject.stream;

  static const String key = "token";

  @override
  Future<int> signUp(UserLocalModel userLocalModel) async {
    final checkDuplicateUser = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(userLocalModel.name)
        .findFirst();

    if (checkDuplicateUser == null && userLocalModel.name!.isNotEmpty) {
      final salt = _generateSalt(userLocalModel.masterPassword!.length);
      final hashedMassterPassword = _hash(userLocalModel.masterPassword!, salt);
      final hashedSecret = _hash(userLocalModel.secret!, salt);

      final user = UserLocalDto(
        id: userLocalModel.id,
        username: userLocalModel.name,
        salt: salt,
        securityQuestion: userLocalModel.securityQuestion,
        secret: hashedSecret,
        masterPassword: hashedMassterPassword,
        createdAt: userLocalModel.createdAt,
      );

      await _isar.writeTxn(() async {
        await _isar.userLocalDtos.put(user);
      });
      return 1;
    } else {
      return -1;
      // throw Exception();
    }
  }

  @override
  Future<UserLocalModel> signIn(String masterPassword, String username) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null) {
      final hashedPasswprd = _hash(masterPassword, user.salt!);

      if (hashedPasswprd == user.masterPassword) {
        user.token = _generateSalt(16);
        user.lastSuccessfulSignIn = DateTime.now();

        await _isar.writeTxn(() async {
          await _isar.userLocalDtos.put(user);
        });
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(
          user.lastSuccessfulSignIn!,
        );
        final userLocalModel = UserLocalModel(
          id: user.id,
          name: user.username,
          lastSuccessfulSignIn: formattedDate,
          createdAt: user.createdAt,
        );
        _behaviorSubject.add(userLocalModel);
        await _secureStorage.storeToken(key, user.token!);

        return userLocalModel;
      }
    }
    return UserLocalModel.empty;
  }

  @override
  Future<void> updateUserInfo(
      String username, String masterPassword, String secret) async {
    if (username.isEmpty && masterPassword.isEmpty && secret.isEmpty) return;

    final checkDuplicateUser = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (checkDuplicateUser != null) return;

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

      await _isar.writeTxn(() async {
        await _isar.userLocalDtos.put(user);
      });
      final userLocalModel = UserLocalModel(
        id: user.id,
        name: user.username,
        createdAt: user.createdAt,
      );
      _behaviorSubject.add(userLocalModel);
    }
  }

  @override
  Future<void> deleteUser(UserLocalModel userLocalModel) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(userLocalModel.name)
        .findFirst();

    if (user != null) {
      await _secureStorage.deleteToken(key);
      await _isar.writeTxn(() async {
        _isar.userLocalDtos.deleteByUsername(user.username);
      });
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
  Future<UserLocalModel> reAuthLoggedUser() async {
    final token = await _secureStorage.getToken(key);

    if (token != null) {
      final user =
          await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

      if (user != null) {
        String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(
          user.lastSuccessfulSignIn!,
        );

        final userLocalModel = UserLocalModel(
          id: user.id,
          name: user.username,
          createdAt: user.createdAt,
          lastSuccessfulSignIn: formattedDate,
        );
        _behaviorSubject.add(userLocalModel);
        return userLocalModel;
      }
      return UserLocalModel.empty;
    }
    return UserLocalModel.empty;
  }

  @override
  Future<void> logOut() async {
    await _secureStorage.deleteToken(key);
    _behaviorSubject.add(UserLocalModel.empty);
  }

  @override
  Future<bool> checkCurrentPassword(
    String masterPassword,
  ) async {
    final token = await _secureStorage.getToken(key);
    final user =
        await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

    if (user != null) {
      final hashedPassword = _hash(masterPassword, user.salt!);
      if (user.masterPassword == hashedPassword) {
        Logger().f(user);

        return true;
      }
    }
    return false;
  }

  @override
  Future<bool> checkSecret(String username, String secret) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null) {
      final hashedSecret = _hash(secret, user.salt!);

      if (hashedSecret == user.secret) {
        return true;
      }
      return false;
    }
    return false;
  }

  @override
  Future<void> updatePassword(
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

        await _isar.writeTxn(() async {
          await _isar.userLocalDtos.put(user);
        });
      } else {
        throw Exception("Secret invalid");
      }
    } else {
      throw Exception("user not found, secret or new password empty");
    }
  }
}
