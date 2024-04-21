import 'package:flutter_application_passmanager/src/core/utils/converter_db/converter.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/data/datasources/datasources.dart';

class CatchwordModelToDbDtoConverter
    implements Converter<CatchwordModel, CatchwordDbDto> {
  @override
  CatchwordDbDto convert(CatchwordModel source) {
    return CatchwordDbDto(
      id: source.id,
      name: source.name,
      accountId: source.accountId,
      passcode: source.passcode,
      dateTime: source.createdAt,
      isVisibile: source.isVisible,
    );
  }
}

class CatchwordDbDtoToModelConverter
    implements Converter<CatchwordDbDto, CatchwordModel> {
  @override
  CatchwordModel convert(CatchwordDbDto model) {
    return CatchwordModel(
      id: model.id,
      name: model.name,
      accountId: model.accountId,
      passcode: model.passcode,
      createdAt: model.dateTime,
      isVisible: model.isVisibile,
    );
  }
}
