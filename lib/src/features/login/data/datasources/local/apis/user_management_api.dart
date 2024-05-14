import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:isar/isar.dart';
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

  final keyToken = GlobalVar.keyToken;
  final logger = GlobalVar.logger;

  @override
  Future<Either<Failure, Unit>> signUp(UserLocalModel userLocalModel) async {
    final checkDuplicateUser = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(userLocalModel.username)
        .findFirst();

    if (checkDuplicateUser == null && userLocalModel.username!.isNotEmpty) {
      final salt =
          CryptoLocal.generateSalt(userLocalModel.masterPassword!.length);

      final hashedMassterPassword =
          CryptoLocal.hash(userLocalModel.masterPassword!, salt);
      final hashedSecret = CryptoLocal.hash(userLocalModel.secret!, salt);
      final linker = CryptoLocal.hash(userLocalModel.username!, salt);

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
        logger.e("Something-went-wrong", error: e.toString());
        return Left(DatabaseException("operation-not-allowed"));
      }
    } else {
      return Left(DatabaseException('user-already-in-use'));
    }
  }

  @override
  Future<Either<Failure, UserLocalModel>> signIn(
    String masterPassword,
    String username,
  ) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null) {
      final hashedPasswprd = CryptoLocal.hash(masterPassword, user.salt!);

      if (hashedPasswprd == user.masterPassword) {
        user.token = CryptoLocal.generateSalt(16);
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

          await _secureStorage.storeToken(keyToken, user.token!);

          return Right(userLocalModel);
        } catch (e) {
          logger.e("something-went-wrong", error: e);

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
        final token = await _secureStorage.getToken(keyToken);
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

            final salt =
                CryptoLocal.generateSalt(userLocalModel.masterPassword!.length);
            final hashedMassterPassword =
                CryptoLocal.hash(userLocalModel.masterPassword!, salt);
            user.masterPassword = hashedMassterPassword;
            user.salt = salt;
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
            logger.e("something-went-wrong", error: e);
            return Left(DatabaseException("something-went-wrong"));
          }
        } else {
          return Left(DatabaseException("user-not-found"));
        }
      } catch (e) {
        logger.e("something-went-wrong", error: e);
        return Left(DatabaseException("operation-not-allowed"));
      }
    } else {
      return Left(DatabaseException("invalid-credential"));
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
        await _secureStorage.deleteToken(keyToken);
        await _isar.writeTxn(() async {
          _isar.userLocalDtos.deleteByUsername(user.username);
        });
        return const Right(unit);
      } catch (e) {
        logger.e("something-went-wrong", error: e);

        return Left(DatabaseException("something-went-wrong"));
      }
    } else {
      return Left(DatabaseException("user-not-found"));
    }
  }

  @override
  Future<Either<Failure, UserLocalModel>> reAuthLoggedUser() async {
    final token = await _secureStorage.getToken(keyToken);

    final user =
        await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

    if (token != null && user != null) {
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
        logger.e("something-went-wrong", error: e);

        return Left(DatabaseException("something-went-wrong"));
      }
    } else {
      return Left(DatabaseException("user-not-found"));
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      await _secureStorage.deleteToken(keyToken);
      return const Right(unit);
    } catch (e) {
      logger.e("something-went-wrong", error: e);
      return Left(DatabaseException("something-went-wrong"));
    }
  }

  @override
  Future<Either<Failure, Unit>> checkCurrentPassword(
    String masterPassword,
  ) async {
    final token = await _secureStorage.getToken(keyToken);
    final user =
        await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();

    if (user != null) {
      final hashedPassword = CryptoLocal.hash(masterPassword, user.salt!);
      if (user.masterPassword == hashedPassword) {
        return const Right(unit);
      } else {
        return Left(DatabaseException("invalid-credential"));
      }
    } else {
      return Left(DatabaseException("user-not-found"));
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
      final hashedSecret = CryptoLocal.hash(secret, user.salt!);

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
      final hashedSecret = CryptoLocal.hash(secret, user.salt!);

      if (hashedSecret == user.secret) {
        final newSalt = CryptoLocal.generateSalt(username.length);
        final newPasswordHashed = CryptoLocal.hash(newPassword, newSalt);
        final secretHashed = CryptoLocal.hash(secret, newSalt);

        user.salt = newSalt;
        user.secret = secretHashed;
        user.masterPassword = newPasswordHashed;

        try {
          await _isar.writeTxn(() async {
            await _isar.userLocalDtos.put(user);
          });
          return const Right(unit);
        } catch (e) {
          logger.e("something-went-wrong", error: e);
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
