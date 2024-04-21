import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserManagementRepositoryImpl extends UserManagementRepository {
  UserManagementRepositoryImpl({
    required UserManagementApi api,
  }) : _api = api;
  final UserManagementApi _api;

  static const String key = "";

  @override
  Future<bool> logIn(String masterPassword, String username) async {
    final status = await _api.signIn(masterPassword, username);
    return status;
  }

  @override
  Future<bool> signUp(UserLocalEntity userLocalEntity) async {
    return await _api.signUp(userLocalEntity.mapToModel());
  }

  @override
  Future<void> updateInfo(UserLocalEntity userLocalEntity) async {
    await _api.updateUserInfo(userLocalEntity.mapToModel());
  }

  @override
  Future<void> deleteUser(UserLocalEntity userLocalEntity) async {
    await _api.deleteUser(userLocalEntity.mapToModel());
  }
}
