import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

abstract class IUserManagerApis {
  Future<void> createUser(UserLocalModel userLocalModel);

  Future<void> deleteUser();

  Future<UserLocalModel> updateUserinfo({
    required String displayName,
    required String newSecret,
    String? newSecurityQuestion,
    required String newMasterPassword,
    required String masterPassword,
  });

  Future<void> resetMasterPassword({
    required String username,
    required String secret,
    required String newMasterPassword,
  });

  // Future<UserLocalModel> getCurrentLoggedUser();
}
