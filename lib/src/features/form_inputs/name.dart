import 'package:formz/formz.dart';

/// validation on [email] using Formz
enum NameValidationError { invalid }

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Name extends FormzInput<String, NameValidationError> {
  /// {@macro email}
  const Name.pure() : super.pure('');

  /// {@macro email}
  const Name.dirty([super.value = '']) : super.dirty();

  // static final RegExp _nameRegExp = RegExp(
  //   r'^[a-zA-Z0-9-]*$',
  // );

  @override
  NameValidationError? validator(String? value) {
    if (value == null) {
      return null;
    }
    //  else if (_nameRegExp.hasMatch(value)) {
    //   return NameValidationError.invalid;
    // }
    return null;
  }
}
