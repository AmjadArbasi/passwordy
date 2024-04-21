import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

abstract class UserManagerRespository {
  Future<UserFirebaseEntity?> getUserInfo();
  Future<void> updateUserInfo(String newName);
  Future<void> deleteUser();
  Future<void> resetPassword(String email);
  Future<void> updateEmail(String newEmail);
}
