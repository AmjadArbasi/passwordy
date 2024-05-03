import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';

class UserManagementUsecase {
  UserManagementUsecase({
    required UserManagementRepository userManagementRepository,
  }) : _userManagementRepository = userManagementRepository;

  final UserManagementRepository _userManagementRepository;

  Future<Either<Failure, Unit>> signUp(UserLocalEntity userLocalEntity) async {
    final result = await _userManagementRepository.signUp(userLocalEntity);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  Future<Either<Failure, UserLocalEntity>> logIn(
      String masterPassword, String username) async {
    final result =
        await _userManagementRepository.logIn(masterPassword, username);
    return result;
  }

  Future<Either<Failure, UserLocalEntity>> updateInfo(
      String username, String masterPassword, String secret) async {
    return _userManagementRepository.updateInfo(
        username, masterPassword, secret);
  }

  Future<Either<Failure, Unit>> deleteUser(UserLocalEntity userLocalEntity) =>
      _userManagementRepository.deleteUser(userLocalEntity);

  Future<void> logOut() => _userManagementRepository.logOut();

  Future<Either<Failure, UserLocalEntity>> reAuthLoggedUser() =>
      _userManagementRepository.reAuthLoggedUser();

  Future<Either<Failure, Unit>> checkCurrentPassword(String masterPassword) =>
      _userManagementRepository.checkCurrentPassword(masterPassword);

  Future<Either<Failure, Unit>> checkSecret(String username, String secret) =>
      _userManagementRepository.checkSecret(username, secret);

  Future<Either<Failure, Unit>> updatePassword(
          String username, String secret, String newPassword) =>
      _userManagementRepository.updatePassword(username, secret, newPassword);

  Stream<UserLocalEntity> get stream => _userManagementRepository.stream;
}
