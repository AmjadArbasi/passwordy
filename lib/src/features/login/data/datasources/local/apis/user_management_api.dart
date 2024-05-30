import 'package:dartz/dartz.dart';
import 'package:encrypt/encrypt.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';

class UserManagementApi implements IUserManagementApi {
  UserManagementApi({
    required Isar isar,
    required SecureStorage secureStorage,
    required SharedPreferences sharedPreferences,
    Hash? hash,
  })  : _isar = isar,
        _secureStorage = secureStorage,
        _sharedPreferences = sharedPreferences,
        _hash = hash ?? Hash();

  final Isar _isar;
  final SecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;
  final Hash _hash;

  static const _keySession = GlobalVar.keySession;
  static const _aesGcmKey = GlobalVar.aesGcmKey;
  static final _logger = GlobalVar.logger;
  static const _ivKey = GlobalVar.ivKey;

  @override
  Future<Either<Failure, Unit>> signUp(UserLocalModel userLocalModel) async {
    final checkDuplicateUser = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(userLocalModel.username)
        .findFirst();

    if (checkDuplicateUser == null && userLocalModel.username!.isNotEmpty) {
      final hashedMassterPassword = _hash.hash(userLocalModel.masterPassword!);
      final hashedSecret = _hash.hash(userLocalModel.secret!);

      final iv = IV.fromSecureRandom(16).base64;

      final user = UserLocalDto(
        id: userLocalModel.id,
        username: userLocalModel.username,
        displayName: userLocalModel.username,
        securityQuestion: userLocalModel.securityQuestion,
        secret: hashedSecret,
        iv: iv,
        masterPassword: hashedMassterPassword,
        createdAt: userLocalModel.createdAt,
      );

      try {
        await _isar.writeTxn(() async {
          await _isar.userLocalDtos.put(user);
        });

        final registeredUser = await _isar.userLocalDtos.get(user.id!);

        GlobalVar.logger.f("registeredUser $registeredUser");

        final logs = LogActivitiesDbDto()..user.value = registeredUser;
        final categories = CategoriesDbDto()..user.value = registeredUser;

        await _isar.writeTxn(() async {
          await _isar.logActivitiesDbDtos.put(logs);
          await logs.user.save();
          await _isar.categoriesDbDtos.put(categories);
          await categories.user.save();
        });

        await _sharedPreferences.setBool('onboardingCompleted', true);

        return const Right(unit);
      } catch (e) {
        _logger.e("Something-went-wrong", error: e.toString());
        return Left(DatabaseException("operation-not-allowed"));
      }
    } else {
      return Left(DatabaseException('user-already-in-use-or-empty'));
    }
  }

  @override
  Future<Either<Failure, UserLocalModel>> signIn(
    String masterPassword,
    String username,
  ) async {
    await _secureStorage.deleteToken(_aesGcmKey);
    await _secureStorage.deleteToken(_ivKey);

    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null) {
      final hashedPassword = _hash.hash(masterPassword);

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

          /// Store key and IV variables localy secure
          await _secureStorage.storeToken(_aesGcmKey, hashedPassword);
          await _secureStorage.storeToken(_ivKey, user.iv!);

          return Right(userLocalModel);
        } catch (e) {
          _logger.e("something-went-wrong", error: e);

          return Left(DatabaseException("operation-not-allowed"));
        }
      } else {
        user.lastUnuccessfulSignIn = DateTime.now();
        await _isar.writeTxn(() async {
          await _isar.userLocalDtos.put(user);
        });

        return Left(DatabaseException("wrong-password"));
      }
    } else {
      return Left(DatabaseException("user-not-found"));
    }
  }

  @override
  Future<Either<Failure, UserLocalModel>> updateUserInfo(
      UserLocalModel userLocalModel) async {
    if (userLocalModel.isNotEmpty) {
      try {
        final session = await _secureStorage.getToken(_keySession);

        if (session != null) {
          final user = await _isar.userLocalDtos.getByUsername(session);

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
              _logger.f(userLocalModel.masterPassword);

              final hashedMassterPassword =
                  _hash.hash(userLocalModel.masterPassword!);
              user.masterPassword = hashedMassterPassword;
            }
            try {
              await _isar.writeTxn(() async {
                await _isar.userLocalDtos.put(user);
              });

              String lastSuccessfulSignIn =
                  TimeFormatter.dateFormatter(user.lastSuccessfulSignIn);

              String lastUnsuccessfulSignIn =
                  TimeFormatter.dateFormatter(user.lastUnuccessfulSignIn);
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
            } catch (e) {
              _logger.e("something-went-wrong", error: e);
              return Left(DatabaseException("something-went-wrong"));
            }
          } else {
            return Left(DatabaseException("user-not-found"));
          }
        } else {
          return Left(DatabaseException("operation-not-allowed"));
        }
      } catch (e) {
        _logger.e("something-went-wrong", error: e);
        return Left(DatabaseException("operation-not-allowed"));
      }
    } else {
      return Left(DatabaseException("invalid-credential"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUser() async {
    final session = await _secureStorage.getToken(_keySession);

    if (session != null) {
      final user = await _isar.userLocalDtos.getByUsername(session);

      if (user != null) {
        try {
          await _secureStorage.deleteToken(_keySession);

          final categories = await _isar.categoriesDbDtos
              .filter()
              .user((q) => q.idEqualTo(user.id))
              .findFirst();

          final log = await _isar.logActivitiesDbDtos
              .filter()
              .user((q) => q.idEqualTo(user.id))
              .findFirst();

          await _isar.writeTxn(() async {
            // if (categoryList != null) {
            // for (var categoryDbDto in categories!.categories) {
            //   await categoryDbDto.categories.filter().deleteAll();
            // }
            await categories?.categories.filter().deleteAll();
            await _isar.categoriesDbDtos
                .filter()
                .user((q) => q.idEqualTo(user.id))
                .deleteFirst();
            //   await _isar.categoriesDbDtos
            //       .filter()
            //       .linkerEqualTo(linker)
            //       .deleteFirst();
            // }

            await log?.logActivities.filter().deleteAll();

            // await _isar.logActivitiesDbDtos
            //     .filter()
            //     .linkerEqualTo(linker)
            //     .deleteFirst();

            /// Delete the logged user
            // _isar.userLocalDtos.deleteByUsername(user.username);
          });

          await _secureStorage.deleteToken(_keySession);
          await _secureStorage.deleteToken(_aesGcmKey);
          await _secureStorage.deleteToken(_ivKey);

          return const Right(unit);
        } catch (e) {
          _logger.e("something-went-wrong", error: e);

          return Left(DatabaseException("something-went-wrong"));
        }
      } else {
        return Left(DatabaseException("user-not-authorized"));
      }
    } else {
      return Left(DatabaseException("user-not-authorized"));
    }
  }

  @override
  Future<Either<Failure, UserLocalModel>> reAuthLoggedUser() async {
    final session = await _secureStorage.getToken(_keySession);
    if (session != null) {
      final user = await _isar.userLocalDtos.getByUsername(session);

      if (user != null) {
        final lastSuccessfulSignIn =
            TimeFormatter.dateFormatter(user.lastSuccessfulSignIn);

        final lastUnsuccessfulSignIn =
            TimeFormatter.dateFormatter(user.lastUnuccessfulSignIn);
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
        } catch (e) {
          _logger.e("something-went-wrong", error: e);

          return Left(DatabaseException("something-went-wrong"));
        }
      } else {
        return Left(DatabaseException("user-not-found"));
      }
    } else {
      return Left(DatabaseException("operation-not-allowed"));
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      await _secureStorage.deleteToken(_keySession);
      await _secureStorage.deleteToken(_aesGcmKey);
      await _secureStorage.deleteToken(_ivKey);
      return const Right(unit);
    } catch (e) {
      _logger.e("something-went-wrong", error: e);
      return Left(DatabaseException("something-went-wrong"));
    }
  }

  @override
  Future<Either<Failure, Unit>> checkCurrentPassword(
    String masterPassword,
  ) async {
    final session = await _secureStorage.getToken(_keySession);
    if (session != null) {
      final user = await _isar.userLocalDtos.getByUsername(session);

      if (user != null) {
        final hashedPassword = _hash.hash(masterPassword);
        if (user.masterPassword == hashedPassword) {
          return const Right(unit);
        } else {
          return Left(DatabaseException("invalid-credential"));
        }
      } else {
        return Left(DatabaseException("user-not-found"));
      }
    } else {
      return Left(DatabaseException("operation-not-allowed"));
    }
  }

  @override
  Future<Either<Failure, Unit>> checkSecret(
      String username, String secret) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null) {
      final hashedSecret = _hash.hash(secret);

      if (hashedSecret == user.secret) {
        return const Right(unit);
      } else {
        return Left(DatabaseException("invalid-credential"));
      }
    } else {
      return Left(DatabaseException("user-not-found"));
    }
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
      final hashedSecret = _hash.hash(secret);

      if (hashedSecret == user.secret) {
        final newPasswordHashed = _hash.hash(newPassword);
        final secretHashed = _hash.hash(secret);

        user.secret = secretHashed;
        user.masterPassword = newPasswordHashed;

        try {
          await _isar.writeTxn(() async {
            await _isar.userLocalDtos.put(user);
          });
          return const Right(unit);
        } catch (e) {
          _logger.e("something-went-wrong", error: e);
          return Left(DatabaseException("something-went-wrong"));
        }
      } else {
        return Left(DatabaseException("invalid-credential"));
      }
    } else {
      return Left(DatabaseException("user-not-found"));
    }
  }

  @override
  bool checkOnboardingCompleted() {
    final onboardingCompleted =
        _sharedPreferences.getBool('onboardingCompleted') ?? false;

    return onboardingCompleted;
  }
}
