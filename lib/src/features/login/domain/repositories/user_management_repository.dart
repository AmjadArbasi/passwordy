import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class UserManagementRepository {
  Future<int> signUp(UserLocalEntity userLocalEntity);
  Future<UserLocalEntity> logIn(String masterPassword, String username);
  Future<UserLocalEntity> reAuthLoggedUser();
  Future<void> logOut();
  Future<void> deleteUser(UserLocalEntity userLocalEntity);
  Future<void> updateInfo(
      String username, String masterPassword, String secret);
  Future<bool> checkCurrentPassword(String masterPassword);

  Stream<UserLocalEntity> get stream;
}
