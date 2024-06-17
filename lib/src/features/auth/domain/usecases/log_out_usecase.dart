import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/auth/auth.dart';

class LogOutUsecase
    implements IUseCase<Future<Either<Exception, Unit>>, NoParams?> {
  LogOutUsecase({required this.iAuthRepository});

  final IAuthRepository iAuthRepository;

  @override
  Future<Either<Failure, Unit>> call(NoParams? params) async =>
      await iAuthRepository.logOut();
}
