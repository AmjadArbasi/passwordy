import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/exceptions.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

abstract class IUserManagerRepository {
  Future<Either<Failure, Unit>> createUser(UserLocalEntity userLocalEntity);

  Future<Either<Failure, Unit>> deleteUser();

  Future<Either<Failure, UserLocalEntity>> updateUserinfo({
    required String displayName,
    required String newSecret,
    String? newSecurityQuestion,
    required String newMasterPassword,
    required String masterPassword,
  });

  Future<Either<Failure, Unit>> resetMasterPassword({
    required String username,
    required String newMasterPassword,
    required String secret,
  });

  // Future<Either<Failure, UserLocalEntity>> getCurrentLoggedUser();
}
