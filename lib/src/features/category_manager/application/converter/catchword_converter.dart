import 'package:flutter_application_passmanager/src/core/core.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class CatchwordConverterDbDTOModel {
  final SecureStorage _secureStorage;

  CatchwordConverterDbDTOModel({required SecureStorage secureStorage})
      : _secureStorage = secureStorage;

  CatchwordDbDto convertModelToDbDto(CatchwordModel catchwordModel) {
    return CatchwordDbDto(
      id: catchwordModel.id,
      name: catchwordModel.name,
      accountId: catchwordModel.accountId,
      passcode: catchwordModel.passcode,
      dateTime: catchwordModel.createdAt,
      note: catchwordModel.note,
      isVisibile: catchwordModel.isVisible,
      whenUsed: catchwordModel.whenUsed,
    );
  }

  Future<CatchwordModel> convertDbDtoToModel(
      CatchwordDbDto catchwordDbDto) async {
    final cipher = Cipher(secureStorage: _secureStorage);
    await cipher.init();

    return CatchwordModel(
      id: catchwordDbDto.id,
      name: cipher.decrypt(catchwordDbDto.name),
      accountId: cipher.decrypt(catchwordDbDto.accountId),
      passcode: cipher.decrypt(catchwordDbDto.passcode),
      note: cipher.decrypt(catchwordDbDto.note),
      createdAt: catchwordDbDto.dateTime,
      isVisible: catchwordDbDto.isVisibile,
      whenUsed: catchwordDbDto.whenUsed!,
    );
  }
}
