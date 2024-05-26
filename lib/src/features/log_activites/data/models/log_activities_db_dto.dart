import 'package:flutter_application_passmanager/src/features/log_activites/data/models/models.dart';
import 'package:flutter_application_passmanager/src/features/login/login.dart';
import 'package:isar/isar.dart';

part 'log_activities_db_dto.g.dart';

@collection
class LogActivitiesDbDto {
  LogActivitiesDbDto();

  Id id = Isar.autoIncrement;

  final logActivities = IsarLinks<LogActivityDbDto>();
  final user = IsarLink<UserLocalDto>();

  @override
  String toString() => 'LogActivitiesDbDto(id: $id)';
}
