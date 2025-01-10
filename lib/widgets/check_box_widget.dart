import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';
import 'package:input_field_validation_formz_flutter/validators/check_box_validator.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              value: state.checkBoxValue.value ?? false,
              title: const Text('Do you agree to terms and conditions?'),
              onChanged: (value) {
                context.read<ValidationCubit>().onCheckBoxChange(value);
              },
            ),
            if (state.checkBoxValue.displayError != null)
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  state.checkBoxValue.displayError == CheckBoxValidatorError.invalid
                      ? 'Please agree to terms and conditions to continue'
                      : 'Please agree to terms and conditions',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
