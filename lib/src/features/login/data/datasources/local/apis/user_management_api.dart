import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_application_passmanager/src/features/login/data/datasources/local/apis/i_user_management_api.dart';
import 'package:flutter_application_passmanager/src/features/login/data/datasources/local/models/user_local_dto.dart';
import 'package:flutter_application_passmanager/src/features/login/data/models/user_local_model.dart';
import 'package:isar/isar.dart';

class UserManagementApi implements IUserManagementApi {
  UserManagementApi({
    required Isar isar,
  }) : _isar = isar;

  final Isar _isar;

  @override
  Future<bool> signUp(UserLocalModel userLocalModel) async {
    final salt = _generateSalt(userLocalModel.masterPassword!.length);
    final hashedMassterPassword =
        _hashPassword(userLocalModel.masterPassword!, salt);

    final user = UserLocalDto(
      id: userLocalModel.id,
      username: userLocalModel.name,
      salt: salt,
      masterPassword: hashedMassterPassword,
      createdAt: userLocalModel.createdAt,
    );

    await _isar.writeTxn(() async {
      return await _isar.userLocalDtos.put(user);
    });
    return false;
  }

  @override
  Future<bool> signIn(String masterPassword, String username) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();
    if (user != null) {
      final hashedPasswprd = _hashPassword(masterPassword, user.salt!);
      return hashedPasswprd == user.masterPassword;
    }
    return false;
  }

  @override
  Future<void> updateUserInfo(UserLocalModel userLocalModel) async {
    final user = UserLocalDto(
      id: userLocalModel.id,
      username: userLocalModel.name,
    );
    await _isar.writeTxn(() async {
      await _isar.userLocalDtos.put(user);
    });
  }

  @override
  Future<void> deleteUser(UserLocalModel userLocalModel) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(userLocalModel.name)
        .findFirst();

    if (user != null) {
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

  String _hashPassword(String password, String salt) {
    final key = utf8.encode(password);
    final saltBytes = utf8.encode(salt);

    final hmacSha256 = Hmac(sha256, saltBytes); // Use HMAC with SHA-256
    final digest = hmacSha256.convert(key);

    return digest.toString();
  }
}
