import 'package:equatable/equatable.dart';

import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

/// {@template catchwordEntity}
/// A single catchword object
///
/// Contains [id], [name], [accountId], [passcode] and [createdAt]
///
/// [Catchword] is immutable and can be copied using [copyWith],
/// {@endtemplate}
class CatchwordEntity extends Equatable
    implements DataMapperModel<CatchwordModel> {
  /// {@macro catchwordEntity}
  CatchwordEntity({
    required this.name,
    required this.accountId,
    required this.passcode,
    required this.note,
    this.isVisible = false,
    DateTime? createdAt,
    DateTime? whenUsed,
    this.id,
  })  : createdAt = createdAt ?? DateTime.now(),
        whenUsed = whenUsed ?? DateTime.now();

  /// The unique identifier
  ///
  /// can not be empty
  final int? id;

  /// The name of Catchword account
  ///
  /// may not be empty
  final String name;

  /// The accound id of the service
  ///
  /// cant be empty
  final String accountId;

  /// The image path
  /// final String path;

  /// The passcode
  ///
  /// cant be empty
  final String passcode;

  /// The note
  final String note;

  /// The isVisible
  /// initital value is false
  final bool isVisible;

  /// The date of created the catchword
  final DateTime createdAt;

  final DateTime whenUsed;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      accountId,
      passcode,
      note,
      isVisible,
      createdAt,
      whenUsed,
    ];
  }

  ///{@macro Catchword}
  ///
  /// returns the updated copy of the instance

  @override
  CatchwordModel mapToModel() {
    return CatchwordModel(
      id: id,
      name: name,
      accountId: accountId,
      passcode: passcode,
      note: note,
      createdAt: createdAt,
      isVisible: isVisible,
      whenUsed: whenUsed,
    );
  }

  @override
  String toString() {
    return 'CatchwordEntity(id: $id, name: $name, accountId: $accountId, passcode: $passcode, note: $note, isVisible: $isVisible, createdAt: $createdAt, whenUsed: $whenUsed)';
  }

  CatchwordEntity copyWith({
    int? id,
    String? name,
    String? accountId,
    String? passcode,
    String? note,
    bool? isVisible,
    DateTime? createdAt,
    DateTime? whenUsed,
  }) {
    return CatchwordEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      accountId: accountId ?? this.accountId,
      passcode: passcode ?? this.passcode,
      note: note ?? this.note,
      isVisible: isVisible ?? this.isVisible,
      createdAt: createdAt ?? this.createdAt,
      whenUsed: whenUsed ?? this.whenUsed,
    );
  }
}
