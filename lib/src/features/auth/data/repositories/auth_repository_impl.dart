import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/failure.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({required IAuthApis iAuthApis}) : _apis = iAuthApis;

  final IAuthApis _apis;

  final _controller = BehaviorSubject<UserLocalEntity>();

  @override
  BehaviorSubject<UserLocalEntity> get streamController => _controller;

  @override
  Future<Either<SignInFailure, Unit>> logIn(
      String username, String password) async {
    try {
      final userLocalModel = await _apis.logIn(username, password);
      _controller.add(userLocalModel.mapToEntity());
      return const Right(unit);
    } on Failure catch (failure) {
      final error = SignInFailure.fromCode(failure.message);
      return Left(error);
    } catch (e) {
      return Left(SignInFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      await _apis.logOut();
      _controller.sink.add((UserLocalEntity.empty));
      return const Right(unit);
    } on Failure catch (failure) {
      return Left(LogoutFailure.fromCode(failure.message));
    } catch (e) {
      return Left(LogoutFailure());
    }
  }

  @override
  void dispose() => _controller.close();

  @override
  Future<Either<Failure, UserLocalEntity>> checkSession() async {
    try {
      final user = await _apis.checkSession();
      _controller.add(user.mapToEntity());
      return Right(user.mapToEntity());
    } on Failure catch (failure) {
      return Left(CheckSessionFailure.fromCode(failure.message));
    }
  }

  @override
  checkOnboardingCompleted() => _apis.checkOnboardingCompleted();
}

class CheckSessionFailure extends Failure {
  CheckSessionFailure([super.message = 'An unknown exception occurred.']);

  factory CheckSessionFailure.fromCode(String code) {
    switch (code) {
      case "invalid-session":
        return CheckSessionFailure(
            "The session expired, please sign in again.");
      case "uesr-not-authorized":
        return CheckSessionFailure("The uesr not authorized or not found.");
      default:
        return CheckSessionFailure();
    }
  }
}

class LogoutFailure extends Failure {
  LogoutFailure([super.message = 'An unknown exception occurred.']);

  factory LogoutFailure.fromCode(String code) {
    switch (code) {
      case "something-went-wrong":
        return LogoutFailure("Please contact support.");
      default:
        return LogoutFailure();
    }
  }
}

class SignInFailure extends Failure {
  SignInFailure([super.message = 'An unknown exception occurred.']);

  factory SignInFailure.fromCode(String code) {
    switch (code) {
      case "operation-not-allowed":
        return SignInFailure(
          "Operation is not allowed.  Please contact support.",
        );
      case "user-not-found":
        return SignInFailure(
          "The user is not found, please create an account.",
        );
      case "wrong-password":
        return SignInFailure("Incorrect password, please try again.");
      default:
        return SignInFailure();
    }
  }
}
