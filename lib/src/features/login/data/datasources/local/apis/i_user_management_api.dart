import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class IUserManagementApi {
  Future<UserLocalModel> signIn(String masterPassword, String username);
  Future<int> signUp(UserLocalModel userLocalModel);
  Future<UserLocalModel> reAuthLoggedUser();
  Future<void> deleteUser(UserLocalModel userLocalModel);
  Future<void> updateUserInfo(
      String username, String masterPassword, String secret);
  Future<bool> checkCurrentPassword(String masterPassword);
  Future<void> logOut();
}
