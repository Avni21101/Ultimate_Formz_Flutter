import 'package:formz/formz.dart';

/// Generic Validator Error Enum
enum RequiredFieldValidatorError { required }

/// Generic Validator
class RequiredFieldValidator<T> extends FormzInput<T?, RequiredFieldValidatorError> {
  const RequiredFieldValidator.pure() : super.pure(null);

  const RequiredFieldValidator.dirty([super.value]) : super.dirty();

  @override
  RequiredFieldValidatorError? validator(T? value) {
    if ((value != null) && (value is String)) {
      return value.isEmpty ? RequiredFieldValidatorError.required : null;
    } else if (value != null) {
      return null;
    } else {
      return RequiredFieldValidatorError.required;
    }
  }
}
