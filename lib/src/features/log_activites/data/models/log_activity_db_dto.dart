import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/log_activites/log_activites.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

part 'log_activity_db_dto.g.dart';

@collection
class LogActivityDbDto implements DataMapperEntity<LogActivityEntity> {
  LogActivityDbDto();

  Id id = Isar.autoIncrement;

  String? name;
  String? operation;
  String? pathImage;
  DateTime? dateTime;

  @override
  String toString() {
    return 'LogActivitiesDbDto(name: $name, operation: $operation, pathImage: $pathImage, dateTime: $dateTime)';
  }

  @override
  LogActivityEntity mapToEntity() {
    final date = dateTime == null
        ? ""
        : DateFormat('yyyy-MM-dd–kk:mm').format(dateTime!);

    return LogActivityEntity(
      id: id,
      name: name ?? "",
      operation: operation ?? "",
      pathImage: pathImage ?? "",
      dateTime: date,
    );
  }
}
