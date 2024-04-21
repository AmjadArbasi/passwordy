import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class IUserManagementApi {
  Future<bool> signIn(String masterPassword, String username);
  Future<bool> signUp(UserLocalModel userLocalModel);
  Future<void> deleteUser(UserLocalModel userLocalModel);
  Future<void> updateUserInfo(UserLocalModel userLocalModel);
}
