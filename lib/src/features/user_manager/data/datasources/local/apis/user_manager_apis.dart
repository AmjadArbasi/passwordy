import 'package:encrypt/encrypt.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/log_activites/data/models/log_activities_db_dto.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManagerApis implements IUserManagerApis {
  UserManagerApis({
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
  final SharedPreferences _sharedPreferences;
  final PasswordyHash _passwordyHash;

  static const _keySession = GlobalVar.keySession;
  static final _logger = GlobalVar.logger;
  static const _oldKey = GlobalVar.oldKey;

  @override
  Future<void> createUser(UserLocalModel userLocalModel) async {
    final checkDuplicateUser = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(userLocalModel.username)
        .findFirst();

    if (checkDuplicateUser == null && userLocalModel.username!.isNotEmpty) {
      final hashedMassterPassword =
          _passwordyHash.hash(userLocalModel.masterPassword!);
      final hashedSecret = _passwordyHash.hash(userLocalModel.secret!);

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
        onboardingCompleted: true,
      );

      try {
        await _isar.writeTxn(() async {
          await _isar.userLocalDtos.put(user);
        });

        final registeredUser = await _isar.userLocalDtos.get(user.id!);

        final logs = LogActivitiesDbDto()..user.value = registeredUser;
        final categories = CategoriesDbDto()..user.value = registeredUser;

        await _isar.writeTxn(() async {
          await _isar.logActivitiesDbDtos.put(logs);
          await logs.user.save();
          await _isar.categoriesDbDtos.put(categories);
          await categories.user.save();
        });

        await _sharedPreferences.setBool('onboardingCompleted', true);
      } catch (e) {
        _logger.e("Something-went-wrong", error: e.toString());
        throw UserManagerException("operation-not-allowed");
      }
    } else {
      throw UserManagerException('user-already-in-use-or-empty');
    }
  }

  @override
  Future<void> deleteUser() async {
    final session = await _secureStorage.getToken(_keySession);

    if (session != null) {
      final user = await _isar.userLocalDtos.getByUsername(session);

      if (user != null) {
        try {
          /// Delete all categories related to [user]
          final categoriesDbDto = await _isar.categoriesDbDtos
              .filter()
              .user((q) => q.idEqualTo(user.id))
              .findFirst();

          if (categoriesDbDto != null) {
            /// Delete all catchwords related to [user]
            final catchwordsIdsTemp = categoriesDbDto.categories
                .map((e) => e.catchwords.map((e) => e.id!).toList())
                .toList();

            final catchwordsIds =
                catchwordsIdsTemp.expand((element) => element).toList();

            await _isar.writeTxn(() async {
              await _isar.catchwordDbDtos.deleteAll(catchwordsIds);
            });

            await _isar.writeTxn(() async {
              await categoriesDbDto.categories.filter().deleteAll();
              await _isar.categoriesDbDtos.delete(categoriesDbDto.id!);
            });
          }

          final log = await _isar.logActivitiesDbDtos
              .filter()
              .user((q) => q.idEqualTo(user.id))
              .findFirst();

          if (log != null) {
            await _isar.writeTxn(() async {
              await log.logActivities.filter().deleteAll();
              await _isar.logActivitiesDbDtos.delete(log.id);
            });
          }

          await _isar.writeTxn(() async {
            await _isar.userLocalDtos.deleteByUsername(user.username);
          });

          await _secureStorage.deleteToken(_keySession);
        } catch (e) {
          _logger.e("something-went-wrong", error: e);

          throw UserManagerException("something-went-wrong");
        }
      } else {
        throw UserManagerException("user-not-authorized");
      }
    } else {
      throw UserManagerException("user-not-authorized");
    }
  }

  @override
  Future<UserLocalModel> updateUserinfo({
    required String displayName,
    required String newSecret,
    String? newSecurityQuestion,
    required String newMasterPassword,
    required String masterPassword,
  }) async {
    final session = await _secureStorage.getToken(_keySession);

    if (session != null) {
      final user = await _isar.userLocalDtos.getByUsername(session);

      if (user != null) {
        if (user.masterPassword == _passwordyHash.hash(masterPassword)) {
          if (displayName.isNotEmpty) {
            user.displayName = displayName;
          }
          if (newSecret.isNotEmpty) {
            user.secret = _passwordyHash.hash(newSecret);
          }
          if (newSecurityQuestion != null && newSecurityQuestion.isNotEmpty) {
            user.securityQuestion = newSecurityQuestion;
          }
          if (newMasterPassword.isNotEmpty) {
            await _secureStorage.storeToken(_oldKey, user.masterPassword!);

            final hashedMassterPassword =
                _passwordyHash.hash(newMasterPassword);

            user.masterPassword = hashedMassterPassword;
          }

          try {
            await _isar.writeTxn(() async {
              await _isar.userLocalDtos.put(user);
            });
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
          } catch (e) {
            throw UserManagerException("something-went-wrong");
          }
        } else {
          throw UserManagerException("invalid-credential");
        }
      } else {
        throw UserManagerException("user-not-found");
      }
    } else {
      throw UserManagerException("user-not-authorized");
    }
  }

  @override
  Future<void> resetMasterPassword({
    required String username,
    required String secret,
    required String newMasterPassword,
  }) async {
    final user = await _isar.userLocalDtos
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (user != null && secret.isNotEmpty && newMasterPassword.isNotEmpty) {
      final hashedSecret = _passwordyHash.hash(secret);

      if (hashedSecret == user.secret) {
        await _secureStorage.storeToken(_oldKey, user.masterPassword!);

        final newPasswordHashed = _passwordyHash.hash(newMasterPassword);
        user.masterPassword = newPasswordHashed;

        try {
          await _isar.writeTxn(() async {
            await _isar.userLocalDtos.put(user);
          });
        } catch (e) {
          throw DatabaseException("something-went-wrong");
        }
      } else {
        throw DatabaseException("invalid-secret");
      }
    } else {
      throw DatabaseException("user-not-found");
    }
  }

  // @override
  // Future<UserLocalModel> getCurrentLoggedUser() async {
  //   final session = await _secureStorage.getToken(_keySession);

  //   if (session != null) {
  //     final user = await _isar.userLocalDtos.getByUsername(session);

  //     if (user != null) {
  //       final lastSuccessfulSignIn =
  //           TimeFormatter.dateFormatter(user.lastSuccessfulSignIn);

  //       final lastUnsuccessfulSignIn =
  //           TimeFormatter.dateFormatter(user.lastUnuccessfulSignIn);

  //       final userModel = UserLocalModel(
  //         id: user.id,
  //         displayName: user.displayName,
  //         username: user.username,
  //         lastSuccessfulSignIn: lastSuccessfulSignIn,
  //         lastUnsuccessfulSignIn: lastUnsuccessfulSignIn,
  //         createdAt: user.createdAt,
  //         securityQuestion: user.securityQuestion,
  //         onboardingCompleted: user.onboardingCompleted,
  //       );
  //       return userModel;
  //     } else {
  //       throw UserManagerException("user-not-found");
  //     }
  //   } else {
  //     throw UserManagerException("user-not-authorized");
  //   }
  // }
}
