import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/log_activites/domain/entities/log_activity_entity.dart';

abstract class LogActivityRepository {
  Future<Either<Failure, Unit>> refreshData();

  Future<Either<Failure, Unit>> deleteAll();

  Stream<List<LogActivityEntity>> logs();

  dispose();
}
