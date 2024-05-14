import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:rxdart/rxdart.dart';

class UserManagementRepositoryImpl extends UserManagementRepository {
  UserManagementRepositoryImpl({
    required UserManagementApi api,
  }) : _api = api;

  final IUserManagementApi _api;

  final _behaviorSubject = BehaviorSubject<UserLocalEntity>();

  Stream<UserLocalEntity> get userStream => _behaviorSubject.stream;

  @override
  Future<Either<Failure, Unit>> signUp(UserLocalEntity userLocalEntity) async =>
      await _api.signUp(userLocalEntity.mapToModel());

  @override
  Future<Either<Failure, UserLocalEntity>> logIn(
    String masterPassword,
    String username,
  ) async {
    final result = await _api.signIn(masterPassword, username);
    return result.fold(
      (failure) => Left(failure),
      (userlocalModel) {
        final userLocalEntity = userlocalModel.mapToEntity();
        _behaviorSubject.add(userLocalEntity);
        return Right(userLocalEntity);
      },
    );
  }

  @override
  Future<Either<Failure, UserLocalEntity>> updateInfo(
      UserLocalEntity userLocalEntity) async {
    final result = await _api.updateUserInfo(userLocalEntity.mapToModel());

    return result.fold(
      (failure) => Left(failure),
      (userlocalModel) {
        final userlocalEntity = userlocalModel.mapToEntity();
        _behaviorSubject.add(userlocalEntity);
        return Right(userlocalEntity);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(
      UserLocalEntity userLocalEntity) async {
    final result = await _api.deleteUser(userLocalEntity.mapToModel());

    return result.fold(
      (failure) => Left(failure),
      (_) {
        _behaviorSubject.add(UserLocalEntity.empty);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, UserLocalEntity>> reAuthLoggedUser() async {
    final result = await _api.reAuthLoggedUser();
    return result.fold(
      (failure) => Left(failure),
      (userLocalModel) {
        final userLocalEntity = userLocalModel.mapToEntity();
        _behaviorSubject.add(userLocalEntity);
        return Right(userLocalEntity);
      },
    );
  }

  @override
  bool checkOnboardingCompleted() => _api.checkOnboardingCompleted();

  @override
  Future<Either<Failure, Unit>> logOut() async {
    final result = await _api.logOut();
    return result.fold(
      (failure) => Left(failure),
      (_) {
        _behaviorSubject.add(UserLocalEntity.empty);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> checkCurrentPassword(String masterPassword) =>
      _api.checkCurrentPassword(masterPassword);

  @override
  Future<Either<Failure, Unit>> checkSecret(String username, String secret) =>
      _api.checkSecret(username, secret);

  @override
  Future<Either<Failure, Unit>> updatePassword(
          String username, String secret, String newPassword) =>
      _api.updatePassword(username, secret, newPassword);

  @override
  Stream<UserLocalEntity> get stream => userStream;
}
