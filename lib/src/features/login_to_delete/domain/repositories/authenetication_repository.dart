import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class AuthenticationRepository {
  Stream<UserEntity> get user;

  UserEntity get currentUser;

  Future<void> signUp({required String email, required String password});

  Future<void> logInWithGoogle();

  Future<void> logInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> logOut();
}
