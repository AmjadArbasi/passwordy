import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class IUserManagementApi {
  Future<void> signUp(UserLocalModel userLocalModel);

  Future<Either<Failure, UserLocalModel>> signIn(
      String masterPassword, String username);

  Future<Either<Failure, UserLocalModel>> updateUserInfo(
    String username,
    String masterPassword,
    String secret,
  );

  Future<void> deleteUser(UserLocalModel userLocalModel);

  Future<Either<Failure, UserLocalModel>> reAuthLoggedUser();

  Future<Either<Failure, Unit>> logOut();

  Future<Either<Failure, void>> checkCurrentPassword(String masterPassword);

  Future<Either<Failure, void>> checkSecret(String username, String secret);

  Future<Either<Failure, Unit>> updatePassword(
      String username, String secret, String newPassword);
}
