import 'package:formz/formz.dart';

/// validation on [secret] using Formz
enum SecertValidationError { empty }

/// {@template secret}
/// Form input for an secret input.
/// {@endtemplate}
class Secret extends FormzInput<String, SecertValidationError> {
  /// {@macro secret}
  const Secret.dirty([super.value = '']) : super.dirty();

  /// {@macro secret}
  const Secret.pure() : super.pure('');

  @override
  SecertValidationError? validator(String value) {
    if (value.isEmpty) {
      return SecertValidationError.empty;
    }
    return null;
  }
}
