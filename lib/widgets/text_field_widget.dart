import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';
import 'package:input_field_validation_formz_flutter/validators/email_field_validator.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) {
            context.read<ValidationCubit>().onTextFieldChange(value);
          },
          decoration: InputDecoration(
            hintText: 'Enter Email',
            errorText: state.email.displayError == EmailValidationError.required
                ? 'Email is required'
                : state.email.displayError == EmailValidationError.invalid
                    ? 'Enter valid email.'
                    : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}
