import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';
import 'package:input_field_validation_formz_flutter/widgets/date_time_container.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  Future<void> _selectTime(BuildContext context) async {
    final pickedValue = await showTimePicker(
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.blueAccent.withOpacity(0.6),
          ),
        ),
        child: child!,
      ),
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (mounted) {
      if (pickedValue != null &&
          pickedValue != context.read<ValidationCubit>().state.timeValue.value) {
        context.read<ValidationCubit>().onTimeChange(pickedValue);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateTimeContainer(
              onTap: () => _selectTime(context),
              label: state.timeValue.value == null
                  ? 'Select Time'
                  : '${state.timeValue.value?.hour} : ${state.timeValue.value?.minute}',
            ),
            if (state.timeValue.displayError != null) ...[
              const SizedBox(height: 8),
              const Text(
                'Please select time',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ],
        );
      },
    );
  }
}
