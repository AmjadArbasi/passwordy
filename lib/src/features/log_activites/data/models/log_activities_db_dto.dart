import 'package:flutter_application_passmanager/src/features/log_activites/data/models/models.dart';
import 'package:isar/isar.dart';

part 'log_activities_db_dto.g.dart';

@collection
class LogActivitiesDbDto {
  LogActivitiesDbDto();

  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? linker;

  final logActivities = IsarLinks<LogActivityDbDto>();

  @override
  String toString() => 'LogActivitiesDbDto(id: $id, linker: $linker)';
}
