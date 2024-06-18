import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/common/common.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/failure.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

class UpdateUserinfoUsecase
    implements
        IUseCase<Future<Either<Failure, UserLocalEntity>>,
            UpdateUserInfoParams> {
  UpdateUserinfoUsecase(
      {required IUserManagerRepository iUserManagerRepository})
      : _repository = iUserManagerRepository;

  final IUserManagerRepository _repository;

  @override
  Future<Either<Failure, UserLocalEntity>> call(UpdateUserInfoParams params) =>
      _repository.updateUserinfo(
        displayName: params.displayName,
        masterPassword: params.masterPassword,
        newMasterPassword: params.newMasterPassword,
        newSecret: params.newSecret,
        newSecurityQuestion: params.newSecurityQuestion,
      );
}
