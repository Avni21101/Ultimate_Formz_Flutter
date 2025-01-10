import 'package:formz/formz.dart';

enum SliderValidatorError { required, invalid }

final class SliderValidator extends FormzInput<double?, SliderValidatorError> {
  const SliderValidator.pure() : super.pure(null);

  const SliderValidator.dirty([super.value = 0]) : super.dirty();

  @override
  SliderValidatorError? validator(double? value) {
    if (value == null) {
      return SliderValidatorError.required;
    } else if (value == 1) {
      return SliderValidatorError.invalid;
    } else {
      return null;
    }
  }
}
