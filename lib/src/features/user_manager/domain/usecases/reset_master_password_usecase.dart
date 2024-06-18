import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/common/common.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/failure.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

class ResetMasterPasswordUsecase
    implements
        IUseCase<Future<Either<Failure, Unit>>, ResetMasterPasswordParams> {
  ResetMasterPasswordUsecase({
    required IUserManagerRepository iUserManagerRepository,
  }) : _iUserManagerRepository = iUserManagerRepository;

  final IUserManagerRepository _iUserManagerRepository;

  @override
  Future<Either<Failure, Unit>> call(ResetMasterPasswordParams params) =>
      _iUserManagerRepository.resetMasterPassword(
        username: params.username,
        newMasterPassword: params.newMasterPassword,
        secret: params.secret,
      );
}
