/// {@template PassGenApi}
/// The interface for an API for generator a password
/// {@endtemplate}
abstract class PassGenApi {
  /// {@macro PassGenApi}
  const PassGenApi();

  /// Create the stream
  init();

  /// Generate password based on arguments
  /// all of them by default are enabled
  /// the default lenght is 8
  Future<String> generatePassword({
    bool useUppercase = true,
    bool useLowercase = true,
    bool useSymbols = true,
    bool useNumber = true,
    int length = 8,
  });

  /// returns a stream of generated password
  Stream<String> getGeneratedPassword();

  /// dispose the stream
  void dispose();
}

final class PasswordGeneratorEmptyOrShort implements Exception {}
