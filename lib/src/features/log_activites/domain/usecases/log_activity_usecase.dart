import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/log_activites/domain/entities/log_activity_entity.dart';
import 'package:flutter_application_passmanager/src/features/log_activites/domain/repositories/repositories.dart';

class LogActivityUsecase {
  final LogActivityRepository _activityRepository;

  LogActivityUsecase({required LogActivityRepository activityRepository})
      : _activityRepository = activityRepository;

  Future<Either<Failure, Unit>> refreshData() =>
      _activityRepository.refreshData();

  Future<Either<Failure, Unit>> deleteAll() => _activityRepository.deleteAll();

  Stream<List<LogActivityEntity>> logs() => _activityRepository.logs();

  dispose() => _activityRepository.dispose();
}
