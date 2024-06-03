import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_application_passmanager/src/core/constants/constants.dart';

class Cipher {
  // Cipher({required SecureStorage secureStorage})
  //     : _secureStorage = secureStorage;

  // final SecureStorage _secureStorage;

  // static const _aesGcmKey = GlobalVar.aesGcmKey;
  // static const _ivKey = GlobalVar.ivKey;

  Cipher._();

  // late Key key;
  // late IV _iv;
  // late Encrypter _encrypter;

  // init() async {
  //   /// Retrieve key securely
  //   final storedKey = await _secureStorage.getToken(_aesGcmKey);

  //   /// Retrieve IV securely
  //   final storedIV = await _secureStorage.getToken(_ivKey);

  //   final deriveKey = _deriveKey(storedKey!, 16);
  //   key = Key(Uint8List.fromList(deriveKey));
  //   _iv = IV.fromBase64(storedIV!);
  //   // Create an encrypter with AES-GCM algorithm
  //   _encrypter = Encrypter(AES(key, mode: AESMode.gcm, padding: 'PKCS7'));
  // }

  static String encrypt(String plainText, String pureKey, String pureIV) {
    GlobalVar.logger.f("Try to encrypt this $plainText");

    final keyBytes = sha256.convert(utf8.encode(pureKey)).bytes.sublist(0, 16);
    final key = Key(Uint8List.fromList(keyBytes));
    final iv = IV.fromBase64(pureIV);

    final encrypter = Encrypter(AES(key, mode: AESMode.gcm, padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decrypt(String encryptedText, String pureKey, String pureIV) {
    GlobalVar.logger.f("Try to decrypt this $encryptedText");
    final encrypted = Encrypted.fromBase64(encryptedText);

    final keyBytes = sha256.convert(utf8.encode(pureKey)).bytes.sublist(0, 16);
    final key = Key(Uint8List.fromList(keyBytes));
    final iv = IV.fromBase64(pureIV);

    final encrypter = Encrypter(AES(key, mode: AESMode.gcm, padding: 'PKCS7'));

    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }

  // List<int> _deriveKey(String password, int length) {
  //   final hash = sha256.convert(utf8.encode(password)).bytes;
  //   return hash.sublist(0, length); // Truncate to the desired length
  // }
}
