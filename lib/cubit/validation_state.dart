part of 'validation_cubit.dart';

enum ApiStatus { initial, loading, success, error }

class ValidationState extends Equatable {
  const ValidationState({
    this.isValid = false,
    this.apiStatus = ApiStatus.initial,
    this.email = const EmailValidator.pure(),
    this.checkBoxValue = const CheckBoxValidator.pure(),
    this.sliderValue = const SliderValidator.pure(),
    this.dropdownValue = const DropdownValidator.pure(),
    this.dropdownItemList = const [],
    this.switchValue = const RequiredFieldValidator<bool?>.pure(),
    this.radioValue = const RequiredFieldValidator<SuperPower?>.pure(),
    this.chipValue = const RequiredFieldValidator<int?>.pure(),
    this.dateValue = const RequiredFieldValidator<DateTime?>.pure(),
    this.timeValue = const RequiredFieldValidator<TimeOfDay?>.pure(),
  });

  final bool isValid;
  final ApiStatus apiStatus;
  final CheckBoxValidator checkBoxValue;
  final SliderValidator sliderValue;
  final DropdownValidator dropdownValue;
  final List<DropdownModel> dropdownItemList;
  final EmailValidator email;
  final RequiredFieldValidator<bool?> switchValue;
  final RequiredFieldValidator<SuperPower?> radioValue;
  final RequiredFieldValidator<int?> chipValue;
  final RequiredFieldValidator<DateTime?> dateValue;
  final RequiredFieldValidator<TimeOfDay?> timeValue;

  @override
  List<Object> get props => [
        isValid,
        apiStatus,
        email,
        checkBoxValue,
        sliderValue,
        dropdownValue,
        dropdownItemList,
        switchValue,
        radioValue,
        chipValue,
        dateValue,
        timeValue,
      ];

  ValidationState copyWith({
    bool? isValid,
    ApiStatus? apiStatus,
    EmailValidator? email,
    CheckBoxValidator? checkBoxValue,
    SliderValidator? sliderValue,
    DropdownValidator? dropdownValue,
    List<DropdownModel>? dropdownItemList,
    RequiredFieldValidator<bool?>? switchValue,
    RequiredFieldValidator<SuperPower?>? radioValue,
    RequiredFieldValidator<int?>? chipValue,
    RequiredFieldValidator<DateTime?>? dateValue,
    RequiredFieldValidator<TimeOfDay?>? timeValue,
  }) {
    return ValidationState(
      isValid: isValid ?? this.isValid,
      apiStatus: apiStatus ?? this.apiStatus,
      email: email ?? this.email,
      checkBoxValue: checkBoxValue ?? this.checkBoxValue,
      sliderValue: sliderValue ?? this.sliderValue,
      dropdownValue: dropdownValue ?? this.dropdownValue,
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      switchValue: switchValue ?? this.switchValue,
      radioValue: radioValue ?? this.radioValue,
      chipValue: chipValue ?? this.chipValue,
      dateValue: dateValue ?? this.dateValue,
      timeValue: timeValue ?? this.timeValue,
    );
  }
}
