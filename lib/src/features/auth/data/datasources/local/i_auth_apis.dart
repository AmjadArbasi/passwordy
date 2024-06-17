import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class IAuthApis {
  Future<UserLocalModel> logIn(String username, String password);

  Future<void> logOut();
}
