import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

class CheckSessionUsecase
    implements IUseCase<Future<Either<Failure, UserLocalEntity>>, NoParams> {
  CheckSessionUsecase({required IAuthRepository iAuthRepository})
      : _iAuthRepository = iAuthRepository;

  final IAuthRepository _iAuthRepository;

  @override
  Future<Either<Failure, UserLocalEntity>> call(NoParams params) =>
      _iAuthRepository.checkSession();
}
