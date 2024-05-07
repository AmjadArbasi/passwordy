import 'package:flutter_application_passmanager/src/core/utils/converter_db/converter.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

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
      note: source.note,
      isVisibile: source.isVisible,
      whenUsed: source.whenUsed,
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
      note: model.note,
      createdAt: model.dateTime,
      isVisible: model.isVisibile,
      whenUsed: model.whenUsed!,
    );
  }
}
