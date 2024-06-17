import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/failure.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

abstract class IAuthRepository {
  Stream<UserLocalEntity> get stream;

  Future<Either<Failure, Unit>> logIn(String username, String password);

  Future<Either<Failure, Unit>> logOut();

  void dispose();
}
