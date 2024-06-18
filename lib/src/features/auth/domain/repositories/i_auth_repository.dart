import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/failure.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:rxdart/rxdart.dart';

abstract class IAuthRepository {
  BehaviorSubject<UserLocalEntity> get streamController;

  Future<Either<Failure, Unit>> logIn(String username, String password);

  Future<Either<Failure, Unit>> logOut();

  Future<Either<Failure, UserLocalEntity>> checkSession();

  void dispose();

  checkOnboardingCompleted();
}
