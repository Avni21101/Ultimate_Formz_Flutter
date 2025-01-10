import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';
import 'package:input_field_validation_formz_flutter/validators/slider_validator.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Select The Price Range',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Slider(
              value: state.sliderValue.value ?? 0,
              inactiveColor: Colors.grey,
              activeColor: Colors.blueAccent,
              divisions: 5,
              label: ((state.sliderValue.value ?? 0) * 100).toInt().toString(),
              onChanged: (value) {
                context.read<ValidationCubit>().onSliderChange(value);
              },
            ),
            if (state.sliderValue.displayError != null)
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  state.sliderValue.displayError == SliderValidatorError.required
                      ? 'Please select range.'
                      : 'You have to be member to select highest range.',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
