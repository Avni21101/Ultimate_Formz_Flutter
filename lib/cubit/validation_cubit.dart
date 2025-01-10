import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/validators/check_box_validator.dart';
import 'package:input_field_validation_formz_flutter/validators/dropdown_validator.dart';
import 'package:input_field_validation_formz_flutter/validators/email_field_validator.dart';
import 'package:input_field_validation_formz_flutter/validators/required_field_validator.dart';
import 'package:input_field_validation_formz_flutter/validators/slider_validator.dart';
import 'package:input_field_validation_formz_flutter/widgets/dropdown_widget.dart';
import 'package:input_field_validation_formz_flutter/widgets/radio_widget.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(const ValidationState());

  void onTextFieldChange(String? value) {
    final email = EmailValidator.dirty(value ?? '');
    emit(state.copyWith(email: email));
  }

  void onSwitchChange(bool value) {
    final switchValue = RequiredFieldValidator.dirty(value);
    emit(state.copyWith(switchValue: switchValue));
  }

  void onCheckBoxChange(bool? value) {
    final checkBoxValue = CheckBoxValidator.dirty(value);
    emit(state.copyWith(checkBoxValue: checkBoxValue));
  }

  void onSliderChange(double? value) {
    final sliderValue = SliderValidator.dirty(value);
    emit(state.copyWith(sliderValue: sliderValue));
  }

  void onDropdownChange(DropdownModel? value) {
    final dropdownValue = DropdownValidator.dirty(value);
    emit(state.copyWith(dropdownValue: dropdownValue));
  }

  void onRadioChange(SuperPower? value) {
    final radioValue = RequiredFieldValidator.dirty(value);
    emit(state.copyWith(radioValue: radioValue));
  }

  void onChipValueChange(int? value) {
    final chipValue = RequiredFieldValidator.dirty(value);
    emit(state.copyWith(chipValue: chipValue));
  }

  void onDateChange(DateTime? value) {
    final dateValue = RequiredFieldValidator.dirty(value);
    emit(state.copyWith(dateValue: dateValue));
  }

  void onTimeChange(TimeOfDay? value) {
    final timeValue = RequiredFieldValidator.dirty(value);
    emit(state.copyWith(timeValue: timeValue));
  }

  void onSubmitTap() {
    /// validates the value of [email] last stored in state
    final email = EmailValidator.dirty(state.email.value);
    emit(state.copyWith(email: email));

    /// validates the value of [switch] last stored in state
    final switchValue = RequiredFieldValidator.dirty(state.switchValue.value);
    emit(state.copyWith(switchValue: switchValue));

    /// validates the value of [checkbox] last stored in state
    final checkBoxValue = CheckBoxValidator.dirty(state.checkBoxValue.value);
    emit(state.copyWith(checkBoxValue: checkBoxValue));

    /// validates the value of [slider] last stored in state
    final sliderValue = SliderValidator.dirty(state.sliderValue.value);
    emit(state.copyWith(sliderValue: sliderValue));

    /// validates the value of [dropdown] last stored in state
    final dropdownValue = DropdownValidator.dirty(state.dropdownValue.value);
    emit(state.copyWith(dropdownValue: dropdownValue));

    /// validates the value of [chip] last stored in state
    final chipValue = RequiredFieldValidator.dirty(state.chipValue.value);
    emit(state.copyWith(chipValue: chipValue));

    /// validates the value of [radio] last stored in state
    final radioValue = RequiredFieldValidator.dirty(state.radioValue.value);
    emit(state.copyWith(radioValue: radioValue));

    /// validates the value of [date] last stored in state
    final dateValue = RequiredFieldValidator.dirty(state.dateValue.value);
    emit(state.copyWith(dateValue: dateValue));

    /// validates the value of [time] last stored in state
    final timeValue = RequiredFieldValidator.dirty(state.timeValue.value);
    emit(state.copyWith(timeValue: timeValue));
  }
}
