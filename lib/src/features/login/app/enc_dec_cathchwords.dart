import 'package:flutter_application_passmanager/src/core/services/cryptographic/cipher.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class EncDecCathchwords {
  EncDecCathchwords({
    required this.oldKey,
    required this.newKey,
    required this.iv,
  });

  final String oldKey;
  final String newKey;
  final String iv;

  CatchwordDbDto enc(CatchwordDbDto catchword) {
    return CatchwordDbDto(
      id: catchword.id,
      name: Cipher.encrypt(catchword.name, newKey, iv),
      accountId: Cipher.encrypt(catchword.accountId, newKey, iv),
      passcode: Cipher.encrypt(catchword.passcode, newKey, iv),
      note: Cipher.encrypt(catchword.note, newKey, iv),
      dateTime: catchword.dateTime,
      whenUsed: catchword.whenUsed,
      isVisible: catchword.isVisible,
    );
  }

  CatchwordDbDto dec(CatchwordDbDto catchword) {
    return CatchwordDbDto(
      id: catchword.id,
      name: Cipher.decrypt(catchword.name, oldKey, iv),
      accountId: Cipher.decrypt(catchword.accountId, oldKey, iv),
      passcode: Cipher.decrypt(catchword.passcode, oldKey, iv),
      note: Cipher.decrypt(catchword.note, oldKey, iv),
      dateTime: catchword.dateTime,
      whenUsed: catchword.whenUsed,
      isVisible: catchword.isVisible,
    );
  }
}
