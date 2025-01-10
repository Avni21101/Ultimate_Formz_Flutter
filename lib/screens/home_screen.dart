import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';
import 'package:input_field_validation_formz_flutter/widgets/check_box_widget.dart';
import 'package:input_field_validation_formz_flutter/widgets/chip_widget.dart';
import 'package:input_field_validation_formz_flutter/widgets/date_picker_widget.dart';
import 'package:input_field_validation_formz_flutter/widgets/dropdown_widget.dart';
import 'package:input_field_validation_formz_flutter/widgets/radio_widget.dart';
import 'package:input_field_validation_formz_flutter/widgets/slider_widget.dart';
import 'package:input_field_validation_formz_flutter/widgets/switch_widget.dart';
import 'package:input_field_validation_formz_flutter/widgets/text_field_widget.dart';
import 'package:input_field_validation_formz_flutter/widgets/time_picker_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation'),
        backgroundColor: Colors.blueAccent.withOpacity(0.4),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(),
              SizedBox(height: 24),
              SwitchWidget(),
              SizedBox(height: 24),
              CheckBoxWidget(),
              SizedBox(height: 24),
              SliderWidget(),
              SizedBox(height: 24),
              DropdownWidget(),
              SizedBox(height: 24),
              ChipWidget(),
              SizedBox(height: 24),
              RadioWidget(),
              SizedBox(height: 24),
              DatePickerWidget(),
              SizedBox(height: 24),
              TimePickerWidget(),
              SizedBox(height: 24),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<ValidationCubit>().onSubmitTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent.withOpacity(0.5),
        minimumSize: const Size(double.infinity, 50),
        overlayColor: Colors.black,
      ),
      child: const Text(
        'Submit',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
