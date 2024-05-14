import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class CryptoLocal {
  CryptoLocal._();

  static String generateSalt(int length) {
    final rand = Random.secure();
    final bytes = List<int>.generate(length, (_) => rand.nextInt(256));
    return base64Url.encode(bytes);
  }

  static String hash(String password, String salt) {
    final key = utf8.encode(password);
    final saltBytes = utf8.encode(salt);

    final hmacSha256 = Hmac(sha256, saltBytes);
    final digest = hmacSha256.convert(key);

    return digest.toString();
  }
}
