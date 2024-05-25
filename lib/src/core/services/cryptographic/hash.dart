import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class Hash {
  Hash();

  String hash(String value) {
    // Convert the input value to a list of bytes
    final List<int> bytes = utf8.encode(value);

    // Generate the SHA-256 hash
    final Digest sha256Hash = sha256.convert(bytes);

    return sha256Hash.toString();
  }

  String generateSalt(int length) {
    final rand = Random.secure();
    final bytes = List<int>.generate(length, (_) => rand.nextInt(256));
    return base64Url.encode(bytes);
  }
}
