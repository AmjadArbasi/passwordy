import 'package:flutter_application_passmanager/src/features/log_activites/data/data.dart';

abstract class ILogActivitiesApis {
  Future<List<LogActivityDbDto>> loadValues();

  Future<void> deleteValues();
}
