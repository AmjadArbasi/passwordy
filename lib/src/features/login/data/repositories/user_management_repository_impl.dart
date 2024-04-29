import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserManagementRepositoryImpl extends UserManagementRepository {
  UserManagementRepositoryImpl({
    required UserManagementApi api,
  }) : _api = api;

  final UserManagementApi _api;

  @override
  Future<UserLocalEntity> logIn(String masterPassword, String username) async {
    final userLocalModel = await _api.signIn(masterPassword, username);
    return userLocalModel.mapToEntity();
  }

  @override
  Future<int> signUp(UserLocalEntity userLocalEntity) async {
    return await _api.signUp(userLocalEntity.mapToModel());
  }

  @override
  Future<void> updateInfo(
      String username, String masterPassword, String secret) async {
    await _api.updateUserInfo(username, masterPassword, secret);
  }

  @override
  Future<void> deleteUser(UserLocalEntity userLocalEntity) async {
    await _api.deleteUser(userLocalEntity.mapToModel());
  }

  @override
  Future<void> logOut() async {
    await _api.logOut();
  }

  @override
  Stream<UserLocalEntity> get stream => _api.userStream.map(
        (userLocalModel) => userLocalModel.mapToEntity(),
      );

  @override
  Future<UserLocalEntity> reAuthLoggedUser() async {
    final userLocalModel = await _api.reAuthLoggedUser();
    return userLocalModel.mapToEntity();
  }

  @override
  Future<bool> checkCurrentPassword(String masterPassword) async {
    return await _api.checkCurrentPassword(masterPassword);
  }

  @override
  Future<bool> checkSecret(String username, String secret) async {
    return await _api.checkSecret(username, secret);
  }

  @override
  Future<void> updatePassword(
      String username, String secret, String newPassword) async {
    await _api.updatePassword(username, secret, newPassword);
  }
}
