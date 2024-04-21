import 'dart:math';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_application_passmanager/src/features/password_generator/data/api/api.dart';

class PassGenRepsotiory implements PassGenApi {
  PassGenRepsotiory();

  late BehaviorSubject<String> _generatedPassword;

  @override
  init() {
    _generatedPassword = BehaviorSubject<String>();
  }

  @override
  Future<String> generatePassword({
    bool useUppercase = true,
    bool useLowercase = true,
    bool useSymbols = true,
    bool useNumber = true,
    int length = 8,
  }) async {
    final random = Random();
    String chars = '';
    String password = '';

    if (useUppercase) chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (useLowercase) chars += 'abcdefghijklmnopqrstuvwxyz';
    if (useSymbols) chars += '@#\$%&_=@#\$%&';
    if (useNumber) chars += '0123456789';

    if (chars.isEmpty) {
      throw PasswordGeneratorEmptyOrShort();
    }

    for (int i = 0; i < length; i++) {
      password += chars[random.nextInt(chars.length)];
    }
    _generatedPassword.add(password);
    return password;
  }

  @override
  Stream<String> getGeneratedPassword() => _generatedPassword;

  @override
  dispose() {
    _generatedPassword.close();
  }
}
