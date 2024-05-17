import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class UserManagementRepository {
  Future<Either<Failure, Unit>> signUp(UserLocalEntity userLocalEntity);
  Future<Either<Failure, UserLocalEntity>> logIn(
      String masterPassword, String username);

  Future<Either<Failure, UserLocalEntity>> updateInfo(
      UserLocalEntity userLocalEntity);

  Future<Either<Failure, Unit>> deleteUser();

  Future<Either<Failure, UserLocalEntity>> reAuthLoggedUser();
  Future<void> logOut();

  Future<Either<Failure, Unit>> checkCurrentPassword(String masterPassword);

  Future<Either<Failure, Unit>> checkSecret(String username, String secret);

  bool checkOnboardingCompleted();

  Future<Either<Failure, Unit>> updatePassword(
      String username, String secret, String newPassword);

  Stream<UserLocalEntity> get stream;
}
