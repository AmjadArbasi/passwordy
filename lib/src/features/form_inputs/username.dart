import 'package:formz/formz.dart';

/// validation on [username] using Formz
enum UsernameValidationError { invalid, empty }

/// {@template username}
/// Form input for an username input.
/// {@endtemplate}
class Username extends FormzInput<String, UsernameValidationError> {
  /// {@macro username}
  const Username.pure() : super.pure('');

  /// {@macro username}
  const Username.dirty([super.value = '']) : super.dirty();

  // static final RegExp _UsernameRegExp = RegExp(
  //   r'^[a-zA-Z0-9-]*$',
  // );

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) {
      return UsernameValidationError.empty;
    }
    //  else if (_UsernameRegExp.hasMatch(value)) {
    //   return UsernameValidationError.invalid;
    // }
    return null;
  }
}
