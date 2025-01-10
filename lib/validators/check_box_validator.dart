import 'package:formz/formz.dart';

enum CheckBoxValidatorError { required, invalid }

final class CheckBoxValidator extends FormzInput<bool?, CheckBoxValidatorError> {
  const CheckBoxValidator.pure() : super.pure(null);

  const CheckBoxValidator.dirty([super.value = false]) : super.dirty();

  @override
  CheckBoxValidatorError? validator(bool? value) {
    if (value == null) {
      return CheckBoxValidatorError.required;
    } else if (value == false) {
      return CheckBoxValidatorError.invalid;
    } else {
      return null;
    }
  }
}
