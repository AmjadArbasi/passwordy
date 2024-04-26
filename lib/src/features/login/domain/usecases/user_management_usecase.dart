import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserManagementUsecase {
  UserManagementUsecase({
    required UserManagementRepository userManagementRepository,
  }) : _userManagementRepository = userManagementRepository;

  final UserManagementRepository _userManagementRepository;

  Future<int> signUp(UserLocalEntity userLocalEntity) =>
      _userManagementRepository.signUp(userLocalEntity);

  Future<UserLocalEntity> logIn(String masterPassword, String username) =>
      _userManagementRepository.logIn(masterPassword, username);

  Future<void> deleteUser(UserLocalEntity userLocalEntity) =>
      _userManagementRepository.deleteUser(userLocalEntity);

  Future<void> updateInfo(
          String username, String masterPassword, String secret) =>
      _userManagementRepository.updateInfo(username, masterPassword, secret);

  Future<void> logOut() => _userManagementRepository.logOut();

  Future<UserLocalEntity> reAuthLoggedUser() =>
      _userManagementRepository.reAuthLoggedUser();

  Future<bool> checkCurrentPassword(String masterPassword) =>
      _userManagementRepository.checkCurrentPassword(masterPassword);

  Stream<UserLocalEntity> get stream => _userManagementRepository.stream;
}
