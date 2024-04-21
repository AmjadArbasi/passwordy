import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

class UserManagerUsecase {
  UserManagerUsecase({
    required UserManagerRespository userManagerRespository,
  }) : _userManagerRespository = userManagerRespository;

  final UserManagerRespository _userManagerRespository;

  Future<UserFirebaseEntity?> getUserInfo() =>
      _userManagerRespository.getUserInfo();

  Future<void> updateUserInfo(String newName) =>
      _userManagerRespository.updateUserInfo(newName);

  Future<void> deleteUser() => _userManagerRespository.deleteUser();
}
