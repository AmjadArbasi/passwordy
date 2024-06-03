import 'package:flutter_application_passmanager/src/core/services/cryptographic/cipher.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class CatchwordConverterDbDTOModel {
  CatchwordConverterDbDTOModel();

  CatchwordDbDto convertModelToDbDto(
      CatchwordModel catchwordModel, String key, String iv) {
    return CatchwordDbDto(
      id: catchwordModel.id,
      name: Cipher.encrypt(catchwordModel.name, key, iv),
      accountId: Cipher.encrypt(catchwordModel.accountId, key, iv),
      passcode: Cipher.encrypt(catchwordModel.passcode, key, iv),
      note: Cipher.encrypt(catchwordModel.note, key, iv),
      dateTime: catchwordModel.createdAt,
      isVisible: catchwordModel.isVisible,
      whenUsed: catchwordModel.whenUsed,
    );
  }

  CatchwordModel convertDbDtoToModel(
      CatchwordDbDto catchwordDbDto, String key, String iv) {
    return CatchwordModel(
      id: catchwordDbDto.id,
      name: Cipher.decrypt(catchwordDbDto.name, key, iv),
      accountId: Cipher.decrypt(catchwordDbDto.accountId, key, iv),
      passcode: Cipher.decrypt(catchwordDbDto.passcode, key, iv),
      note: Cipher.decrypt(catchwordDbDto.note, key, iv),
      createdAt: catchwordDbDto.dateTime,
      isVisible: catchwordDbDto.isVisible,
      whenUsed: catchwordDbDto.whenUsed!,
    );
  }
}
