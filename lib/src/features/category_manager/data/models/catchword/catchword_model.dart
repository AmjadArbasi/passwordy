import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

part 'catchword_model.g.dart';

@JsonSerializable()
class CatchwordModel extends DataMapperEntity<CatchwordEntity> {
  CatchwordModel({
    this.id,
    required this.name,
    required this.accountId,
    required this.passcode,
    required this.createdAt,
    required this.isVisible,
  });

  final int? id;
  final String name;
  @JsonKey(name: 'account_id')
  final String accountId;
  final String passcode;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final bool isVisible;

  @override
  CatchwordEntity mapToEntity() {
    return CatchwordEntity(
      id: id,
      name: name,
      accountId: accountId,
      passcode: passcode,
      createdAt: createdAt,
      isVisible: isVisible,
    );
  }

  /// Deserializes the given [Map<String, dynamic>] into a [Catchword].
  static CatchwordModel fromJson(Map<String, dynamic> json) =>
      _$CatchwordModelFromJson(json);

  /// Converts this [Catchword] into a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$CatchwordModelToJson(this);

  @override
  String toString() {
    return 'CatchwordModel(id: $id, name: $name, accountId: $accountId, passcode: $passcode, createdAt: $createdAt, isVisibile: $isVisible)';
  }
}
