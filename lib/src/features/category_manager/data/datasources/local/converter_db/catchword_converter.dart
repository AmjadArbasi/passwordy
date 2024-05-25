import 'package:flutter_application_passmanager/src/core/services/services.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class CatchwordConverterDbDTOModel {
  CatchwordConverterDbDTOModel({required SecureStorage secureStorage})
      : _secureStorage = secureStorage;

  final SecureStorage _secureStorage;
  late Cipher cipher;

  Future<CatchwordDbDto> convertModelToDbDto(
      CatchwordModel catchwordModel) async {
    final cipher = Cipher(secureStorage: _secureStorage);
    await cipher.init();

    final encryptedName = cipher.encrypt(catchwordModel.name);
    final encryptedPasscode = cipher.encrypt(catchwordModel.passcode);
    final encryptedAccountId = cipher.encrypt(catchwordModel.accountId);
    final encryptedNote = cipher.encrypt(catchwordModel.note);

    return CatchwordDbDto(
      id: catchwordModel.id,
      name: encryptedName,
      accountId: encryptedAccountId,
      passcode: encryptedPasscode,
      dateTime: catchwordModel.createdAt,
      note: encryptedNote,
      isVisibile: catchwordModel.isVisible,
      whenUsed: catchwordModel.whenUsed,
    );
  }

  Future<CatchwordModel> convertDbDtoToModel(
      CatchwordDbDto catchwordDbDto) async {
    final cipher = Cipher(secureStorage: _secureStorage);
    await cipher.init();

    final decryptedName = cipher.decrypt(catchwordDbDto.name);
    final decryptedPasscode = cipher.decrypt(catchwordDbDto.passcode);
    final decryptedAccountId = cipher.decrypt(catchwordDbDto.accountId);
    final decryptedNote = cipher.decrypt(catchwordDbDto.note);

    return CatchwordModel(
      id: catchwordDbDto.id,
      name: decryptedName,
      accountId: decryptedAccountId,
      passcode: decryptedPasscode,
      note: decryptedNote,
      createdAt: catchwordDbDto.dateTime,
      isVisible: catchwordDbDto.isVisibile,
      whenUsed: catchwordDbDto.whenUsed!,
    );
  }
}
