import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/features.dart';
import 'package:isar/isar.dart';

class LogActivitiesApis implements ILogActivitiesApis {
  LogActivitiesApis({required Isar isar, required SecureStorage secureStorage})
      : _isar = isar,
        _secureStorage = secureStorage;

  final Isar _isar;
  final SecureStorage _secureStorage;

  static const String key = GlobalVar.keyToken;

  @override
  Future<void> deleteValues() async {
    try {
      final token = await _secureStorage.getToken(key);
      final user =
          await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();
      if (user != null) {
        final linker = user.linker;
        final logs = await _isar.logActivitiesDbDtos
            .filter()
            .linkerEqualTo(linker)
            .findFirst();
        if (logs != null) {
          try {
            await _isar.writeTxn(() async {
              final count = await logs.logActivities.filter().deleteAll();
              return count;
            });
          } catch (e) {
            throw LogActivitiesException("Something went wrong");
          }
        } else {
          throw LogActivitiesException("User not authorzied");
        }
      } else {
        throw LogActivitiesException("User not authorzied");
      }
    } catch (e) {
      throw LogActivitiesException("Something went wrong");
    }
  }

  @override
  Future<List<LogActivityDbDto>> loadValues() async {
    try {
      final token = await _secureStorage.getToken(key);
      final user =
          await _isar.userLocalDtos.filter().tokenEqualTo(token).findFirst();
      if (user != null) {
        final linker = user.linker;
        final logs = await _isar.logActivitiesDbDtos
            .filter()
            .linkerEqualTo(linker)
            .findFirst();
        if (logs != null) {
          final result = await logs.logActivities.filter().findAll();
          result.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));
          return result;
        } else {
          throw LogActivitiesException("User not authorzied");
        }
      } else {
        throw LogActivitiesException("User not authorzied");
      }
    } catch (e) {
      throw LogActivitiesException("Something went wrong");
    }
  }
}
