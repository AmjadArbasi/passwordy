import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

abstract class IAuthApis {
  Future<UserLocalModel> logIn(String username, String password);

  Future<void> logOut();

  Future<UserLocalModel> checkSession();

  checkOnboardingCompleted();
}
