import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/failure.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

class UserManagerRepositoryImpl extends IUserManagerRepository {
  UserManagerRepositoryImpl({required IUserManagerApis iUserManagerApis})
      : _apis = iUserManagerApis;

  final IUserManagerApis _apis;

  @override
  Future<Either<Failure, Unit>> createUser(
      UserLocalEntity userLocalEntity) async {
    try {
      await _apis.createUser(userLocalEntity.mapToModel());
      return const Right(unit);
    } on Failure catch (failure) {
      return Left(CreateUserFailure.fromCode(failure.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUser() async {
    try {
      await _apis.deleteUser();
      return const Right(unit);
    } on Failure catch (code) {
      return Left(DeleteUserFailure.fromCode(code.message));
    }
  }

  @override
  Future<Either<Failure, UserLocalEntity>> updateUserinfo({
    required String displayName,
    required String newSecret,
    String? newSecurityQuestion,
    required String newMasterPassword,
    required String masterPassword,
  }) async {
    try {
      final user = await _apis.updateUserinfo(
        displayName: displayName,
        newSecret: newSecret,
        newSecurityQuestion: newSecurityQuestion,
        newMasterPassword: newMasterPassword,
        masterPassword: masterPassword,
      );
      return Right(user.mapToEntity());
    } on Failure catch (code) {
      return Left(UpdateUserinfoFailure.fromCode(code.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetMasterPassword({
    required String username,
    required String newMasterPassword,
    required String secret,
  }) async {
    try {
      await _apis.resetMasterPassword(
          username: username,
          secret: secret,
          newMasterPassword: newMasterPassword);
      return const Right(unit);
    } on Failure catch (code) {
      return Left(ResetMasterPasswordFailure.fromCode(code.message));
    }
  }

  // @override
  // Future<Either<Failure, UserLocalEntity>> getCurrentLoggedUser() async {
  //   try {
  //     final userModel = await _apis.getCurrentLoggedUser();
  //     return Right(userModel.mapToEntity());
  //   } on Failure catch (failure) {
  //     return Left(GetCurrentLoggedUserFailure.fromCode(failure.message));
  //   }
  // }
}

// class GetCurrentLoggedUserFailure extends Failure {
//   GetCurrentLoggedUserFailure(
//       [super.message = "An unknown exception occurred."]);

//   factory GetCurrentLoggedUserFailure.fromCode(String code) {
//     switch (code) {
//       case "user-not-found":
//         return GetCurrentLoggedUserFailure(
//           "Username is not found, please create an account.",
//         );

//       case "user-not-authorized":
//         return GetCurrentLoggedUserFailure(
//           "The credential received is malformed or has expired.",
//         );
//       default:
//         return GetCurrentLoggedUserFailure();
//     }
//   }
// }

class ResetMasterPasswordFailure extends Failure {
  ResetMasterPasswordFailure(
      [super.message = "An unknown exception occurred."]);

  factory ResetMasterPasswordFailure.fromCode(String code) {
    switch (code) {
      case "something-went-wrong":
        return ResetMasterPasswordFailure(
          "Operation is not allowed. Please contact support.",
        );

      case "user-not-found":
        return ResetMasterPasswordFailure(
          "Username is not found, please create an account.",
        );

      case "invalid-secret":
        return ResetMasterPasswordFailure(
          "The secret received is malformed or incorrect.",
        );
      default:
        return ResetMasterPasswordFailure();
    }
  }
}

class UpdateUserinfoFailure extends Failure {
  UpdateUserinfoFailure([super.message = "An unknown exception occurred."]);

  factory UpdateUserinfoFailure.fromCode(String code) {
    switch (code) {
      case "something-went-wrong":
        return UpdateUserinfoFailure(
          "Operation is not allowed. Please contact support.",
        );

      case "user-not-found":
        return UpdateUserinfoFailure(
          "Username is not found, please create an account.",
        );

      case "user-not-authorized":
        return UpdateUserinfoFailure(
          "The credential received is malformed or has expired.",
        );

      case "invalid-credential":
        return UpdateUserinfoFailure(
          "The credential received is malformed or has expired.",
        );
      default:
        return UpdateUserinfoFailure();
    }
  }
}

class DeleteUserFailure extends Failure {
  DeleteUserFailure([super.message = "An unknown exception occurred."]);

  factory DeleteUserFailure.fromCode(String code) {
    switch (code) {
      case "something-went-wrong":
        return DeleteUserFailure(
          "Operation is not allowed.  Please contact support.",
        );

      case "user-not-authorized":
        return DeleteUserFailure(
          "The credential received is malformed or has expired.",
        );
      default:
        return DeleteUserFailure();
    }
  }
}

class CreateUserFailure extends Failure {
  CreateUserFailure([super.message = "An unknown exception occurred."]);

  factory CreateUserFailure.fromCode(String code) {
    switch (code) {
      case "operation-not-allowed":
        return CreateUserFailure(
          "Operation is not allowed.  Please contact support.",
        );

      case "user-already-in-use-or-empty":
        return CreateUserFailure(
          "An account already exists for that username.",
        );
      default:
        return CreateUserFailure();
    }
  }
}
