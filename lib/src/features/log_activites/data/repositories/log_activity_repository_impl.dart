import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/log_activites/log_activites.dart';

class LogActivityRepositoryImpl extends LogActivityRepository {
  LogActivityRepositoryImpl({required ILogActivitiesApis apis}) : _apis = apis;

  final ILogActivitiesApis _apis;

  @override
  Future<Either<Failure, Unit>> deleteAll() async {
    try {
      await _apis.deleteValues();
      return const Right(unit);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(LogActivitiesException("Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<LogActivityEntity>>> loadAllValues() async {
    try {
      final logActivities = await _apis.loadValues();
      final logs = logActivities.map((e) => e.mapToEntity()).toList();
      return Right(logs);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(LogActivitiesException("Something went wrong"));
    }
  }
}
