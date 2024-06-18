import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

class CreateUserUsecase
    implements IUseCase<Future<Either<Failure, Unit>>, UserLocalEntity> {
  final IUserManagerRepository _repository;

  CreateUserUsecase({required IUserManagerRepository iUserManagerRepository})
      : _repository = iUserManagerRepository;

  @override
  Future<Either<Failure, Unit>> call(UserLocalEntity params) =>
      _repository.createUser(params);
}
