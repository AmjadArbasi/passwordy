import 'package:flutter_application_passmanager/src/features/login/login.dart';

class AuthenticationUsecases {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationUsecases({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  Stream<UserEntity> get user => _authenticationRepository.user;

  UserEntity get currentUser => _authenticationRepository.currentUser;

  Future<void> signUp({required String email, required String password}) =>
      _authenticationRepository.signUp(email: email, password: password);

  Future<void> logInWithGoogle() => _authenticationRepository.logInWithGoogle();

  Future<void> logInWithEmailAndPassword(
          {required String email, required String password}) =>
      _authenticationRepository.logInWithEmailAndPassword(
          email: email, password: password);

  Future<void> logOut() => _authenticationRepository.logOut();
}
