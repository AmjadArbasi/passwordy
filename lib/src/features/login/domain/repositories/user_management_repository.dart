import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class UserManagementRepository {
  Future<bool> signUp(UserLocalEntity userLocalEntity);
  Future<bool> logIn(String masterPassword, String username);
  Future<void> deleteUser(UserLocalEntity userLocalEntity);
  Future<void> updateInfo(UserLocalEntity userLocalEntity);
}
