import 'package:formz/formz.dart';

enum EmailValidationError { invalid, required }

final class EmailValidator extends FormzInput<String, EmailValidationError> {
  const EmailValidator.pure([super.value = '']) : super.pure();

  const EmailValidator.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    return value == ''
        ? EmailValidationError.required
        : _emailRegExp.hasMatch(value)
            ? null
            : EmailValidationError.invalid;
  }
}
