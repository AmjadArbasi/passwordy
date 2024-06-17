import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/common/common.dart';
import 'package:flutter_application_passmanager/src/core/exceptions/failure.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';

class LogInUsecase
    implements IUseCase<Future<Either<Exception, Unit>>, LoginParms> {
  LogInUsecase({required this.iAuthRepository});

  final IAuthRepository iAuthRepository;

  @override
  Future<Either<Failure, Unit>> call(LoginParms params) async =>
      await iAuthRepository.logIn(params.username, params.password);
}
