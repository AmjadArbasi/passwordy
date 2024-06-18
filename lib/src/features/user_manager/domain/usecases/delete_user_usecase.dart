import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/user_manager/user_manager.dart';

class DeleteUserUsecase
    implements IUseCase<Future<Either<Failure, Unit>>, NoParams> {
  DeleteUserUsecase({required IUserManagerRepository iUserManagerRepository})
      : _repository = iUserManagerRepository;

  final IUserManagerRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) =>
      _repository.deleteUser();
}
