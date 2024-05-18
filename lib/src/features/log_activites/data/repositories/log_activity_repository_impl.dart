import 'package:dartz/dartz.dart';
import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/log_activites/log_activites.dart';
import 'package:rxdart/rxdart.dart';

class LogActivityRepositoryImpl extends LogActivityRepository {
  LogActivityRepositoryImpl({required ILogActivitiesApis apis}) : _apis = apis {
    _loadAllValues();
  }

  final ILogActivitiesApis _apis;

  final _controller = BehaviorSubject<List<LogActivityEntity>>();

  @override
  Stream<List<LogActivityEntity>> logs() => _controller;

  @override
  Future<Either<Failure, Unit>> deleteAll() async {
    try {
      await _apis.deleteValues();
      await _loadAllValues();
      return const Right(unit);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(LogActivitiesException("Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, Unit>> refreshData() async => await _loadAllValues();

  Future<Either<Failure, Unit>> _loadAllValues() async {
    try {
      final logActivities = await _apis.loadValues();
      final logs = logActivities.map((e) => e.mapToEntity()).toList();
      if (logs.isEmpty) {
        _controller.add(const []);
      } else {
        _controller.add(logs);
      }
      return const Right(unit);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(LogActivitiesException("Something went wrong"));
    }
  }

  @override
  dispose() {
    _controller.close();
  }
}
