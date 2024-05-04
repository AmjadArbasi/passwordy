// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catchword_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatchwordModel _$CatchwordModelFromJson(Map<String, dynamic> json) =>
    CatchwordModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      accountId: json['account_id'] as String,
      passcode: json['passcode'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      whenUsed: DateTime.parse(json['whenUsed'] as String),
      isVisible: json['isVisible'] as bool,
    );

Map<String, dynamic> _$CatchwordModelToJson(CatchwordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'account_id': instance.accountId,
      'passcode': instance.passcode,
      'created_at': instance.createdAt.toIso8601String(),
      'whenUsed': instance.whenUsed.toIso8601String(),
      'isVisible': instance.isVisible,
    };
