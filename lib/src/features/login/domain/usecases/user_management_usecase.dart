import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserManagementUsecase {
  UserManagementUsecase({
    required UserManagementRepository userManagementRepository,
  }) : _userManagementRepository = userManagementRepository;

  final UserManagementRepository _userManagementRepository;

  Future<bool> signUp(UserLocalEntity userLocalEntity) =>
      _userManagementRepository.signUp(userLocalEntity);

  Future<bool> logIn(String masterPassword, String username) =>
      _userManagementRepository.logIn(masterPassword, username);

  Future<void> deleteUser(UserLocalEntity userLocalEntity) =>
      _userManagementRepository.deleteUser(userLocalEntity);

  Future<void> updateInfo(UserLocalEntity userLocalEntity) =>
      _userManagementRepository.updateInfo(userLocalEntity);
}
