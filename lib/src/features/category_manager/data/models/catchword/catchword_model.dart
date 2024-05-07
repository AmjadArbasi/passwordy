import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class CatchwordModel extends DataMapperEntity<CatchwordEntity> {
  CatchwordModel({
    this.id,
    required this.name,
    required this.accountId,
    required this.passcode,
    required this.note,
    required this.createdAt,
    required this.whenUsed,
    required this.isVisible,
  });

  final int? id;
  final String name;
  final String accountId;
  final String passcode;
  final String note;
  final DateTime createdAt;
  final DateTime whenUsed;
  final bool isVisible;

  @override
  CatchwordEntity mapToEntity() {
    return CatchwordEntity(
      id: id,
      name: name,
      accountId: accountId,
      passcode: passcode,
      note: note,
      createdAt: createdAt,
      whenUsed: whenUsed,
      isVisible: isVisible,
    );
  }
}
