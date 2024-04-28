import 'package:isar/isar.dart';

part 'catchword_db_dto.g.dart';

@collection
class CatchwordDbDto {
  CatchwordDbDto({
    this.id,
    required this.name,
    required this.accountId,
    required this.passcode,
    required this.dateTime,
    required this.isVisibile,
    this.whenUsed,
  });

  Id? id = Isar.autoIncrement;

  String name;

  String accountId;

  String passcode;

  bool isVisibile;

  DateTime? whenUsed;

  @Index()
  DateTime dateTime;
}
