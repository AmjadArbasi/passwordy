import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class IUserManagementApi {
  Future<Either<Failure, Unit>> signUp(UserLocalModel userLocalModel);

  Future<Either<Failure, UserLocalModel>> signIn(
      String masterPassword, String username);

  Future<Either<Failure, UserLocalModel>> updateUserInfo(
      UserLocalModel userLocalModel);

  Future<Either<Failure, Unit>> deleteUser(UserLocalModel userLocalModel);

  Future<Either<Failure, UserLocalModel>> reAuthLoggedUser();

  Future<Either<Failure, Unit>> logOut();

  Future<Either<Failure, Unit>> checkCurrentPassword(String masterPassword);

  Future<Either<Failure, Unit>> checkSecret(String username, String secret);

  bool checkOnboardingCompleted();

  Future<Either<Failure, Unit>> updatePassword(
      String username, String secret, String newPassword);
}
