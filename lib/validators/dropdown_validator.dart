import 'package:formz/formz.dart';
import 'package:input_field_validation_formz_flutter/widgets/dropdown_widget.dart';

enum DropdownValidatorError { invalid }

final class DropdownValidator extends FormzInput<DropdownModel?, DropdownValidatorError> {
  const DropdownValidator.pure([super.value = const DropdownModel(label: '')]) : super.pure();

  const DropdownValidator.dirty([super.value = const DropdownModel(label: '')]) : super.dirty();

  @override
  DropdownValidatorError? validator(DropdownModel? value) {
    return value?.id != null ? null : DropdownValidatorError.invalid;
  }
}
