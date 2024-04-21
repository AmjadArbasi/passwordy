import 'package:formz/formz.dart';
import 'package:get/get.dart';

enum PasswordValidationError { empty, invalid, tooShort, tooLong }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  // static final _passwordRegex =
  //     RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 4) {
      return PasswordValidationError.tooShort;
    } else if (value.length > 20) {
      return PasswordValidationError.tooLong;
    }
    // else if (!_passwordRegex.hasMatch(value)) {
    //   return PasswordValidationError.invalid;
    // }
    return null;
  }
}

extension PasswordValidator on PasswordValidationError {
  String text() {
    switch (this) {
      case PasswordValidationError.invalid:
        return 'passwordInvalidFormz'.tr;
      case PasswordValidationError.empty:
        return 'passwordEmptyFormz'.tr;
      case PasswordValidationError.tooShort:
        return 'passwordTooShortFormz'.tr;
      case PasswordValidationError.tooLong:
        return 'passwordTooLong'.tr;
    }
  }
}
