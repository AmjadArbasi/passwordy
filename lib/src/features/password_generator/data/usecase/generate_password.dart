import 'package:flutter_application_passmanager/src/features/password_generator/data/repsoitory/repsoitory.dart';

class GeneratePassword {
  final PassGenRepsotiory _genRepsotiory;

  const GeneratePassword({required PassGenRepsotiory passGenRepsotiory})
      : _genRepsotiory = passGenRepsotiory;

  Stream<String> getGeneratedPassword() =>
      _genRepsotiory.getGeneratedPassword();

  Future<String> generatePassword({
    bool useUppercase = true,
    bool useLowercase = true,
    bool useSymbols = true,
    bool useNumber = true,
    int length = 8,
  }) async =>
      _genRepsotiory.generatePassword(
        useUppercase: useUppercase,
        useLowercase: useLowercase,
        useSymbols: useSymbols,
        useNumber: useNumber,
        length: length,
      );

  dispose() => _genRepsotiory.dispose();

  init() => _genRepsotiory.init();
}
